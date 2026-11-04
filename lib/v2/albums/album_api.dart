import 'dart:math';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:flutter/foundation.dart';

const albumSummaryFields = 'id title description rating thumbnailImageURL worksCount likesCount';

/// シリーズ（Web の albums）とブックマークフォルダの API
class AlbumApi {
  AlbumApi._();

  static Future<List<Map<String, dynamic>>> mine(int offset, int limit) async {
    final data = await Api.query('''
query AppMyAlbums(\$offset: Int!, \$limit: Int!) {
  viewer { id albums(offset: \$offset, limit: \$limit, where: { orderBy: DATE_CREATED, sort: DESC, ratings: [G, R15] }) { $albumSummaryFields } }
}''', variables: {'offset': offset, 'limit': limit});
    return data.obj('viewer')?.list('albums') ?? const [];
  }

  static Future<({Map<String, dynamic>? album, String? viewerId})> detail(String id) async {
    final data = await Api.query('''
query AppAlbum(\$id: ID!) {
  viewer { id user { id } }
  album(id: \$id) { $albumSummaryFields workIds slug isLiked user { $userSummaryFields } }
}''', variables: {'id': id});
    return (album: data.obj('album'), viewerId: data.obj('viewer')?.obj('user')?.str('id'));
  }

  static Future<List<WorkSummary>> works(String id, int offset, int limit) async {
    final data = await Api.query('''
query AppAlbumWorks(\$id: ID!, \$offset: Int!, \$limit: Int!) {
  album(id: \$id) { id works(offset: \$offset, limit: \$limit) { $workCardFields } }
}''', variables: {'id': id, 'offset': offset, 'limit': limit});
    return WorkSummary.listFrom(data.obj('album')?.list('works') ?? const []);
  }

  /// シリーズに入れる候補（自分の作品）
  static Future<List<WorkSummary>> myWorks(int offset, int limit) async {
    final viewer = await Api.query('query AppViewerId { viewer { id user { id } } }', cacheFor: const Duration(minutes: 10));
    final data = await Api.query('''
query AppMyWorksForAlbum(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) { $workCardFields }
}''', variables: {
      'offset': offset,
      'limit': limit,
      'where': {
        'userId': viewer.obj('viewer')?.obj('user')?.str('id'),
        'isIncludePrivate': true,
        'orderBy': 'DATE_CREATED',
        'sort': 'DESC',
        'ratings': appRatings,
      },
    });
    return WorkSummary.listFrom(data.list('works'));
  }

  static String _slug() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final r = Random.secure();
    return 'series${List.generate(6, (_) => chars[r.nextInt(chars.length)]).join()}';
  }

  static Future<String> create({required String title, required String description, required List<String> workIds, EncodedImage? thumbnail}) async {
    if (postDryRun) {
      debugPrint('[post dry run] createAlbum title=$title works=${workIds.length} thumbnail=${thumbnail != null}');
      return 'dry-run';
    }
    final thumbnailUrl = thumbnail == null ? null : await Uploader.image(thumbnail.bytes, thumbnail.mime, await Uploader.token());
    final data = await Api.mutate(r'mutation AppCreateAlbum($input: CreateAlbumInput!) { createAlbum(input: $input) { id } }', variables: {
      'input': {
        'title': title,
        'description': description,
        'slug': _slug(),
        'rating': 'G',
        'workIds': workIds,
        if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      },
    });
    return data.obj('createAlbum')!.str('id');
  }

  static Future<void> update(String id, {required String title, required String description, required List<String> workIds, EncodedImage? header}) async {
    if (postDryRun) {
      debugPrint('[post dry run] updateAlbum id=$id title=$title works=${workIds.length} header=${header != null}');
      return;
    }
    final headerUrl = header == null ? null : await Uploader.image(header.bytes, header.mime, await Uploader.token());
    await Api.mutate(r'mutation AppUpdateAlbum($input: UpdateAlbumInput!) { updateAlbum(input: $input) { id } }', variables: {
      'input': {
        'albumId': id,
        'title': title,
        'description': description,
        'workIds': workIds,
        if (headerUrl != null) 'headerImageUrl': headerUrl,
      },
    });
  }

  static Future<void> delete(String id) async {
    await Api.mutate(r'mutation AppDeleteAlbum($input: DeleteAlbumInput!) { deleteAlbum(input: $input) { id } }', variables: {
      'input': {'albumId': id},
    });
  }

  static Future<void> addWork(String albumId, String workId) async {
    await Api.mutate(r'mutation AppAddAlbumWork($input: CreateAlbumWorkInput!) { createAlbumWork(input: $input) { id } }', variables: {
      'input': {'albumId': albumId, 'workId': workId},
    });
  }

  // ブックマークフォルダ

  static Future<List<Map<String, dynamic>>> folders(int offset, int limit) async {
    final data = await Api.query(r'''
query AppMyFolders($offset: Int!, $limit: Int!) {
  viewer { id folders(offset: $offset, limit: $limit) { id nanoid title thumbnailImageURL worksCount isPrivate rating } }
}''', variables: {'offset': offset, 'limit': limit});
    return data.obj('viewer')?.list('folders') ?? const [];
  }

  static Future<Map<String, dynamic>?> folder(String id) async {
    final data = await Api.query('''
query AppFolder(\$id: ID!) { folder(id: \$id) { id nanoid title description worksCount rating userId user { $userSummaryFields } } }''', variables: {'id': id});
    return data.obj('folder');
  }

  static Future<List<WorkSummary>> folderWorks(String id, int offset, int limit) async {
    final data = await Api.query('''
query AppFolderWorks(\$id: ID!, \$offset: Int!, \$limit: Int!) {
  folder(id: \$id) { id works(offset: \$offset, limit: \$limit) { $workCardFields } }
}''', variables: {'id': id, 'offset': offset, 'limit': limit});
    return WorkSummary.listFrom(data.obj('folder')?.list('works') ?? const []);
  }

  static Future<String> createFolder(String title) async {
    final data = await Api.mutate(r'mutation AppCreateFolder($input: CreateFolderInput!) { createFolder(input: $input) { id } }', variables: {
      'input': {'title': title},
    });
    return data.obj('createFolder')!.str('id');
  }

  static Future<void> renameFolder(String id, String title) async {
    await Api.mutate(r'mutation AppUpdateFolder($input: UpdateFolderInput!) { updateFolder(input: $input) { id } }', variables: {
      'input': {'folderId': id, 'title': title},
    });
  }

  static Future<void> deleteFolder(String id) async {
    await Api.mutate(r'mutation AppDeleteFolder($input: DeleteFolderInput!) { deleteFolder(input: $input) { id } }', variables: {
      'input': {'folderId': id},
    });
  }

  static Future<void> addToFolder(String folderId, String workId) async {
    await Api.mutate(r'mutation AppAddFolderWork($input: CreateFolderWorkInput!) { createFolderWork(input: $input) { id } }', variables: {
      'input': {'folderId': folderId, 'workId': workId},
    });
  }

  static Future<void> removeFromFolder(String folderId, String workId) async {
    await Api.mutate(r'mutation AppRemoveFolderWork($input: DeleteFolderWorkInput!) { deleteFolderWork(input: $input) { id } }', variables: {
      'input': {'folderId': folderId, 'workId': workId},
    });
  }
}
