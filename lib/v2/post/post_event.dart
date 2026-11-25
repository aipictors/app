import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 投稿フォームで参加できるイベント（Web の post-form-event.ts の EventOption）
class PostEvent {
  const PostEvent({
    required this.slug,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.tag,
    required this.startAt,
    required this.endAt,
    this.ratings = const [],
    this.isUser = false,
  });

  factory PostEvent.fromJson(Map<String, dynamic> e, {bool isUser = false}) => PostEvent(
        slug: e.str('slug'),
        title: e.str('title'),
        description: e.strOrNull('description'),
        thumbnailUrl: e.strOrNull('thumbnailImageUrl') ?? e.strOrNull('headerImageUrl'),
        tag: e.str(isUser ? 'mainTag' : 'tag'),
        startAt: e.integer('startAt'),
        endAt: e.integer('endAt'),
        ratings: (e['ratings'] as List? ?? const []).map((r) => r.toString()).toList(),
        isUser: isUser,
      );

  final String slug;
  final String title;
  final String? description;
  final String? thumbnailUrl;

  /// 参加タグ。投稿のタグにこれが入っていれば参加
  final String tag;

  /// 開催期間（日本時間の壁時計を UTC として扱った UNIX 秒）
  final int startAt;
  final int endAt;
  final List<String> ratings;
  final bool isUser;

  bool isBeforeStart(int publishAt) => publishAt < startAt;

  bool isEnded(int publishAt) => publishAt > endAt;

  bool isSelectable(int publishAt) => !isBeforeStart(publishAt) && !isEnded(publishAt);
}

/// 公開の日時をイベントの開催期間と同じ「日本時間の壁時計を UTC とした秒」にする。
/// 予約がなければ今。予約の日時は Web の jstDateTimeToWallClockUnixSeconds と同じく日本時間として読む
int eventPublishAt(DateTime? reservedAt, {DateTime? now}) {
  if (reservedAt != null) {
    final r = reservedAt;
    return DateTime.utc(r.year, r.month, r.day, r.hour, r.minute).millisecondsSinceEpoch ~/ 1000;
  }
  final jst = (now ?? DateTime.now()).toUtc().add(const Duration(hours: 9));
  return DateTime.utc(jst.year, jst.month, jst.day, jst.hour, jst.minute, jst.second).millisecondsSinceEpoch ~/ 1000;
}

/// タグで選んだイベントが公開の日時に開催していなければ伝える文（Web の getPostEventPeriodError）
String? postEventPeriodError({required List<String> tags, required List<PostEvent> events, required DateTime? reservedAt, DateTime? now}) {
  final selected = tags.map((t) => t.trim()).where((t) => t.isNotEmpty).toSet();
  if (selected.isEmpty) return null;
  final publishAt = eventPublishAt(reservedAt, now: now);
  final out = events.where((e) => e.tag.isNotEmpty && selected.contains(e.tag) && !e.isSelectable(publishAt)).firstOrNull;
  if (out == null) return null;
  if (reservedAt != null) {
    return tr('予約公開日時がイベント開催期間外です。\n開催期間内の日付を指定してください。', 'Scheduled publish time is outside the event period. Please choose a date within the event period.');
  }
  if (out.isBeforeStart(publishAt)) {
    return tr('このイベントはまだ開始されていません。\nイベント開始後に投稿してください。', 'This event has not started yet. Please post after the event starts.');
  }
  return tr('このイベントは終了しています。', 'This event has ended.');
}

/// 運営のイベントに URL で選ばれたイベントを足す。同じ slug・タグがあれば足さない（Web の mergePostFormEvents）
List<PostEvent> mergePostEvents(List<PostEvent> appEvents, PostEvent? selected) {
  if (selected == null || appEvents.any((e) => e.slug == selected.slug || e.tag == selected.tag)) return appEvents;
  return [...appEvents, selected];
}

/// 開催期間の表示（Web の formatEventDateTime。UTC の各要素で出す）
String formatEventDateTime(int seconds) {
  final d = DateTime.fromMillisecondsSinceEpoch(seconds * 1000, isUtc: true);
  String two(int n) => n.toString().padLeft(2, '0');
  return '${d.year}/${two(d.month)}/${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
}

/// イベントの参加ボタンから投稿画面を開く（Web の /new/image?event=&tag=）
void openPostForEvent(BuildContext context, {required String slug, required String tag}) {
  context.push(Uri(path: '/works/create', queryParameters: {'event': slug, if (tag.isNotEmpty) 'tag': tag}).toString());
}

class PostEventApi {
  PostEventApi._();

  /// 参加ボタンから来たイベント。運営のイベントになければユーザーのイベント
  static Future<PostEvent?> bySlug(String slug) async {
    final data = await Api.query(r'''
query AppPostEvent($slug: String) {
  appEvent(slug: $slug) { slug title description thumbnailImageUrl headerImageUrl tag startAt endAt }
}''', variables: {'slug': slug}, cacheFor: const Duration(minutes: 5));
    final app = data.obj('appEvent');
    if (app != null) return PostEvent.fromJson(app);
    final u = await Api.query(r'''
query AppPostUserEvent($slug: String!) {
  userEvent(slug: $slug) { slug title description thumbnailImageUrl headerImageUrl mainTag ratings startAt endAt }
}''', variables: {'slug': slug}, cacheFor: const Duration(minutes: 5));
    final user = u.obj('userEvent');
    return user == null ? null : PostEvent.fromJson(user, isUser: true);
  }
}

/// 投稿フォームのイベントの枠（Web の PostFormItemEvent）。「参加する」でタグを付け外しする
class PostEventCard extends StatelessWidget {
  const PostEventCard({super.key, required this.event, required this.attending, required this.publishAt, required this.onChanged});

  final PostEvent event;
  final bool attending;
  final int publishAt;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final before = event.isBeforeStart(publishAt);
    final ended = event.isEnded(publishAt);
    final selectable = !before && !ended;
    final cs = context.cs;
    return Container(
      padding: const EdgeInsets.all(Ds.s12),
      decoration: BoxDecoration(
        color: attending ? cs.primaryContainer.withValues(alpha: 0.35) : context.surfaceCard,
        borderRadius: Ds.br(14),
        border: Border.all(color: attending ? cs.primary : context.hairline, width: attending ? 1.5 : 1),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Pressable(
          onTap: () => context.push('/events/${event.slug}'),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(borderRadius: Ds.br(8), child: SizedBox(width: 56, height: 56, child: AppImage(event.thumbnailUrl, memCacheWidth: 200))),
            const SizedBox(width: Ds.s12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(event.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, height: 1.3)),
                const SizedBox(height: 2),
                Text('#${event.tag}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: cs.primary, fontSize: 12, fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                Text(
                  '${tr('開催期間', 'Period')} ${formatEventDateTime(event.startAt)} 〜 ${formatEventDateTime(event.endAt)}',
                  style: TextStyle(color: context.muted, fontSize: 11),
                ),
                if (event.ratings.isNotEmpty) Text('${tr('対象年齢', 'Ratings')}: ${event.ratings.join(', ')}', style: TextStyle(color: context.muted, fontSize: 11)),
              ]),
            ),
          ]),
        ),
        if (before || ended) ...[
          const SizedBox(height: Ds.s8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: Ds.s8),
            decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(8)),
            child: Text(
              before
                  ? tr('このイベントはまだ開始されていません。開始後に投稿可能になります。', 'This event has not started yet. You can post after it starts.')
                  : tr('このイベントは終了しています。', 'This event has ended.'),
              style: TextStyle(fontSize: 12, color: context.muted),
            ),
          ),
        ],
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: Text(tr('参加する', 'Join'), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
          value: attending,
          onChanged: selectable || attending ? onChanged : null,
        ),
      ]),
    );
  }
}
