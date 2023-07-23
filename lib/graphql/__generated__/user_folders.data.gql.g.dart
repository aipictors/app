// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_folders.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserFoldersData> _$gUserFoldersDataSerializer =
    new _$GUserFoldersDataSerializer();
Serializer<GUserFoldersData_user> _$gUserFoldersDataUserSerializer =
    new _$GUserFoldersData_userSerializer();
Serializer<GUserFoldersData_user_folders>
    _$gUserFoldersDataUserFoldersSerializer =
    new _$GUserFoldersData_user_foldersSerializer();
Serializer<GUserFoldersData_user_folders_thumbnailImage>
    _$gUserFoldersDataUserFoldersThumbnailImageSerializer =
    new _$GUserFoldersData_user_folders_thumbnailImageSerializer();

class _$GUserFoldersDataSerializer
    implements StructuredSerializer<GUserFoldersData> {
  @override
  final Iterable<Type> types = const [GUserFoldersData, _$GUserFoldersData];
  @override
  final String wireName = 'GUserFoldersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserFoldersData object,
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
            specifiedType: const FullType(GUserFoldersData_user)));
    }
    return result;
  }

  @override
  GUserFoldersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFoldersDataBuilder();

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
                  specifiedType: const FullType(GUserFoldersData_user))!
              as GUserFoldersData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFoldersData_userSerializer
    implements StructuredSerializer<GUserFoldersData_user> {
  @override
  final Iterable<Type> types = const [
    GUserFoldersData_user,
    _$GUserFoldersData_user
  ];
  @override
  final String wireName = 'GUserFoldersData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFoldersData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'folders',
      serializers.serialize(object.folders,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GUserFoldersData_user_folders)])),
    ];

    return result;
  }

  @override
  GUserFoldersData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFoldersData_userBuilder();

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
                const FullType(GUserFoldersData_user_folders)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFoldersData_user_foldersSerializer
    implements StructuredSerializer<GUserFoldersData_user_folders> {
  @override
  final Iterable<Type> types = const [
    GUserFoldersData_user_folders,
    _$GUserFoldersData_user_folders
  ];
  @override
  final String wireName = 'GUserFoldersData_user_folders';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFoldersData_user_folders object,
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
                const FullType(GUserFoldersData_user_folders_thumbnailImage)));
    }
    return result;
  }

  @override
  GUserFoldersData_user_folders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFoldersData_user_foldersBuilder();

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
                      GUserFoldersData_user_folders_thumbnailImage))!
              as GUserFoldersData_user_folders_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFoldersData_user_folders_thumbnailImageSerializer
    implements
        StructuredSerializer<GUserFoldersData_user_folders_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GUserFoldersData_user_folders_thumbnailImage,
    _$GUserFoldersData_user_folders_thumbnailImage
  ];
  @override
  final String wireName = 'GUserFoldersData_user_folders_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserFoldersData_user_folders_thumbnailImage object,
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
  GUserFoldersData_user_folders_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFoldersData_user_folders_thumbnailImageBuilder();

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

class _$GUserFoldersData extends GUserFoldersData {
  @override
  final String G__typename;
  @override
  final GUserFoldersData_user? user;

  factory _$GUserFoldersData(
          [void Function(GUserFoldersDataBuilder)? updates]) =>
      (new GUserFoldersDataBuilder()..update(updates))._build();

  _$GUserFoldersData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFoldersData', 'G__typename');
  }

  @override
  GUserFoldersData rebuild(void Function(GUserFoldersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFoldersDataBuilder toBuilder() =>
      new GUserFoldersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFoldersData &&
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
    return (newBuiltValueToStringHelper(r'GUserFoldersData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserFoldersDataBuilder
    implements Builder<GUserFoldersData, GUserFoldersDataBuilder> {
  _$GUserFoldersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserFoldersData_userBuilder? _user;
  GUserFoldersData_userBuilder get user =>
      _$this._user ??= new GUserFoldersData_userBuilder();
  set user(GUserFoldersData_userBuilder? user) => _$this._user = user;

  GUserFoldersDataBuilder() {
    GUserFoldersData._initializeBuilder(this);
  }

  GUserFoldersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFoldersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFoldersData;
  }

  @override
  void update(void Function(GUserFoldersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFoldersData build() => _build();

  _$GUserFoldersData _build() {
    _$GUserFoldersData _$result;
    try {
      _$result = _$v ??
          new _$GUserFoldersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFoldersData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFoldersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFoldersData_user extends GUserFoldersData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GUserFoldersData_user_folders> folders;

  factory _$GUserFoldersData_user(
          [void Function(GUserFoldersData_userBuilder)? updates]) =>
      (new GUserFoldersData_userBuilder()..update(updates))._build();

  _$GUserFoldersData_user._(
      {required this.G__typename, required this.id, required this.folders})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFoldersData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserFoldersData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        folders, r'GUserFoldersData_user', 'folders');
  }

  @override
  GUserFoldersData_user rebuild(
          void Function(GUserFoldersData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFoldersData_userBuilder toBuilder() =>
      new GUserFoldersData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFoldersData_user &&
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
    return (newBuiltValueToStringHelper(r'GUserFoldersData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('folders', folders))
        .toString();
  }
}

class GUserFoldersData_userBuilder
    implements Builder<GUserFoldersData_user, GUserFoldersData_userBuilder> {
  _$GUserFoldersData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GUserFoldersData_user_folders>? _folders;
  ListBuilder<GUserFoldersData_user_folders> get folders =>
      _$this._folders ??= new ListBuilder<GUserFoldersData_user_folders>();
  set folders(ListBuilder<GUserFoldersData_user_folders>? folders) =>
      _$this._folders = folders;

  GUserFoldersData_userBuilder() {
    GUserFoldersData_user._initializeBuilder(this);
  }

  GUserFoldersData_userBuilder get _$this {
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
  void replace(GUserFoldersData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFoldersData_user;
  }

  @override
  void update(void Function(GUserFoldersData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFoldersData_user build() => _build();

  _$GUserFoldersData_user _build() {
    _$GUserFoldersData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserFoldersData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFoldersData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFoldersData_user', 'id'),
              folders: folders.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folders';
        folders.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFoldersData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFoldersData_user_folders extends GUserFoldersData_user_folders {
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
  final GUserFoldersData_user_folders_thumbnailImage? thumbnailImage;

  factory _$GUserFoldersData_user_folders(
          [void Function(GUserFoldersData_user_foldersBuilder)? updates]) =>
      (new GUserFoldersData_user_foldersBuilder()..update(updates))._build();

  _$GUserFoldersData_user_folders._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.rating,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFoldersData_user_folders', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFoldersData_user_folders', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUserFoldersData_user_folders', 'title');
    BuiltValueNullFieldError.checkNotNull(
        rating, r'GUserFoldersData_user_folders', 'rating');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GUserFoldersData_user_folders', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GUserFoldersData_user_folders', 'viewsCount');
  }

  @override
  GUserFoldersData_user_folders rebuild(
          void Function(GUserFoldersData_user_foldersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFoldersData_user_foldersBuilder toBuilder() =>
      new GUserFoldersData_user_foldersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFoldersData_user_folders &&
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
    return (newBuiltValueToStringHelper(r'GUserFoldersData_user_folders')
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

class GUserFoldersData_user_foldersBuilder
    implements
        Builder<GUserFoldersData_user_folders,
            GUserFoldersData_user_foldersBuilder> {
  _$GUserFoldersData_user_folders? _$v;

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

  GUserFoldersData_user_folders_thumbnailImageBuilder? _thumbnailImage;
  GUserFoldersData_user_folders_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GUserFoldersData_user_folders_thumbnailImageBuilder();
  set thumbnailImage(
          GUserFoldersData_user_folders_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GUserFoldersData_user_foldersBuilder() {
    GUserFoldersData_user_folders._initializeBuilder(this);
  }

  GUserFoldersData_user_foldersBuilder get _$this {
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
  void replace(GUserFoldersData_user_folders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFoldersData_user_folders;
  }

  @override
  void update(void Function(GUserFoldersData_user_foldersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFoldersData_user_folders build() => _build();

  _$GUserFoldersData_user_folders _build() {
    _$GUserFoldersData_user_folders _$result;
    try {
      _$result = _$v ??
          new _$GUserFoldersData_user_folders._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFoldersData_user_folders', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFoldersData_user_folders', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GUserFoldersData_user_folders', 'title'),
              rating: BuiltValueNullFieldError.checkNotNull(
                  rating, r'GUserFoldersData_user_folders', 'rating'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GUserFoldersData_user_folders', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GUserFoldersData_user_folders', 'viewsCount'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFoldersData_user_folders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFoldersData_user_folders_thumbnailImage
    extends GUserFoldersData_user_folders_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserFoldersData_user_folders_thumbnailImage(
          [void Function(GUserFoldersData_user_folders_thumbnailImageBuilder)?
              updates]) =>
      (new GUserFoldersData_user_folders_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GUserFoldersData_user_folders_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUserFoldersData_user_folders_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFoldersData_user_folders_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GUserFoldersData_user_folders_thumbnailImage', 'downloadURL');
  }

  @override
  GUserFoldersData_user_folders_thumbnailImage rebuild(
          void Function(GUserFoldersData_user_folders_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFoldersData_user_folders_thumbnailImageBuilder toBuilder() =>
      new GUserFoldersData_user_folders_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFoldersData_user_folders_thumbnailImage &&
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
            r'GUserFoldersData_user_folders_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserFoldersData_user_folders_thumbnailImageBuilder
    implements
        Builder<GUserFoldersData_user_folders_thumbnailImage,
            GUserFoldersData_user_folders_thumbnailImageBuilder> {
  _$GUserFoldersData_user_folders_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserFoldersData_user_folders_thumbnailImageBuilder() {
    GUserFoldersData_user_folders_thumbnailImage._initializeBuilder(this);
  }

  GUserFoldersData_user_folders_thumbnailImageBuilder get _$this {
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
  void replace(GUserFoldersData_user_folders_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFoldersData_user_folders_thumbnailImage;
  }

  @override
  void update(
      void Function(GUserFoldersData_user_folders_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFoldersData_user_folders_thumbnailImage build() => _build();

  _$GUserFoldersData_user_folders_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GUserFoldersData_user_folders_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserFoldersData_user_folders_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserFoldersData_user_folders_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GUserFoldersData_user_folders_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
