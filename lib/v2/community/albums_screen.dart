import 'package:aipictors/v2/community/paged_list.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _query = r'''
query AppPublicAlbums($offset: Int!, $limit: Int!, $where: AlbumsWhereInput) {
  albums(offset: $offset, limit: $limit, where: $where) {
    id title rating isSensitive thumbnailImageURL likesCount workIds user { id name }
  }
}''';

/// 公開されているシリーズの一覧（Web の /collections もここに来る）
class AlbumsBrowseScreen extends StatefulWidget {
  const AlbumsBrowseScreen({super.key});

  @override
  State<AlbumsBrowseScreen> createState() => _AlbumsBrowseScreenState();
}

class _AlbumsBrowseScreenState extends State<AlbumsBrowseScreen> {
  final _c = PagedController<Map<String, dynamic>>(
    idOf: (a) => a.str('id'),
    fetch: (offset, limit) async {
      final data = await Api.query(_query, variables: {
        'offset': offset,
        'limit': limit,
        'where': {'isSensitive': false, 'ratings': ['G', 'R15'], 'needsThumbnailImage': true, 'orderBy': 'DATE_UPDATED', 'sort': 'DESC'},
      }, cacheFor: const Duration(minutes: 5));
      return data.list('albums').where((a) => !a.boolean('isSensitive') && a.str('rating') != 'R18').toList();
    },
  );

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('シリーズ', style: TextStyle(fontWeight: FontWeight.w800))),
      body: PagedList<Map<String, dynamic>>(
        controller: _c,
        emptyTitle: 'シリーズはまだありません',
        itemBuilder: (context, a) => ListTile(
          leading: AppImage(a.strOrNull('thumbnailImageURL'), width: 56, height: 56, radius: 10, memCacheWidth: 168),
          title: Text(a.str('title'), maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
          subtitle: Text(
            '${a.obj('user')?.str('name') ?? ''}・${(a['workIds'] as List? ?? const []).length} 作品',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: context.muted),
          ),
          onTap: () => context.push('/albums/${a.str('id')}'),
        ),
      ),
    );
  }
}
