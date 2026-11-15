import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const deco = AvatarFrame(frameType: AvatarFrame.typeDecoration, overlayImageUrl: 'https://example.com/deco/crown.webp');

  Future<Rect> overlayRect(WidgetTester tester, {required bool overflow}) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(child: UserAvatar(url: null, frame: deco, size: 100, decorationOverflow: overflow)),
      ),
    ));
    final avatar = tester.getRect(find.byType(UserAvatar));
    expect(avatar.size, const Size(100, 100));
    final overlay = tester.getRect(find.byType(CachedNetworkImage).last);
    return overlay.shift(-avatar.topLeft);
  }

  testWidgets('装飾の枠は既定で箱の中にほぼ収まる（一覧やカードの端で切れない）', (tester) async {
    final r = await overlayRect(tester, overflow: false);
    expect(r.left, greaterThanOrEqualTo(-4));
    expect(r.right, lessThanOrEqualTo(104));
  });

  testWidgets('プロフィールの見出しは Web と同じく 148.4% まで広げる', (tester) async {
    final r = await overlayRect(tester, overflow: true);
    expect(r.width, closeTo(148.4, 0.5));
  });
}
