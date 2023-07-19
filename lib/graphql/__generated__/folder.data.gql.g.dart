// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFolderData> _$gFolderDataSerializer = new _$GFolderDataSerializer();
Serializer<GFolderData_folder> _$gFolderDataFolderSerializer =
    new _$GFolderData_folderSerializer();
Serializer<GFolderData_folder_user> _$gFolderDataFolderUserSerializer =
    new _$GFolderData_folder_userSerializer();
Serializer<GFolderData_folder_user_iconImage>
    _$gFolderDataFolderUserIconImageSerializer =
    new _$GFolderData_folder_user_iconImageSerializer();
Serializer<GFolderData_folder_user_viewer>
    _$gFolderDataFolderUserViewerSerializer =
    new _$GFolderData_folder_user_viewerSerializer();
Serializer<GFolderData_folder_thumbnailImage>
    _$gFolderDataFolderThumbnailImageSerializer =
    new _$GFolderData_folder_thumbnailImageSerializer();
Serializer<GFolderData_folder_viewer> _$gFolderDataFolderViewerSerializer =
    new _$GFolderData_folder_viewerSerializer();

class _$GFolderDataSerializer implements StructuredSerializer<GFolderData> {
  @override
  final Iterable<Type> types = const [GFolderData, _$GFolderData];
  @override
  final String wireName = 'GFolderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFolderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.folder;
    if (value != null) {
      result
        ..add('folder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder)));
    }
    return result;
  }

  @override
  GFolderData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'folder':
          result.folder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFolderData_folder))!
              as GFolderData_folder);
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData_folderSerializer
    implements StructuredSerializer<GFolderData_folder> {
  @override
  final Iterable<Type> types = const [GFolderData_folder, _$GFolderData_folder];
  @override
  final String wireName = 'GFolderData_folder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GFolderData_folder_user)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'viewsCount',
      serializers.serialize(object.viewsCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder_thumbnailImage)));
    }
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder_viewer)));
    }
    return result;
  }

  @override
  GFolderData_folder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFolderData_folder_user))!
              as GFolderData_folder_user);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'viewsCount':
          result.viewsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFolderData_folder_thumbnailImage))!
              as GFolderData_folder_thumbnailImage);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFolderData_folder_viewer))!
              as GFolderData_folder_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData_folder_userSerializer
    implements StructuredSerializer<GFolderData_folder_user> {
  @override
  final Iterable<Type> types = const [
    GFolderData_folder_user,
    _$GFolderData_folder_user
  ];
  @override
  final String wireName = 'GFolderData_folder_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder_user_iconImage)));
    }
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder_user_viewer)));
    }
    return result;
  }

  @override
  GFolderData_folder_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folder_userBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFolderData_folder_user_iconImage))!
              as GFolderData_folder_user_iconImage);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFolderData_folder_user_viewer))!
              as GFolderData_folder_user_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData_folder_user_iconImageSerializer
    implements StructuredSerializer<GFolderData_folder_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GFolderData_folder_user_iconImage,
    _$GFolderData_folder_user_iconImage
  ];
  @override
  final String wireName = 'GFolderData_folder_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder_user_iconImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFolderData_folder_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folder_user_iconImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData_folder_user_viewerSerializer
    implements StructuredSerializer<GFolderData_folder_user_viewer> {
  @override
  final Iterable<Type> types = const [
    GFolderData_folder_user_viewer,
    _$GFolderData_folder_user_viewer
  ];
  @override
  final String wireName = 'GFolderData_folder_user_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder_user_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'isFollowee',
      serializers.serialize(object.isFollowee,
          specifiedType: const FullType(bool)),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GFolderData_folder_user_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folder_user_viewerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'isFollowee':
          result.isFollowee = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isMuted':
          result.isMuted = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData_folder_thumbnailImageSerializer
    implements StructuredSerializer<GFolderData_folder_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GFolderData_folder_thumbnailImage,
    _$GFolderData_folder_thumbnailImage
  ];
  @override
  final String wireName = 'GFolderData_folder_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder_thumbnailImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFolderData_folder_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folder_thumbnailImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData_folder_viewerSerializer
    implements StructuredSerializer<GFolderData_folder_viewer> {
  @override
  final Iterable<Type> types = const [
    GFolderData_folder_viewer,
    _$GFolderData_folder_viewer
  ];
  @override
  final String wireName = 'GFolderData_folder_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
      'isWatched',
      serializers.serialize(object.isWatched,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GFolderData_folder_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folder_viewerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isWatched':
          result.isWatched = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData extends GFolderData {
  @override
  final String G__typename;
  @override
  final GFolderData_folder? folder;

  factory _$GFolderData([void Function(GFolderDataBuilder)? updates]) =>
      (new GFolderDataBuilder()..update(updates))._build();

  _$GFolderData._({required this.G__typename, this.folder}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData', 'G__typename');
  }

  @override
  GFolderData rebuild(void Function(GFolderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderDataBuilder toBuilder() => new GFolderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData &&
        G__typename == other.G__typename &&
        folder == other.folder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, folder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData')
          ..add('G__typename', G__typename)
          ..add('folder', folder))
        .toString();
  }
}

class GFolderDataBuilder implements Builder<GFolderData, GFolderDataBuilder> {
  _$GFolderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFolderData_folderBuilder? _folder;
  GFolderData_folderBuilder get folder =>
      _$this._folder ??= new GFolderData_folderBuilder();
  set folder(GFolderData_folderBuilder? folder) => _$this._folder = folder;

  GFolderDataBuilder() {
    GFolderData._initializeBuilder(this);
  }

  GFolderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _folder = $v.folder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData;
  }

  @override
  void update(void Function(GFolderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData build() => _build();

  _$GFolderData _build() {
    _$GFolderData _$result;
    try {
      _$result = _$v ??
          new _$GFolderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFolderData', 'G__typename'),
              folder: _folder?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folder';
        _folder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFolderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder extends GFolderData_folder {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final GFolderData_folder_user user;
  @override
  final int createdAt;
  @override
  final int likesCount;
  @override
  final int viewsCount;
  @override
  final GFolderData_folder_thumbnailImage? thumbnailImage;
  @override
  final GFolderData_folder_viewer? viewer;

  factory _$GFolderData_folder(
          [void Function(GFolderData_folderBuilder)? updates]) =>
      (new GFolderData_folderBuilder()..update(updates))._build();

  _$GFolderData_folder._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.user,
      required this.createdAt,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImage,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GFolderData_folder', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFolderData_folder', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GFolderData_folder', 'description');
    BuiltValueNullFieldError.checkNotNull(user, r'GFolderData_folder', 'user');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFolderData_folder', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GFolderData_folder', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GFolderData_folder', 'viewsCount');
  }

  @override
  GFolderData_folder rebuild(
          void Function(GFolderData_folderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folderBuilder toBuilder() =>
      new GFolderData_folderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        user == other.user &&
        createdAt == other.createdAt &&
        likesCount == other.likesCount &&
        viewsCount == other.viewsCount &&
        thumbnailImage == other.thumbnailImage &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewsCount.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('user', user)
          ..add('createdAt', createdAt)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('thumbnailImage', thumbnailImage)
          ..add('viewer', viewer))
        .toString();
  }
}

class GFolderData_folderBuilder
    implements Builder<GFolderData_folder, GFolderData_folderBuilder> {
  _$GFolderData_folder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GFolderData_folder_userBuilder? _user;
  GFolderData_folder_userBuilder get user =>
      _$this._user ??= new GFolderData_folder_userBuilder();
  set user(GFolderData_folder_userBuilder? user) => _$this._user = user;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _viewsCount;
  int? get viewsCount => _$this._viewsCount;
  set viewsCount(int? viewsCount) => _$this._viewsCount = viewsCount;

  GFolderData_folder_thumbnailImageBuilder? _thumbnailImage;
  GFolderData_folder_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??= new GFolderData_folder_thumbnailImageBuilder();
  set thumbnailImage(
          GFolderData_folder_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GFolderData_folder_viewerBuilder? _viewer;
  GFolderData_folder_viewerBuilder get viewer =>
      _$this._viewer ??= new GFolderData_folder_viewerBuilder();
  set viewer(GFolderData_folder_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GFolderData_folderBuilder() {
    GFolderData_folder._initializeBuilder(this);
  }

  GFolderData_folderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _user = $v.user.toBuilder();
      _createdAt = $v.createdAt;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder;
  }

  @override
  void update(void Function(GFolderData_folderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder build() => _build();

  _$GFolderData_folder _build() {
    _$GFolderData_folder _$result;
    try {
      _$result = _$v ??
          new _$GFolderData_folder._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFolderData_folder', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFolderData_folder', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFolderData_folder', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GFolderData_folder', 'description'),
              user: user.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GFolderData_folder', 'createdAt'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GFolderData_folder', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GFolderData_folder', 'viewsCount'),
              thumbnailImage: _thumbnailImage?.build(),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();

        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFolderData_folder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder_user extends GFolderData_folder_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GFolderData_folder_user_iconImage? iconImage;
  @override
  final GFolderData_folder_user_viewer? viewer;

  factory _$GFolderData_folder_user(
          [void Function(GFolderData_folder_userBuilder)? updates]) =>
      (new GFolderData_folder_userBuilder()..update(updates))._build();

  _$GFolderData_folder_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GFolderData_folder_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFolderData_folder_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFolderData_folder_user', 'login');
  }

  @override
  GFolderData_folder_user rebuild(
          void Function(GFolderData_folder_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folder_userBuilder toBuilder() =>
      new GFolderData_folder_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
        iconImage == other.iconImage &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage)
          ..add('viewer', viewer))
        .toString();
  }
}

class GFolderData_folder_userBuilder
    implements
        Builder<GFolderData_folder_user, GFolderData_folder_userBuilder> {
  _$GFolderData_folder_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  GFolderData_folder_user_iconImageBuilder? _iconImage;
  GFolderData_folder_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GFolderData_folder_user_iconImageBuilder();
  set iconImage(GFolderData_folder_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GFolderData_folder_user_viewerBuilder? _viewer;
  GFolderData_folder_user_viewerBuilder get viewer =>
      _$this._viewer ??= new GFolderData_folder_user_viewerBuilder();
  set viewer(GFolderData_folder_user_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GFolderData_folder_userBuilder() {
    GFolderData_folder_user._initializeBuilder(this);
  }

  GFolderData_folder_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder_user;
  }

  @override
  void update(void Function(GFolderData_folder_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder_user build() => _build();

  _$GFolderData_folder_user _build() {
    _$GFolderData_folder_user _$result;
    try {
      _$result = _$v ??
          new _$GFolderData_folder_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFolderData_folder_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFolderData_folder_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GFolderData_folder_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GFolderData_folder_user', 'login'),
              iconImage: _iconImage?.build(),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFolderData_folder_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder_user_iconImage
    extends GFolderData_folder_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFolderData_folder_user_iconImage(
          [void Function(GFolderData_folder_user_iconImageBuilder)? updates]) =>
      (new GFolderData_folder_user_iconImageBuilder()..update(updates))
          ._build();

  _$GFolderData_folder_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFolderData_folder_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GFolderData_folder_user_iconImage', 'downloadURL');
  }

  @override
  GFolderData_folder_user_iconImage rebuild(
          void Function(GFolderData_folder_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folder_user_iconImageBuilder toBuilder() =>
      new GFolderData_folder_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder_user_iconImage &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFolderData_folder_user_iconImageBuilder
    implements
        Builder<GFolderData_folder_user_iconImage,
            GFolderData_folder_user_iconImageBuilder> {
  _$GFolderData_folder_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFolderData_folder_user_iconImageBuilder() {
    GFolderData_folder_user_iconImage._initializeBuilder(this);
  }

  GFolderData_folder_user_iconImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder_user_iconImage;
  }

  @override
  void update(
      void Function(GFolderData_folder_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder_user_iconImage build() => _build();

  _$GFolderData_folder_user_iconImage _build() {
    final _$result = _$v ??
        new _$GFolderData_folder_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFolderData_folder_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFolderData_folder_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFolderData_folder_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder_user_viewer extends GFolderData_folder_user_viewer {
  @override
  final String G__typename;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GFolderData_folder_user_viewer(
          [void Function(GFolderData_folder_user_viewerBuilder)? updates]) =>
      (new GFolderData_folder_user_viewerBuilder()..update(updates))._build();

  _$GFolderData_folder_user_viewer._(
      {required this.G__typename,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder_user_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GFolderData_folder_user_viewer', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GFolderData_folder_user_viewer', 'isMuted');
  }

  @override
  GFolderData_folder_user_viewer rebuild(
          void Function(GFolderData_folder_user_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folder_user_viewerBuilder toBuilder() =>
      new GFolderData_folder_user_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder_user_viewer &&
        G__typename == other.G__typename &&
        isFollowee == other.isFollowee &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder_user_viewer')
          ..add('G__typename', G__typename)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GFolderData_folder_user_viewerBuilder
    implements
        Builder<GFolderData_folder_user_viewer,
            GFolderData_folder_user_viewerBuilder> {
  _$GFolderData_folder_user_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GFolderData_folder_user_viewerBuilder() {
    GFolderData_folder_user_viewer._initializeBuilder(this);
  }

  GFolderData_folder_user_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder_user_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder_user_viewer;
  }

  @override
  void update(void Function(GFolderData_folder_user_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder_user_viewer build() => _build();

  _$GFolderData_folder_user_viewer _build() {
    final _$result = _$v ??
        new _$GFolderData_folder_user_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GFolderData_folder_user_viewer', 'G__typename'),
            isFollowee: BuiltValueNullFieldError.checkNotNull(
                isFollowee, r'GFolderData_folder_user_viewer', 'isFollowee'),
            isMuted: BuiltValueNullFieldError.checkNotNull(
                isMuted, r'GFolderData_folder_user_viewer', 'isMuted'));
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder_thumbnailImage
    extends GFolderData_folder_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFolderData_folder_thumbnailImage(
          [void Function(GFolderData_folder_thumbnailImageBuilder)? updates]) =>
      (new GFolderData_folder_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GFolderData_folder_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFolderData_folder_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GFolderData_folder_thumbnailImage', 'downloadURL');
  }

  @override
  GFolderData_folder_thumbnailImage rebuild(
          void Function(GFolderData_folder_thumbnailImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folder_thumbnailImageBuilder toBuilder() =>
      new GFolderData_folder_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder_thumbnailImage &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFolderData_folder_thumbnailImageBuilder
    implements
        Builder<GFolderData_folder_thumbnailImage,
            GFolderData_folder_thumbnailImageBuilder> {
  _$GFolderData_folder_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFolderData_folder_thumbnailImageBuilder() {
    GFolderData_folder_thumbnailImage._initializeBuilder(this);
  }

  GFolderData_folder_thumbnailImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder_thumbnailImage;
  }

  @override
  void update(
      void Function(GFolderData_folder_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder_thumbnailImage build() => _build();

  _$GFolderData_folder_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GFolderData_folder_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFolderData_folder_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFolderData_folder_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFolderData_folder_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder_viewer extends GFolderData_folder_viewer {
  @override
  final String G__typename;
  @override
  final bool isLiked;
  @override
  final bool isWatched;

  factory _$GFolderData_folder_viewer(
          [void Function(GFolderData_folder_viewerBuilder)? updates]) =>
      (new GFolderData_folder_viewerBuilder()..update(updates))._build();

  _$GFolderData_folder_viewer._(
      {required this.G__typename,
      required this.isLiked,
      required this.isWatched})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GFolderData_folder_viewer', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(
        isWatched, r'GFolderData_folder_viewer', 'isWatched');
  }

  @override
  GFolderData_folder_viewer rebuild(
          void Function(GFolderData_folder_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folder_viewerBuilder toBuilder() =>
      new GFolderData_folder_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder_viewer &&
        G__typename == other.G__typename &&
        isLiked == other.isLiked &&
        isWatched == other.isWatched;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jc(_$hash, isWatched.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder_viewer')
          ..add('G__typename', G__typename)
          ..add('isLiked', isLiked)
          ..add('isWatched', isWatched))
        .toString();
  }
}

class GFolderData_folder_viewerBuilder
    implements
        Builder<GFolderData_folder_viewer, GFolderData_folder_viewerBuilder> {
  _$GFolderData_folder_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  bool? _isWatched;
  bool? get isWatched => _$this._isWatched;
  set isWatched(bool? isWatched) => _$this._isWatched = isWatched;

  GFolderData_folder_viewerBuilder() {
    GFolderData_folder_viewer._initializeBuilder(this);
  }

  GFolderData_folder_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _isLiked = $v.isLiked;
      _isWatched = $v.isWatched;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder_viewer;
  }

  @override
  void update(void Function(GFolderData_folder_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder_viewer build() => _build();

  _$GFolderData_folder_viewer _build() {
    final _$result = _$v ??
        new _$GFolderData_folder_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GFolderData_folder_viewer', 'G__typename'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GFolderData_folder_viewer', 'isLiked'),
            isWatched: BuiltValueNullFieldError.checkNotNull(
                isWatched, r'GFolderData_folder_viewer', 'isWatched'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
