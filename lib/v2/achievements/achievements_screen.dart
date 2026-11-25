import 'package:aipictors/v2/achievements/achievement_ui.dart';
import 'package:aipictors/v2/achievements/achievements_api.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

const _categories = <(String?, String)>[
  (null, 'すべて'),
  ('CREATE', '創作'),
  ('COMMUNITY', '閲覧・交流'),
  ('LOGIN', 'ログイン'),
  ('MASTERY', 'やり込み'),
  ('SPECIAL', '特別'),
];

/// 実績（Web の /achievements）。[userId] が null なら自分
class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key, this.userId});

  final String? userId;

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  AchievementSummary? _summary;
  List<Achievement> _items = const [];
  bool _loading = true;
  String? _error;
  int _category = 0;

  bool get _isViewer => widget.userId == null;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final (summary, items) = await AchievementsApi.page(widget.userId);
      if (!mounted) return;
      setState(() {
        _summary = summary;
        _items = items;
        _loading = false;
        _error = null;
      });
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = _summary;
    final key = _categories[_category].$1;
    final items = _items.where((a) => key == null || a.category == key).toList()
      ..sort((a, b) {
        if (a.isUnlocked != b.isUnlocked) return a.isUnlocked ? -1 : 1;
        return (b.unlockedAt ?? 0).compareTo(a.unlockedAt ?? 0);
      });
    return Scaffold(
      appBar: AppBar(title: const Text('実績', style: TextStyle(fontWeight: FontWeight.w800))),
      body: _loading
          ? const SkeletonList(count: 8)
          : _error != null
              ? Center(child: StateView.error(_error!, onRetry: _load))
              : s == null
                  ? Center(child: StateView.empty('この人は実績を表示しない設定にしています', icon: Icons.emoji_events_outlined))
                  : AppRefresh(
                      onRefresh: _load,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                        padding: const EdgeInsets.only(bottom: 80),
                        itemCount: items.length + 1,
                        itemBuilder: (context, i) {
                          if (i == 0) {
                            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              _SummaryCard(summary: s),
                              if (_isViewer) const _AchievementSettingsGroup(),
                              const SizedBox(height: Ds.s16),
                              PillTabs(
                                labels: [for (final c in _categories) c.$2],
                                index: _category,
                                onChanged: (v) => setState(() => _category = v),
                              ),
                              const SizedBox(height: Ds.s8),
                              if (items.isEmpty) StateView.empty('この種類の実績はありません', icon: Icons.emoji_events_outlined, compact: true),
                            ]);
                          }
                          return _AchievementRow(item: items[i - 1]);
                        },
                      ),
                    ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.summary});

  final AchievementSummary summary;

  @override
  Widget build(BuildContext context) {
    final s = summary;
    final level = achievementLevelTier(s.level);
    final next = level.next;
    Widget stat(IconData icon, String value, String label) => Expanded(
          child: Column(children: [
            Icon(icon, size: 20, color: Ds.gold),
            const SizedBox(height: Ds.s4),
            FittedBox(fit: BoxFit.scaleDown, child: Text(value, maxLines: 1, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16))),
            Text(label, style: TextStyle(color: context.muted, fontSize: 11)),
          ]),
        );
    return Container(
      margin: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, 0),
      padding: const EdgeInsets.all(Ds.s16),
      decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(20), border: Border.all(color: context.hairline)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          AchievementLevelIcon(tier: level.tier, size: 30),
          const SizedBox(width: Ds.s8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Lv.${s.level}', style: context.tt.headlineSmall?.copyWith(fontWeight: FontWeight.w900, height: 1.1)),
            Text(
              next == null ? level.tier.label : tr('${level.tier.name}・Lv.${next.minLevel} で${next.name}', '${level.tier.enName} · ${next.enName} at Lv.${next.minLevel}'),
              style: TextStyle(color: context.muted, fontSize: 11.5),
            ),
          ]),
          const Spacer(),
          Text('${s.points} / ${s.nextLevelPoints} pt', style: TextStyle(color: context.muted, fontSize: 12.5, fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: Ds.s8),
        ClipRRect(
          borderRadius: Ds.br(4),
          child: LinearProgressIndicator(value: s.levelProgress, minHeight: 7, backgroundColor: context.skeleton, valueColor: const AlwaysStoppedAnimation(Ds.gold)),
        ),
        const SizedBox(height: Ds.s16),
        Row(children: [
          stat(Icons.emoji_events_rounded, '${s.unlockedCount}/${s.totalCount}', '取得した実績'),
          stat(Icons.local_fire_department_rounded, '${s.currentStreak}日', '連続ログイン'),
          stat(Icons.military_tech_rounded, '${s.longestStreak}日', '最長連続'),
          stat(Icons.calendar_month_rounded, '${s.loginDays}日', 'ログイン日数'),
        ]),
        // 自慢のバッジ（Web の実績ページと同じ）
        if (s.featured.isNotEmpty) ...[
          const SizedBox(height: Ds.s12),
          Divider(height: 1, color: context.hairline),
          const SizedBox(height: Ds.s12),
          Text(tr('自慢のバッジ', 'Showcase'), style: TextStyle(color: context.muted, fontSize: 11.5, fontWeight: FontWeight.w800)),
          const SizedBox(height: Ds.s8),
          Wrap(spacing: Ds.s8, runSpacing: Ds.s8, children: [
            for (final a in s.featured) AchievementBadge(achievementKey: a.key, tier: a.tier, isHidden: a.isHidden, isUnlocked: true, size: 52),
          ]),
        ],
      ]),
    );
  }
}

class _AchievementRow extends StatelessWidget {
  const _AchievementRow({required this.item});

  final Achievement item;

  @override
  Widget build(BuildContext context) {
    final a = item;
    final tier = achievementTier(a.tier);
    final color = (context.isDark ? tier.darkText : tier.text).first;
    final target = a.progressTarget;
    final current = a.progressCurrent;
    final showProgress = !a.isUnlocked && !a.isMasked && target != null && target > 0 && current != null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AchievementBadge(achievementKey: a.key, tier: a.tier, isHidden: a.isHidden, isUnlocked: a.isUnlocked, size: 56),
        const SizedBox(width: Ds.s12),
        Expanded(
          child: Opacity(
            opacity: a.isUnlocked ? 1 : 0.72,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(a.isMasked ? '？？？' : a.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5)),
              const SizedBox(height: 2),
              Text(a.isMasked ? '隠し実績です。条件を満たすと分かります' : a.description, style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.35)),
              if (showProgress) ...[
                const SizedBox(height: Ds.s6),
                Row(children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: Ds.br(3),
                      child: LinearProgressIndicator(value: (current / target).clamp(0.0, 1.0), minHeight: 5, backgroundColor: context.skeleton, valueColor: AlwaysStoppedAnimation(color)),
                    ),
                  ),
                  const SizedBox(width: Ds.s8),
                  Text('$current / $target', style: TextStyle(color: context.muted, fontSize: 11)),
                ]),
              ],
              const SizedBox(height: Ds.s4),
              Wrap(spacing: Ds.s8, crossAxisAlignment: WrapCrossAlignment.center, children: [
                AchievementTierChip(a.tier),
                Text('${a.points}pt', style: TextStyle(color: context.muted, fontSize: 11.5)),
                if (a.rewardCoins > 0) Text('${a.rewardCoins}コイン', style: TextStyle(color: context.muted, fontSize: 11.5)),
                if (a.rarity != null) Text('取得率 ${(a.rarity! * 100).toStringAsFixed(1)}%', style: TextStyle(color: context.muted, fontSize: 11.5)),
              ]),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _AchievementSettingsGroup extends StatefulWidget {
  const _AchievementSettingsGroup();

  @override
  State<_AchievementSettingsGroup> createState() => _AchievementSettingsGroupState();
}

class _AchievementSettingsGroupState extends State<_AchievementSettingsGroup> {
  AchievementSettings? _s;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    AchievementsApi.settings().then((s) {
      if (mounted) setState(() => _s = s);
    }).catchError((_) {});
  }

  Future<void> _update(AchievementSettings next) async {
    final before = _s;
    setState(() {
      _s = next;
      _saving = true;
    });
    try {
      await AchievementsApi.updateSettings(next);
    } on ApiException catch (e) {
      if (mounted) {
        setState(() => _s = before);
        context.toast(e.message, error: true);
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = _s;
    if (s == null) return const SizedBox.shrink();
    return SettingsGroup(children: [
      SettingsSwitch(
        label: 'プロフィールに実績を表示する',
        value: !s.isHiddenOnProfile,
        onChanged: _saving ? null : (v) => _update(AchievementSettings(isHiddenOnProfile: !v, isUnlockNoticeOff: s.isUnlockNoticeOff)),
      ),
      SettingsSwitch(
        label: '実績を取ったときに知らせる',
        value: !s.isUnlockNoticeOff,
        onChanged: _saving ? null : (v) => _update(AchievementSettings(isHiddenOnProfile: s.isHiddenOnProfile, isUnlockNoticeOff: !v)),
      ),
    ]);
  }
}
