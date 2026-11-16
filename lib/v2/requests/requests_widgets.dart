import 'dart:typed_data';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/requests/requests_api.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

/// 有料リクエストの画面で使う部品（Web と同じ見た目: 角の丸いカード・丸いタブ・下に固定のボタン）

String formatCoins(int n) => n.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');

String formatRemaining(int? unix) {
  if (unix == null || unix == 0) return '';
  final diff = unix - DateTime.now().millisecondsSinceEpoch ~/ 1000;
  if (diff <= 0) return tr('期限を過ぎています', 'Past the deadline');
  final days = diff ~/ 86400;
  if (days >= 1) return tr('あと $days 日', '$days days left');
  return tr('あと ${(diff ~/ 3600).clamp(1, 24)} 時間', '${(diff ~/ 3600).clamp(1, 24)} hours left');
}

String formatDateTime(int? unix) {
  if (unix == null || unix == 0) return '';
  final d = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  if (!L10n.isJa) return DateFormat('MMM d, HH:mm', 'en_US').format(d);
  return '${d.month}/${d.day} ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}

class CoinPrice extends StatelessWidget {
  const CoinPrice(this.coins, {super.key, this.size = 15});

  final int coins;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.monetization_on_rounded, size: size + 2, color: Ds.gold),
        const SizedBox(width: 3),
        Text(
          formatCoins(coins),
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: size),
        ),
      ],
    );
  }
}

class RequestUserChip extends StatelessWidget {
  const RequestUserChip(this.user, {super.key, this.size = 24, this.tappable = true});

  final RequestUser? user;
  final double size;
  final bool tappable;

  @override
  Widget build(BuildContext context) {
    final u = user;
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: SizedBox(
            width: size,
            height: size,
            child: u?.iconUrl == null ? ColoredBox(color: context.skeleton) : AppImage(u!.iconUrl, width: size, height: size),
          ),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            u?.name ?? tr('ユーザー', 'User'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ),
      ],
    );
    if (!tappable || u == null) return row;
    return GestureDetector(onTap: () => context.push('/users/${u.id}'), child: row);
  }
}

Color statusColor(String status) => switch (status) {
  'PENDING' => Ds.gold,
  'ACCEPTED' => Ds.sky,
  'DELIVERED' => Ds.purple,
  'COMPLETED' || 'ADMIN_COMPLETED' => const Color(0xFF10B981),
  _ => Colors.grey,
};

class RequestStatusBadge extends StatelessWidget {
  const RequestStatusBadge(this.status, {super.key});

  final String status;

  @override
  Widget build(BuildContext context) {
    final color = statusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.14), borderRadius: Ds.br(999)),
      child: Text(
        requestStatusLabels[status] ?? status,
        style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 11.5),
      ),
    );
  }
}

/// プランのカード（一覧・マイページの横スクロール）
class RequestPlanCard extends StatelessWidget {
  const RequestPlanCard({super.key, required this.plan, this.user, this.width});

  final RequestPlan plan;
  final RequestUser? user;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final closed = !plan.canApply;
    return Pressable(
      onTap: () => context.push('/requests/plans/${plan.id}'),
      child: Container(
        width: width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.surfaceCard,
          borderRadius: Ds.br(18),
          border: Border.all(color: context.hairline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  plan.sampleImageUrls.isEmpty
                      ? Container(
                          decoration: const BoxDecoration(gradient: Ds.brandGradient),
                          child: const Icon(Icons.brush_rounded, color: Colors.white70, size: 40),
                        )
                      : AppImage(plan.sampleImageUrls.first),
                  Positioned(left: 8, top: 8, child: _Tag(planCategoryLabels[plan.category] ?? plan.category)),
                  if (closed) Positioned(right: 8, top: 8, child: _Tag(plan.isHidden ? tr('非公開', 'Hidden') : (plan.isFull ? tr('受付上限', 'Full') : tr('受付停止', 'Closed')))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13.5),
                  ),
                  const SizedBox(height: 6),
                  if (user != null) ...[RequestUserChip(user, size: 18, tappable: false), const SizedBox(height: 6)],
                  Row(
                    children: [
                      CoinPrice(plan.priceCoins, size: 14),
                      const Spacer(),
                      Text(tr('${plan.deliveryDays}日', '${plan.deliveryDays}d'), style: TextStyle(color: context.muted, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.55), borderRadius: Ds.br(999)),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }
}

/// 状態の段階（申し込み → 承諾 → 納品 → 完了）
class RequestSteps extends StatelessWidget {
  const RequestSteps(this.request, {super.key});

  final CoinRequest request;

  @override
  Widget build(BuildContext context) {
    final labels = [tr('申し込み', 'Requested'), tr('制作中', 'In progress'), tr('納品', 'Delivery'), tr('完了', 'Completed')];
    final s = request.status;
    final step = switch (s) {
      'PENDING' => 0,
      'ACCEPTED' => 1,
      'DELIVERED' => 2,
      'COMPLETED' || 'ADMIN_COMPLETED' => 3,
      _ => -1,
    };
    if (step < 0) {
      return Text(tr('この依頼は「${requestStatusLabels[s] ?? s}」で終わりました。預かったコインは全額返却済みです。', 'This request ended as "${requestStatusLabels[s] ?? s}". The held coins have been fully returned.'), style: TextStyle(color: context.muted, fontSize: 12.5));
    }
    return Row(
      children: [
        for (var i = 0; i < labels.length; i++) ...[
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: i <= step ? Ds.brandGradient : null,
                    color: i <= step ? null : context.skeleton,
                    borderRadius: Ds.br(999),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  labels[i],
                  style: TextStyle(fontSize: 11, fontWeight: i == step ? FontWeight.w800 : FontWeight.w500, color: i <= step ? null : context.muted),
                ),
              ],
            ),
          ),
          if (i < labels.length - 1) const SizedBox(width: 4),
        ],
      ],
    );
  }
}

class RequestImageGrid extends StatelessWidget {
  const RequestImageGrid(this.urls, {super.key});

  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    if (urls.isEmpty) return const SizedBox.shrink();
    return GridView.count(
      crossAxisCount: urls.length == 1 ? 1 : 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      childAspectRatio: urls.length == 1 ? 4 / 3 : 1,
      children: [
        for (final url in urls)
          GestureDetector(
            onTap: () => showDialog<void>(
              context: context,
              builder: (_) => GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: InteractiveViewer(child: AppImage(url, fit: BoxFit.contain)),
              ),
            ),
            child: AppImage(url, radius: 12),
          ),
      ],
    );
  }
}

/// 画像を選んで上げる（参考画像・見本・納品）
class RequestImagePicker extends StatefulWidget {
  const RequestImagePicker({super.key, required this.value, required this.onChanged, required this.max, required this.label});

  final List<String> value;
  final ValueChanged<List<String>> onChanged;
  final int max;
  final String label;

  @override
  State<RequestImagePicker> createState() => _RequestImagePickerState();
}

class _RequestImagePickerState extends State<RequestImagePicker> {
  int _uploading = 0;

  String _contentType(Uint8List b) {
    if (b.length > 3 && b[0] == 0x89 && b[1] == 0x50) return 'image/png';
    if (b.length > 11 && b[8] == 0x57 && b[9] == 0x45 && b[10] == 0x42 && b[11] == 0x50) return 'image/webp';
    return 'image/jpeg';
  }

  Future<void> _pick() async {
    final left = widget.max - widget.value.length;
    if (left <= 0) return;
    try {
      final files = await ImagePicker().pickMultiImage(maxWidth: 2400, maxHeight: 2400, imageQuality: 92, limit: left);
      if (files.isEmpty) return;
      setState(() => _uploading += files.length);
      final urls = <String>[];
      for (final f in files.take(left)) {
        final bytes = await f.readAsBytes();
        urls.add(await SettingsApi.uploadImage(bytes, _contentType(bytes)));
        if (mounted) setState(() => _uploading -= 1);
      }
      widget.onChanged([...widget.value, ...urls]);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } catch (_) {
      if (mounted) context.toast(tr('画像を読み込めませんでした。写真へのアクセスを確認してください', 'Could not load the image. Please check photo access'), error: true);
    } finally {
      if (mounted) setState(() => _uploading = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr('${widget.label}（${widget.value.length}/${widget.max}）', '${widget.label} (${widget.value.length}/${widget.max})'), style: TextStyle(color: context.muted, fontSize: 12)),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final url in widget.value)
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AppImage(url, width: 76, height: 76, radius: 12),
                  Positioned(
                    right: -6,
                    top: -6,
                    child: GestureDetector(
                      onTap: () => widget.onChanged(widget.value.where((u) => u != url).toList()),
                      child: const CircleAvatar(
                        radius: 11,
                        backgroundColor: Colors.black87,
                        child: Icon(Icons.close, size: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            if (widget.value.length < widget.max)
              Pressable(
                onTap: _uploading > 0 ? null : _pick,
                child: Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    borderRadius: Ds.br(12),
                    border: Border.all(color: context.hairline, width: 1.5),
                  ),
                  child: _uploading > 0
                      ? const Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)))
                      : Icon(Icons.add_photo_alternate_outlined, color: context.muted),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

/// マイページ（ユーザーのページ）のプラン欄: 横スクロールのカードと「リクエストする」
class UserRequestPlansStrip extends StatefulWidget {
  const UserRequestPlansStrip({super.key, required this.userId, this.isOwner = false});

  final String userId;
  final bool isOwner;

  @override
  State<UserRequestPlansStrip> createState() => _UserRequestPlansStripState();
}

class _UserRequestPlansStripState extends State<UserRequestPlansStrip> {
  CreatorProfile? _profile;

  @override
  void initState() {
    super.initState();
    RequestsApi.creator(widget.userId)
        .then((p) {
          if (mounted) setState(() => _profile = p);
        })
        .catchError((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final p = _profile;
    if (p == null) return const SizedBox.shrink();
    final plans = p.plans.where((x) => !x.isHidden || widget.isOwner).toList();
    if (plans.isEmpty && !p.canFreeRequest) return const SizedBox.shrink();
    final user = p.users[widget.userId];
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            tr('リクエスト', 'Requests'),
            icon: Icons.volunteer_activism_rounded,
            trailing: p.completedCount > 0 ? tr('完了 ${p.completedCount} 件', '${p.completedCount} completed') : null,
            onMore: () => context.push(widget.isOwner ? '/settings/requests' : '/requests/plans'),
          ),
          if (plans.isNotEmpty)
            SizedBox(
              height: 236,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: plans.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, i) => RequestPlanCard(plan: plans[i], user: user, width: 200),
              ),
            ),
          if (p.canFreeRequest && !widget.isOwner)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Ds.sky.withValues(alpha: 0.1), borderRadius: Ds.br(16)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr('内容を自由に決めてリクエスト', 'Send a custom request'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13.5)),
                          Text(
                            p.settings.note.isNotEmpty ? p.settings.note : tr('${formatCoins(p.settings.minCoins)} コインから受け付けています', 'From ${formatCoins(p.settings.minCoins)} coins'),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: context.muted, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    PrimaryButton(
                      label: tr('リクエストする', 'Request'),
                      expand: false,
                      height: 38,
                      onPressed: () => context.push('/requests/new?creator=${widget.userId}'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
