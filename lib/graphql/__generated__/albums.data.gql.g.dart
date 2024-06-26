// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAlbumsData> _$gAlbumsDataSerializer = new _$GAlbumsDataSerializer();
Serializer<GAlbumsData_albums> _$gAlbumsDataAlbumsSerializer =
    new _$GAlbumsData_albumsSerializer();
Serializer<GAlbumsData_albums_user> _$gAlbumsDataAlbumsUserSerializer =
    new _$GAlbumsData_albums_userSerializer();

class _$GAlbumsDataSerializer implements StructuredSerializer<GAlbumsData> {
  @override
  final Iterable<Type> types = const [GAlbumsData, _$GAlbumsData];
  @override
  final String wireName = 'GAlbumsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAlbumsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.albums;
    if (value != null) {
      result
        ..add('albums')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GAlbumsData_albums)])));
    }
    return result;
  }

  @override
  GAlbumsData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumsDataBuilder();

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
        case 'albums':
          result.albums.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GAlbumsData_albums)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumsData_albumsSerializer
    implements StructuredSerializer<GAlbumsData_albums> {
  @override
  final Iterable<Type> types = const [GAlbumsData_albums, _$GAlbumsData_albums];
  @override
  final String wireName = 'GAlbumsData_albums';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumsData_albums object,
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
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GAlbumsData_albums_user)),
    ];
    Object? value;
    value = object.thumbnailImageURL;
    if (value != null) {
      result
        ..add('thumbnailImageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAlbumsData_albums deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumsData_albumsBuilder();

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
        case 'thumbnailImageURL':
          result.thumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAlbumsData_albums_user))!
              as GAlbumsData_albums_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumsData_albums_userSerializer
    implements StructuredSerializer<GAlbumsData_albums_user> {
  @override
  final Iterable<Type> types = const [
    GAlbumsData_albums_user,
    _$GAlbumsData_albums_user
  ];
  @override
  final String wireName = 'GAlbumsData_albums_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumsData_albums_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconUrl;
    if (value != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAlbumsData_albums_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumsData_albums_userBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumsData extends GAlbumsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GAlbumsData_albums>? albums;

  factory _$GAlbumsData([void Function(GAlbumsDataBuilder)? updates]) =>
      (new GAlbumsDataBuilder()..update(updates))._build();

  _$GAlbumsData._({required this.G__typename, this.albums}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumsData', 'G__typename');
  }

  @override
  GAlbumsData rebuild(void Function(GAlbumsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumsDataBuilder toBuilder() => new GAlbumsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumsData &&
        G__typename == other.G__typename &&
        albums == other.albums;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, albums.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumsData')
          ..add('G__typename', G__typename)
          ..add('albums', albums))
        .toString();
  }
}

class GAlbumsDataBuilder implements Builder<GAlbumsData, GAlbumsDataBuilder> {
  _$GAlbumsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAlbumsData_albums>? _albums;
  ListBuilder<GAlbumsData_albums> get albums =>
      _$this._albums ??= new ListBuilder<GAlbumsData_albums>();
  set albums(ListBuilder<GAlbumsData_albums>? albums) =>
      _$this._albums = albums;

  GAlbumsDataBuilder() {
    GAlbumsData._initializeBuilder(this);
  }

  GAlbumsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _albums = $v.albums?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumsData;
  }

  @override
  void update(void Function(GAlbumsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumsData build() => _build();

  _$GAlbumsData _build() {
    _$GAlbumsData _$result;
    try {
      _$result = _$v ??
          new _$GAlbumsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAlbumsData', 'G__typename'),
              albums: _albums?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'albums';
        _albums?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumsData_albums extends GAlbumsData_albums {
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
  final String? thumbnailImageURL;
  @override
  final GAlbumsData_albums_user user;

  factory _$GAlbumsData_albums(
          [void Function(GAlbumsData_albumsBuilder)? updates]) =>
      (new GAlbumsData_albumsBuilder()..update(updates))._build();

  _$GAlbumsData_albums._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.isSensitive,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImageURL,
      required this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumsData_albums', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GAlbumsData_albums', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GAlbumsData_albums', 'title');
    BuiltValueNullFieldError.checkNotNull(
        isSensitive, r'GAlbumsData_albums', 'isSensitive');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GAlbumsData_albums', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GAlbumsData_albums', 'viewsCount');
    BuiltValueNullFieldError.checkNotNull(user, r'GAlbumsData_albums', 'user');
  }

  @override
  GAlbumsData_albums rebuild(
          void Function(GAlbumsData_albumsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumsData_albumsBuilder toBuilder() =>
      new GAlbumsData_albumsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumsData_albums &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        isSensitive == other.isSensitive &&
        likesCount == other.likesCount &&
        viewsCount == other.viewsCount &&
        thumbnailImageURL == other.thumbnailImageURL &&
        user == other.user;
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
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumsData_albums')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('isSensitive', isSensitive)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('thumbnailImageURL', thumbnailImageURL)
          ..add('user', user))
        .toString();
  }
}

class GAlbumsData_albumsBuilder
    implements Builder<GAlbumsData_albums, GAlbumsData_albumsBuilder> {
  _$GAlbumsData_albums? _$v;

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

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  GAlbumsData_albums_userBuilder? _user;
  GAlbumsData_albums_userBuilder get user =>
      _$this._user ??= new GAlbumsData_albums_userBuilder();
  set user(GAlbumsData_albums_userBuilder? user) => _$this._user = user;

  GAlbumsData_albumsBuilder() {
    GAlbumsData_albums._initializeBuilder(this);
  }

  GAlbumsData_albumsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _isSensitive = $v.isSensitive;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumsData_albums other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumsData_albums;
  }

  @override
  void update(void Function(GAlbumsData_albumsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumsData_albums build() => _build();

  _$GAlbumsData_albums _build() {
    _$GAlbumsData_albums _$result;
    try {
      _$result = _$v ??
          new _$GAlbumsData_albums._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAlbumsData_albums', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GAlbumsData_albums', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GAlbumsData_albums', 'title'),
              isSensitive: BuiltValueNullFieldError.checkNotNull(
                  isSensitive, r'GAlbumsData_albums', 'isSensitive'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GAlbumsData_albums', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GAlbumsData_albums', 'viewsCount'),
              thumbnailImageURL: thumbnailImageURL,
              user: user.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumsData_albums', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumsData_albums_user extends GAlbumsData_albums_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final String? iconUrl;

  factory _$GAlbumsData_albums_user(
          [void Function(GAlbumsData_albums_userBuilder)? updates]) =>
      (new GAlbumsData_albums_userBuilder()..update(updates))._build();

  _$GAlbumsData_albums_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumsData_albums_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GAlbumsData_albums_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GAlbumsData_albums_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GAlbumsData_albums_user', 'name');
  }

  @override
  GAlbumsData_albums_user rebuild(
          void Function(GAlbumsData_albums_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumsData_albums_userBuilder toBuilder() =>
      new GAlbumsData_albums_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumsData_albums_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumsData_albums_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconUrl', iconUrl))
        .toString();
  }
}

class GAlbumsData_albums_userBuilder
    implements
        Builder<GAlbumsData_albums_user, GAlbumsData_albums_userBuilder> {
  _$GAlbumsData_albums_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  GAlbumsData_albums_userBuilder() {
    GAlbumsData_albums_user._initializeBuilder(this);
  }

  GAlbumsData_albums_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _name = $v.name;
      _iconUrl = $v.iconUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumsData_albums_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumsData_albums_user;
  }

  @override
  void update(void Function(GAlbumsData_albums_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumsData_albums_user build() => _build();

  _$GAlbumsData_albums_user _build() {
    final _$result = _$v ??
        new _$GAlbumsData_albums_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAlbumsData_albums_user', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAlbumsData_albums_user', 'id'),
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GAlbumsData_albums_user', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GAlbumsData_albums_user', 'name'),
            iconUrl: iconUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
