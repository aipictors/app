#!/bin/zsh
# 使い方: integration_test/run.sh <端末ID> <テスト名（logged_in / logged_out）> [ログと画像の置き場所]
# 審査用アカウントは ~/.config/aipictors/app-review.env から読む（表示もコミットもしない）。
# Android のデバッグビルドは src/debug/google-services.json にこのパッケージの登録がなくて失敗するので、実行の間だけ外す。
set -u
source ~/.local/app-build-env.sh
. ~/.config/aipictors/app-review.env
DEVICE=$1; NAME=$2; OUT=${3:-/tmp/aipictors-qa/$NAME}
cd "${0:A:h}/.."
mkdir -p "$OUT"
LOG="$OUT/run.log"; : > "$LOG"
export ANDROID_HOME=${ANDROID_HOME:-$HOME/.local/android-sdk}
export JAVA_HOME=${JAVA_HOME:-$HOME/.local/jdk-21.0.13+9/Contents/Home}
ADB=$ANDROID_HOME/platform-tools/adb
case $DEVICE in emulator-*) PLATFORM=android ;; *) PLATFORM=ios ;; esac
GS=android/app/src/debug/google-services.json
if [ $PLATFORM = android ] && [ -f $GS ]; then
  mv $GS /tmp/aipictors-debug-google-services.json
  trap 'mv /tmp/aipictors-debug-google-services.json '"$PWD/$GS" EXIT
  flutter pub get >/dev/null 2>&1
  # どのフレーバーでも com.aipictors.app の登録が要る
  cp android/app/src/production/google-services.json android/app/google-services.json
fi
LOGIN_DEFINE="$LOGIN:$PASSWORD"; [ "$NAME" = logged_out ] && LOGIN_DEFINE=logout
(
  tail -n 0 -F "$LOG" 2>/dev/null | while IFS= read -r line; do
    case "$line" in
      *"[QA] SHOT "*)
        S=${line##*\[QA\] SHOT }
        if [ $PLATFORM = android ]; then $ADB -s $DEVICE exec-out screencap -p > "$OUT/$S.png"
        else xcrun simctl io $DEVICE screenshot "$OUT/$S.png" >/dev/null 2>&1; fi ;;
      *"[QA] KEY back"*) [ $PLATFORM = android ] && $ADB -s $DEVICE shell input keyevent KEYCODE_BACK ;;
    esac
  done
) &
WATCH=$!
flutter test "integration_test/${NAME}_test.dart" -d "$DEVICE" --no-pub \
  --dart-define-from-file=dart_defines/production.json \
  --dart-define=debugLogin="$LOGIN_DEFINE" --dart-define=postDryRun=true \
  --dart-define=qaLogin="$LOGIN" --dart-define=qaPassword="$PASSWORD" \
  ${=QA_EXTRA:-} >> "$LOG" 2>&1
CODE=$?
kill $WATCH 2>/dev/null
grep -E '\[QA\] (RESULT|FAILED)' "$LOG" | cut -c1-300
echo "exit $CODE log $LOG"
exit $CODE
