// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_folders.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserFolderData> _$gUserFolderDataSerializer =
    new _$GUserFolderDataSerializer();
Serializer<GUserFolderData_user> _$gUserFolderDataUserSerializer =
    new _$GUserFolderData_userSerializer();
Serializer<GUserFolderData_user_folders>
    _$gUserFolderDataUserFoldersSerializer =
    new _$GUserFolderData_user_foldersSerializer();
Serializer<GUserFolderData_user_folders_thumbnailImage>
    _$gUserFolderDataUserFoldersThumbnailImageSerializer =
    new _$GUserFolderData_user_folders_thumbnailImageSerializer();

class _$GUserFolderDataSerializer
    implements StructuredSerializer<GUserFolderData> {
  @override
  final Iterable<Type> types = const [GUserFolderData, _$GUserFolderData];
  @override
  final String wireName = 'GUserFolderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserFolderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserFolderData_user)));
    }
    return result;
  }

  @override
  GUserFolderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolderDataBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserFolderData_user))!
              as GUserFolderData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFolderData_userSerializer
    implements StructuredSerializer<GUserFolderData_user> {
  @override
  final Iterable<Type> types = const [
    GUserFolderData_user,
    _$GUserFolderData_user
  ];
  @override
  final String wireName = 'GUserFolderData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFolderData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'folders',
      serializers.serialize(object.folders,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GUserFolderData_user_folders)])),
    ];

    return result;
  }

  @override
  GUserFolderData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolderData_userBuilder();

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
        case 'folders':
          result.folders.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserFolderData_user_folders)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFolderData_user_foldersSerializer
    implements StructuredSerializer<GUserFolderData_user_folders> {
  @override
  final Iterable<Type> types = const [
    GUserFolderData_user_folders,
    _$GUserFolderData_user_folders
  ];
  @override
  final String wireName = 'GUserFolderData_user_folders';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFolderData_user_folders object,
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
      'rating',
      serializers.serialize(object.rating,
          specifiedType: const FullType(_i3.GRating)),
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
            specifiedType:
                const FullType(GUserFolderData_user_folders_thumbnailImage)));
    }
    return result;
  }

  @override
  GUserFolderData_user_folders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolderData_user_foldersBuilder();

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
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(_i3.GRating))! as _i3.GRating;
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
                  specifiedType: const FullType(
                      GUserFolderData_user_folders_thumbnailImage))!
              as GUserFolderData_user_folders_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFolderData_user_folders_thumbnailImageSerializer
    implements
        StructuredSerializer<GUserFolderData_user_folders_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GUserFolderData_user_folders_thumbnailImage,
    _$GUserFolderData_user_folders_thumbnailImage
  ];
  @override
  final String wireName = 'GUserFolderData_user_folders_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserFolderData_user_folders_thumbnailImage object,
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
  GUserFolderData_user_folders_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolderData_user_folders_thumbnailImageBuilder();

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

class _$GUserFolderData extends GUserFolderData {
  @override
  final String G__typename;
  @override
  final GUserFolderData_user? user;

  factory _$GUserFolderData([void Function(GUserFolderDataBuilder)? updates]) =>
      (new GUserFolderDataBuilder()..update(updates))._build();

  _$GUserFolderData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFolderData', 'G__typename');
  }

  @override
  GUserFolderData rebuild(void Function(GUserFolderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolderDataBuilder toBuilder() =>
      new GUserFolderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolderData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFolderData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserFolderDataBuilder
    implements Builder<GUserFolderData, GUserFolderDataBuilder> {
  _$GUserFolderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserFolderData_userBuilder? _user;
  GUserFolderData_userBuilder get user =>
      _$this._user ??= new GUserFolderData_userBuilder();
  set user(GUserFolderData_userBuilder? user) => _$this._user = user;

  GUserFolderDataBuilder() {
    GUserFolderData._initializeBuilder(this);
  }

  GUserFolderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFolderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolderData;
  }

  @override
  void update(void Function(GUserFolderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolderData build() => _build();

  _$GUserFolderData _build() {
    _$GUserFolderData _$result;
    try {
      _$result = _$v ??
          new _$GUserFolderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFolderData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFolderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFolderData_user extends GUserFolderData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GUserFolderData_user_folders> folders;

  factory _$GUserFolderData_user(
          [void Function(GUserFolderData_userBuilder)? updates]) =>
      (new GUserFolderData_userBuilder()..update(updates))._build();

  _$GUserFolderData_user._(
      {required this.G__typename, required this.id, required this.folders})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFolderData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserFolderData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        folders, r'GUserFolderData_user', 'folders');
  }

  @override
  GUserFolderData_user rebuild(
          void Function(GUserFolderData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolderData_userBuilder toBuilder() =>
      new GUserFolderData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolderData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        folders == other.folders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, folders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFolderData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('folders', folders))
        .toString();
  }
}

class GUserFolderData_userBuilder
    implements Builder<GUserFolderData_user, GUserFolderData_userBuilder> {
  _$GUserFolderData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GUserFolderData_user_folders>? _folders;
  ListBuilder<GUserFolderData_user_folders> get folders =>
      _$this._folders ??= new ListBuilder<GUserFolderData_user_folders>();
  set folders(ListBuilder<GUserFolderData_user_folders>? folders) =>
      _$this._folders = folders;

  GUserFolderData_userBuilder() {
    GUserFolderData_user._initializeBuilder(this);
  }

  GUserFolderData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _folders = $v.folders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFolderData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolderData_user;
  }

  @override
  void update(void Function(GUserFolderData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolderData_user build() => _build();

  _$GUserFolderData_user _build() {
    _$GUserFolderData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserFolderData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFolderData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFolderData_user', 'id'),
              folders: folders.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folders';
        folders.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFolderData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFolderData_user_folders extends GUserFolderData_user_folders {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final _i3.GRating rating;
  @override
  final int likesCount;
  @override
  final int viewsCount;
  @override
  final GUserFolderData_user_folders_thumbnailImage? thumbnailImage;

  factory _$GUserFolderData_user_folders(
          [void Function(GUserFolderData_user_foldersBuilder)? updates]) =>
      (new GUserFolderData_user_foldersBuilder()..update(updates))._build();

  _$GUserFolderData_user_folders._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.rating,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFolderData_user_folders', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFolderData_user_folders', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUserFolderData_user_folders', 'title');
    BuiltValueNullFieldError.checkNotNull(
        rating, r'GUserFolderData_user_folders', 'rating');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GUserFolderData_user_folders', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GUserFolderData_user_folders', 'viewsCount');
  }

  @override
  GUserFolderData_user_folders rebuild(
          void Function(GUserFolderData_user_foldersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolderData_user_foldersBuilder toBuilder() =>
      new GUserFolderData_user_foldersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolderData_user_folders &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        rating == other.rating &&
        likesCount == other.likesCount &&
        viewsCount == other.viewsCount &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewsCount.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFolderData_user_folders')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('rating', rating)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GUserFolderData_user_foldersBuilder
    implements
        Builder<GUserFolderData_user_folders,
            GUserFolderData_user_foldersBuilder> {
  _$GUserFolderData_user_folders? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  _i3.GRating? _rating;
  _i3.GRating? get rating => _$this._rating;
  set rating(_i3.GRating? rating) => _$this._rating = rating;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _viewsCount;
  int? get viewsCount => _$this._viewsCount;
  set viewsCount(int? viewsCount) => _$this._viewsCount = viewsCount;

  GUserFolderData_user_folders_thumbnailImageBuilder? _thumbnailImage;
  GUserFolderData_user_folders_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GUserFolderData_user_folders_thumbnailImageBuilder();
  set thumbnailImage(
          GUserFolderData_user_folders_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GUserFolderData_user_foldersBuilder() {
    GUserFolderData_user_folders._initializeBuilder(this);
  }

  GUserFolderData_user_foldersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _rating = $v.rating;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFolderData_user_folders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolderData_user_folders;
  }

  @override
  void update(void Function(GUserFolderData_user_foldersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolderData_user_folders build() => _build();

  _$GUserFolderData_user_folders _build() {
    _$GUserFolderData_user_folders _$result;
    try {
      _$result = _$v ??
          new _$GUserFolderData_user_folders._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFolderData_user_folders', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFolderData_user_folders', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GUserFolderData_user_folders', 'title'),
              rating: BuiltValueNullFieldError.checkNotNull(
                  rating, r'GUserFolderData_user_folders', 'rating'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GUserFolderData_user_folders', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GUserFolderData_user_folders', 'viewsCount'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFolderData_user_folders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFolderData_user_folders_thumbnailImage
    extends GUserFolderData_user_folders_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserFolderData_user_folders_thumbnailImage(
          [void Function(GUserFolderData_user_folders_thumbnailImageBuilder)?
              updates]) =>
      (new GUserFolderData_user_folders_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GUserFolderData_user_folders_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUserFolderData_user_folders_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFolderData_user_folders_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GUserFolderData_user_folders_thumbnailImage', 'downloadURL');
  }

  @override
  GUserFolderData_user_folders_thumbnailImage rebuild(
          void Function(GUserFolderData_user_folders_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolderData_user_folders_thumbnailImageBuilder toBuilder() =>
      new GUserFolderData_user_folders_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolderData_user_folders_thumbnailImage &&
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
    return (newBuiltValueToStringHelper(
            r'GUserFolderData_user_folders_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserFolderData_user_folders_thumbnailImageBuilder
    implements
        Builder<GUserFolderData_user_folders_thumbnailImage,
            GUserFolderData_user_folders_thumbnailImageBuilder> {
  _$GUserFolderData_user_folders_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserFolderData_user_folders_thumbnailImageBuilder() {
    GUserFolderData_user_folders_thumbnailImage._initializeBuilder(this);
  }

  GUserFolderData_user_folders_thumbnailImageBuilder get _$this {
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
  void replace(GUserFolderData_user_folders_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolderData_user_folders_thumbnailImage;
  }

  @override
  void update(
      void Function(GUserFolderData_user_folders_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolderData_user_folders_thumbnailImage build() => _build();

  _$GUserFolderData_user_folders_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GUserFolderData_user_folders_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserFolderData_user_folders_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserFolderData_user_folders_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GUserFolderData_user_folders_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
