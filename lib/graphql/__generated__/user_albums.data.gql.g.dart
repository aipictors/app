// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_albums.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserAlbumsData> _$gUserAlbumsDataSerializer =
    new _$GUserAlbumsDataSerializer();
Serializer<GUserAlbumsData_user> _$gUserAlbumsDataUserSerializer =
    new _$GUserAlbumsData_userSerializer();
Serializer<GUserAlbumsData_user_albums> _$gUserAlbumsDataUserAlbumsSerializer =
    new _$GUserAlbumsData_user_albumsSerializer();
Serializer<GUserAlbumsData_user_albums_thumbnailImage>
    _$gUserAlbumsDataUserAlbumsThumbnailImageSerializer =
    new _$GUserAlbumsData_user_albums_thumbnailImageSerializer();

class _$GUserAlbumsDataSerializer
    implements StructuredSerializer<GUserAlbumsData> {
  @override
  final Iterable<Type> types = const [GUserAlbumsData, _$GUserAlbumsData];
  @override
  final String wireName = 'GUserAlbumsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserAlbumsData object,
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
            specifiedType: const FullType(GUserAlbumsData_user)));
    }
    return result;
  }

  @override
  GUserAlbumsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserAlbumsDataBuilder();

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
                  specifiedType: const FullType(GUserAlbumsData_user))!
              as GUserAlbumsData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserAlbumsData_userSerializer
    implements StructuredSerializer<GUserAlbumsData_user> {
  @override
  final Iterable<Type> types = const [
    GUserAlbumsData_user,
    _$GUserAlbumsData_user
  ];
  @override
  final String wireName = 'GUserAlbumsData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserAlbumsData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'albums',
      serializers.serialize(object.albums,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GUserAlbumsData_user_albums)])),
    ];

    return result;
  }

  @override
  GUserAlbumsData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserAlbumsData_userBuilder();

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
        case 'albums':
          result.albums.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserAlbumsData_user_albums)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserAlbumsData_user_albumsSerializer
    implements StructuredSerializer<GUserAlbumsData_user_albums> {
  @override
  final Iterable<Type> types = const [
    GUserAlbumsData_user_albums,
    _$GUserAlbumsData_user_albums
  ];
  @override
  final String wireName = 'GUserAlbumsData_user_albums';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserAlbumsData_user_albums object,
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
      'isSensitive',
      serializers.serialize(object.isSensitive,
          specifiedType: const FullType(bool)),
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
                const FullType(GUserAlbumsData_user_albums_thumbnailImage)));
    }
    return result;
  }

  @override
  GUserAlbumsData_user_albums deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserAlbumsData_user_albumsBuilder();

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
        case 'isSensitive':
          result.isSensitive = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
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
                      GUserAlbumsData_user_albums_thumbnailImage))!
              as GUserAlbumsData_user_albums_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserAlbumsData_user_albums_thumbnailImageSerializer
    implements
        StructuredSerializer<GUserAlbumsData_user_albums_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GUserAlbumsData_user_albums_thumbnailImage,
    _$GUserAlbumsData_user_albums_thumbnailImage
  ];
  @override
  final String wireName = 'GUserAlbumsData_user_albums_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserAlbumsData_user_albums_thumbnailImage object,
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
  GUserAlbumsData_user_albums_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserAlbumsData_user_albums_thumbnailImageBuilder();

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

class _$GUserAlbumsData extends GUserAlbumsData {
  @override
  final String G__typename;
  @override
  final GUserAlbumsData_user? user;

  factory _$GUserAlbumsData([void Function(GUserAlbumsDataBuilder)? updates]) =>
      (new GUserAlbumsDataBuilder()..update(updates))._build();

  _$GUserAlbumsData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserAlbumsData', 'G__typename');
  }

  @override
  GUserAlbumsData rebuild(void Function(GUserAlbumsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserAlbumsDataBuilder toBuilder() =>
      new GUserAlbumsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserAlbumsData &&
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
    return (newBuiltValueToStringHelper(r'GUserAlbumsData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserAlbumsDataBuilder
    implements Builder<GUserAlbumsData, GUserAlbumsDataBuilder> {
  _$GUserAlbumsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserAlbumsData_userBuilder? _user;
  GUserAlbumsData_userBuilder get user =>
      _$this._user ??= new GUserAlbumsData_userBuilder();
  set user(GUserAlbumsData_userBuilder? user) => _$this._user = user;

  GUserAlbumsDataBuilder() {
    GUserAlbumsData._initializeBuilder(this);
  }

  GUserAlbumsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserAlbumsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserAlbumsData;
  }

  @override
  void update(void Function(GUserAlbumsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserAlbumsData build() => _build();

  _$GUserAlbumsData _build() {
    _$GUserAlbumsData _$result;
    try {
      _$result = _$v ??
          new _$GUserAlbumsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserAlbumsData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserAlbumsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserAlbumsData_user extends GUserAlbumsData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GUserAlbumsData_user_albums> albums;

  factory _$GUserAlbumsData_user(
          [void Function(GUserAlbumsData_userBuilder)? updates]) =>
      (new GUserAlbumsData_userBuilder()..update(updates))._build();

  _$GUserAlbumsData_user._(
      {required this.G__typename, required this.id, required this.albums})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserAlbumsData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserAlbumsData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        albums, r'GUserAlbumsData_user', 'albums');
  }

  @override
  GUserAlbumsData_user rebuild(
          void Function(GUserAlbumsData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserAlbumsData_userBuilder toBuilder() =>
      new GUserAlbumsData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserAlbumsData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        albums == other.albums;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, albums.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserAlbumsData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('albums', albums))
        .toString();
  }
}

class GUserAlbumsData_userBuilder
    implements Builder<GUserAlbumsData_user, GUserAlbumsData_userBuilder> {
  _$GUserAlbumsData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GUserAlbumsData_user_albums>? _albums;
  ListBuilder<GUserAlbumsData_user_albums> get albums =>
      _$this._albums ??= new ListBuilder<GUserAlbumsData_user_albums>();
  set albums(ListBuilder<GUserAlbumsData_user_albums>? albums) =>
      _$this._albums = albums;

  GUserAlbumsData_userBuilder() {
    GUserAlbumsData_user._initializeBuilder(this);
  }

  GUserAlbumsData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _albums = $v.albums.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserAlbumsData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserAlbumsData_user;
  }

  @override
  void update(void Function(GUserAlbumsData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserAlbumsData_user build() => _build();

  _$GUserAlbumsData_user _build() {
    _$GUserAlbumsData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserAlbumsData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserAlbumsData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserAlbumsData_user', 'id'),
              albums: albums.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'albums';
        albums.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserAlbumsData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserAlbumsData_user_albums extends GUserAlbumsData_user_albums {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final bool isSensitive;
  @override
  final int likesCount;
  @override
  final int viewsCount;
  @override
  final GUserAlbumsData_user_albums_thumbnailImage? thumbnailImage;

  factory _$GUserAlbumsData_user_albums(
          [void Function(GUserAlbumsData_user_albumsBuilder)? updates]) =>
      (new GUserAlbumsData_user_albumsBuilder()..update(updates))._build();

  _$GUserAlbumsData_user_albums._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.isSensitive,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserAlbumsData_user_albums', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserAlbumsData_user_albums', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUserAlbumsData_user_albums', 'title');
    BuiltValueNullFieldError.checkNotNull(
        isSensitive, r'GUserAlbumsData_user_albums', 'isSensitive');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GUserAlbumsData_user_albums', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GUserAlbumsData_user_albums', 'viewsCount');
  }

  @override
  GUserAlbumsData_user_albums rebuild(
          void Function(GUserAlbumsData_user_albumsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserAlbumsData_user_albumsBuilder toBuilder() =>
      new GUserAlbumsData_user_albumsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserAlbumsData_user_albums &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        isSensitive == other.isSensitive &&
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
    _$hash = $jc(_$hash, isSensitive.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewsCount.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserAlbumsData_user_albums')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('isSensitive', isSensitive)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GUserAlbumsData_user_albumsBuilder
    implements
        Builder<GUserAlbumsData_user_albums,
            GUserAlbumsData_user_albumsBuilder> {
  _$GUserAlbumsData_user_albums? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _isSensitive;
  bool? get isSensitive => _$this._isSensitive;
  set isSensitive(bool? isSensitive) => _$this._isSensitive = isSensitive;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _viewsCount;
  int? get viewsCount => _$this._viewsCount;
  set viewsCount(int? viewsCount) => _$this._viewsCount = viewsCount;

  GUserAlbumsData_user_albums_thumbnailImageBuilder? _thumbnailImage;
  GUserAlbumsData_user_albums_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GUserAlbumsData_user_albums_thumbnailImageBuilder();
  set thumbnailImage(
          GUserAlbumsData_user_albums_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GUserAlbumsData_user_albumsBuilder() {
    GUserAlbumsData_user_albums._initializeBuilder(this);
  }

  GUserAlbumsData_user_albumsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _isSensitive = $v.isSensitive;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserAlbumsData_user_albums other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserAlbumsData_user_albums;
  }

  @override
  void update(void Function(GUserAlbumsData_user_albumsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserAlbumsData_user_albums build() => _build();

  _$GUserAlbumsData_user_albums _build() {
    _$GUserAlbumsData_user_albums _$result;
    try {
      _$result = _$v ??
          new _$GUserAlbumsData_user_albums._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserAlbumsData_user_albums', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserAlbumsData_user_albums', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GUserAlbumsData_user_albums', 'title'),
              isSensitive: BuiltValueNullFieldError.checkNotNull(
                  isSensitive, r'GUserAlbumsData_user_albums', 'isSensitive'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GUserAlbumsData_user_albums', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GUserAlbumsData_user_albums', 'viewsCount'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserAlbumsData_user_albums', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserAlbumsData_user_albums_thumbnailImage
    extends GUserAlbumsData_user_albums_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserAlbumsData_user_albums_thumbnailImage(
          [void Function(GUserAlbumsData_user_albums_thumbnailImageBuilder)?
              updates]) =>
      (new GUserAlbumsData_user_albums_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GUserAlbumsData_user_albums_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUserAlbumsData_user_albums_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserAlbumsData_user_albums_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GUserAlbumsData_user_albums_thumbnailImage', 'downloadURL');
  }

  @override
  GUserAlbumsData_user_albums_thumbnailImage rebuild(
          void Function(GUserAlbumsData_user_albums_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserAlbumsData_user_albums_thumbnailImageBuilder toBuilder() =>
      new GUserAlbumsData_user_albums_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserAlbumsData_user_albums_thumbnailImage &&
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
            r'GUserAlbumsData_user_albums_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserAlbumsData_user_albums_thumbnailImageBuilder
    implements
        Builder<GUserAlbumsData_user_albums_thumbnailImage,
            GUserAlbumsData_user_albums_thumbnailImageBuilder> {
  _$GUserAlbumsData_user_albums_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserAlbumsData_user_albums_thumbnailImageBuilder() {
    GUserAlbumsData_user_albums_thumbnailImage._initializeBuilder(this);
  }

  GUserAlbumsData_user_albums_thumbnailImageBuilder get _$this {
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
  void replace(GUserAlbumsData_user_albums_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserAlbumsData_user_albums_thumbnailImage;
  }

  @override
  void update(
      void Function(GUserAlbumsData_user_albums_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserAlbumsData_user_albums_thumbnailImage build() => _build();

  _$GUserAlbumsData_user_albums_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GUserAlbumsData_user_albums_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserAlbumsData_user_albums_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserAlbumsData_user_albums_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GUserAlbumsData_user_albums_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
