import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

/// 選べるアイコン枠
class FrameOption {
  const FrameOption({required this.id, required this.name, required this.slug, required this.frame, required this.requiredPassType, required this.priceCoins});

  factory FrameOption.fromJson(Map<String, dynamic> j) => FrameOption(
        id: j.str('id'),
        name: j.str('name'),
        slug: j.str('slug'),
        frame: AvatarFrame.fromJson(j)!,
        requiredPassType: j.strOrNull('requiredPassType'),
        priceCoins: j['priceCoins'] is num ? (j['priceCoins'] as num).toInt() : null,
      );

  final String id;
  final String name;
  final String slug;
  final AvatarFrame frame;
  final String? requiredPassType;
  final int? priceCoins;
}

const _passRank = {'LITE': 1, 'STANDARD': 2, 'PREMIUM': 3};

/// 今使える枠か（Web の toUserAvatarFrameAccess が AVAILABLE）。コインの枠は買った人だけ、プランの枠はそのプラン以上の間だけ
bool isFrameAvailable({required String id, required String? requiredPassType, required int? priceCoins, required String? currentPassType, required Set<String> ownedIds}) {
  if (priceCoins != null) return ownedIds.contains(id);
  return (_passRank[currentPassType] ?? 0) >= (_passRank[requiredPassType] ?? 0);
}

/// アイコン枠を選ぶ（Web の AvatarFrameStudio の「使える枠」。アプリでは買えないので、持っている・プランで使える枠だけ）。
/// 変えたら選んだ枠（枠なしは null）を返す。閉じたら何も返さない
Future<({AvatarFrame? frame})?> showAvatarFrameSheet(BuildContext context, {required String? iconUrl}) {
  return showModalBottomSheet<({AvatarFrame? frame})>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (_) => FractionallySizedBox(heightFactor: 0.85, child: _AvatarFrameSheet(iconUrl: iconUrl)),
  );
}

class _AvatarFrameSheet extends StatefulWidget {
  const _AvatarFrameSheet({required this.iconUrl});

  final String? iconUrl;

  @override
  State<_AvatarFrameSheet> createState() => _AvatarFrameSheetState();
}

class _AvatarFrameSheetState extends State<_AvatarFrameSheet> {
  List<FrameOption>? _frames;
  String? _appliedId;
  String? _previewId;
  String? _error;
  bool _saving = false;

  static const _fields = 'id slug name requiredPassType priceCoins frameType backgroundStyle overlayImageUrl borderPadding';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final data = await Api.query('''
query AppProfileAvatarFrameSettings {
  viewer { id currentPass { id type } }
  userSetting { id selectedUserAvatarFrame { id } }
  viewerOwnedUserAvatarFrameIds
  userAvatarFrames { $_fields }
}''');
      final owned = (data['viewerOwnedUserAvatarFrameIds'] as List? ?? const []).map((e) => e.toString()).toSet();
      final pass = data.obj('viewer')?.obj('currentPass')?.strOrNull('type');
      final frames = data
          .list('userAvatarFrames')
          .map(FrameOption.fromJson)
          .where((f) => isFrameAvailable(id: f.id, requiredPassType: f.requiredPassType, priceCoins: f.priceCoins, currentPassType: pass, ownedIds: owned))
          .toList();
      if (!mounted) return;
      final applied = data.obj('userSetting')?.obj('selectedUserAvatarFrame')?.strOrNull('id');
      setState(() {
        _frames = frames;
        _appliedId = applied;
        _previewId = applied;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  FrameOption? get _preview => _frames?.where((f) => f.id == _previewId).firstOrNull;

  Future<void> _apply() async {
    setState(() => _saving = true);
    try {
      await SettingsApi.updateSetting({'selectedUserAvatarFrameId': _previewId});
      Api.clearCache();
      if (!mounted) return;
      Ds.success();
      context.toast(tr('アイコン枠を変更しました', 'Avatar frame updated'));
      Navigator.of(context).pop((frame: _preview?.frame));
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message.isEmpty ? tr('変更できませんでした', 'Could not update') : e.message, error: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final frames = _frames;
    if (frames == null) {
      return _error != null ? Center(child: StateView.error(_error!, onRetry: _load)) : const Center(child: CircularProgressIndicator());
    }
    final preview = _preview;
    final isApplied = _previewId == _appliedId;
    return Column(children: [
      Text(tr('アイコン枠', 'Avatar frame'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
      const SizedBox(height: Ds.s16),
      UserAvatar(url: widget.iconUrl, frame: preview?.frame, size: 96, animateDecoration: true),
      const SizedBox(height: Ds.s8),
      Text(preview?.name ?? tr('枠なし', 'No frame'), style: const TextStyle(fontWeight: FontWeight.w700)),
      const SizedBox(height: Ds.s4),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Ds.s24),
        child: Text(
          tr('持っている枠と、いまのプランで使える枠を選べます。', 'Choose from frames you own and frames included in your plan.'),
          textAlign: TextAlign.center,
          style: TextStyle(color: context.muted, fontSize: 12),
        ),
      ),
      const SizedBox(height: Ds.s12),
      Expanded(
        child: GridView.count(
          crossAxisCount: MediaQuery.sizeOf(context).width >= 600 ? 6 : 4,
          padding: const EdgeInsets.symmetric(horizontal: Ds.s16, vertical: Ds.s8),
          mainAxisSpacing: Ds.s12,
          crossAxisSpacing: Ds.s12,
          childAspectRatio: 0.78,
          children: [
            _tile(context, id: null, name: tr('枠なし', 'No frame'), frame: null),
            for (final f in frames) _tile(context, id: f.id, name: f.name, frame: f.frame),
          ],
        ),
      ),
      SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s8),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              onPressed: _saving || isApplied ? null : _apply,
              child: Text(isApplied ? tr('使用中です', 'In use') : (_previewId == null ? tr('枠をはずす', 'Remove frame') : tr('この枠にする', 'Use this frame'))),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _tile(BuildContext context, {required String? id, required String name, required AvatarFrame? frame}) {
    final selected = _previewId == id;
    return Pressable(
      onTap: () => setState(() => _previewId = id),
      child: Column(children: [
        AnimatedContainer(
          duration: Ds.fast,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: selected ? context.cs.primary : Colors.transparent, width: 2.5),
          ),
          child: UserAvatar(url: widget.iconUrl, frame: frame, size: 56),
        ),
        const SizedBox(height: Ds.s4),
        Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: selected ? FontWeight.w700 : FontWeight.w500)),
        if (id == _appliedId) Text(tr('使用中', 'In use'), style: TextStyle(fontSize: 10, color: context.cs.primary, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}
