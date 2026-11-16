import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// 既定のスタンプ（ぴくたーちゃんの英語のスタンプ）。サーバーの lib/default-stickers.ts と同じ並び
const defaultStickerUrls = [
  'https://files.aipictors.com/c478173d-45d1-4792-b51f-c0973f9579cd', // Thanks!
  'https://files.aipictors.com/bf84ac49-6a0c-4067-b119-fca939d29793', // Love it!
  'https://files.aipictors.com/47865721-a488-4c0e-a435-fc3a2f89957c', // Nice!
  'https://files.aipictors.com/475b66e8-12d9-4b09-96fd-46506ebbeadb', // Wow!
  'https://files.aipictors.com/84f1759d-6e5b-4506-934f-f25fd7552202', // Hello!
];

/// 以前の既定のスタンプ（id 0〜4）。設定でオンにした人だけ「マイスタンプ」に出る
const legacyDefaultStickerUrls = [
  'https://files.aipictors.com/431f3f95-a4e2-4763-a808-dffe8943d037',
  'https://files.aipictors.com/bfa27f23-e028-479d-aeae-6949df17c87c',
  'https://files.aipictors.com/cbd72227-1a9a-441c-9f4b-e43dcb2a1c6d',
  'https://files.aipictors.com/5a52ef25-f89e-400c-9bce-859162be8f38',
  'https://files.aipictors.com/c50e322f-4450-4a40-91fa-d5ec8104cc67',
];

/// スタンプの設定の中身（見本とスイッチ 2 つ）。オフのほうの見本は薄くする
class StickerSettingsList extends StatelessWidget {
  const StickerSettingsList({
    super.key,
    required this.isHideDefault,
    required this.isShowLegacy,
    required this.onHideDefaultChanged,
    required this.onShowLegacyChanged,
  });

  final bool isHideDefault;
  final bool isShowLegacy;
  final ValueChanged<bool>? onHideDefaultChanged;
  final ValueChanged<bool>? onShowLegacyChanged;

  Widget _preview(String key, List<String> urls, {required bool dimmed}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s12),
      child: Opacity(
        key: ValueKey(key),
        opacity: dimmed ? 0.3 : 1,
        child: Wrap(spacing: Ds.s8, runSpacing: Ds.s8, children: [
          for (final url in urls) AppImage(url, width: 56, height: 56, fit: BoxFit.contain, radius: 8, memCacheWidth: 168),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(bottom: 60), children: [
      SettingsGroup(
        title: tr('デフォルトのスタンプ', 'Default stickers'),
        footer: tr('コメントのスタンプの「マイスタンプ」の最初に出る、ぴくたーちゃんのスタンプです。', 'Pictor-chan stickers shown first in "My stickers" when you comment.'),
        children: [
          _preview('default-preview', defaultStickerUrls, dimmed: isHideDefault),
          SettingsSwitch(
            label: tr('デフォルトのスタンプを表示しない', 'Hide default stickers'),
            value: isHideDefault,
            onChanged: onHideDefaultChanged,
          ),
        ],
      ),
      SettingsGroup(
        title: tr('以前のデフォルトのスタンプ', 'Previous default stickers'),
        footer: tr('オンにすると、以前からある 5 つのスタンプを「マイスタンプ」に足します。', 'Turn on to add the 5 older stickers to "My stickers".'),
        children: [
          _preview('legacy-preview', legacyDefaultStickerUrls, dimmed: !isShowLegacy),
          SettingsSwitch(
            label: tr('以前のデフォルトのスタンプも使う', 'Also use previous default stickers'),
            value: isShowLegacy,
            onChanged: onShowLegacyChanged,
          ),
        ],
      ),
    ]);
  }
}
