// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_followers.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserFollowersData> _$gUserFollowersDataSerializer =
    new _$GUserFollowersDataSerializer();
Serializer<GUserFollowersData_user> _$gUserFollowersDataUserSerializer =
    new _$GUserFollowersData_userSerializer();
Serializer<GUserFollowersData_user_followers>
    _$gUserFollowersDataUserFollowersSerializer =
    new _$GUserFollowersData_user_followersSerializer();
Serializer<GUserFollowersData_user_followers_iconImage>
    _$gUserFollowersDataUserFollowersIconImageSerializer =
    new _$GUserFollowersData_user_followers_iconImageSerializer();

class _$GUserFollowersDataSerializer
    implements StructuredSerializer<GUserFollowersData> {
  @override
  final Iterable<Type> types = const [GUserFollowersData, _$GUserFollowersData];
  @override
  final String wireName = 'GUserFollowersData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFollowersData object,
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
            specifiedType: const FullType(GUserFollowersData_user)));
    }
    return result;
  }

  @override
  GUserFollowersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFollowersDataBuilder();

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
                  specifiedType: const FullType(GUserFollowersData_user))!
              as GUserFollowersData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFollowersData_userSerializer
    implements StructuredSerializer<GUserFollowersData_user> {
  @override
  final Iterable<Type> types = const [
    GUserFollowersData_user,
    _$GUserFollowersData_user
  ];
  @override
  final String wireName = 'GUserFollowersData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFollowersData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'followers',
      serializers.serialize(object.followers,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GUserFollowersData_user_followers)])),
    ];

    return result;
  }

  @override
  GUserFollowersData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFollowersData_userBuilder();

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
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserFollowersData_user_followers)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFollowersData_user_followersSerializer
    implements StructuredSerializer<GUserFollowersData_user_followers> {
  @override
  final Iterable<Type> types = const [
    GUserFollowersData_user_followers,
    _$GUserFollowersData_user_followers
  ];
  @override
  final String wireName = 'GUserFollowersData_user_followers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFollowersData_user_followers object,
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
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GUserFollowersData_user_followers_iconImage)));
    }
    return result;
  }

  @override
  GUserFollowersData_user_followers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFollowersData_user_followersBuilder();

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
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GUserFollowersData_user_followers_iconImage))!
              as GUserFollowersData_user_followers_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFollowersData_user_followers_iconImageSerializer
    implements
        StructuredSerializer<GUserFollowersData_user_followers_iconImage> {
  @override
  final Iterable<Type> types = const [
    GUserFollowersData_user_followers_iconImage,
    _$GUserFollowersData_user_followers_iconImage
  ];
  @override
  final String wireName = 'GUserFollowersData_user_followers_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserFollowersData_user_followers_iconImage object,
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
  GUserFollowersData_user_followers_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFollowersData_user_followers_iconImageBuilder();

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

class _$GUserFollowersData extends GUserFollowersData {
  @override
  final String G__typename;
  @override
  final GUserFollowersData_user? user;

  factory _$GUserFollowersData(
          [void Function(GUserFollowersDataBuilder)? updates]) =>
      (new GUserFollowersDataBuilder()..update(updates))._build();

  _$GUserFollowersData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFollowersData', 'G__typename');
  }

  @override
  GUserFollowersData rebuild(
          void Function(GUserFollowersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFollowersDataBuilder toBuilder() =>
      new GUserFollowersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFollowersData &&
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
    return (newBuiltValueToStringHelper(r'GUserFollowersData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserFollowersDataBuilder
    implements Builder<GUserFollowersData, GUserFollowersDataBuilder> {
  _$GUserFollowersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserFollowersData_userBuilder? _user;
  GUserFollowersData_userBuilder get user =>
      _$this._user ??= new GUserFollowersData_userBuilder();
  set user(GUserFollowersData_userBuilder? user) => _$this._user = user;

  GUserFollowersDataBuilder() {
    GUserFollowersData._initializeBuilder(this);
  }

  GUserFollowersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFollowersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFollowersData;
  }

  @override
  void update(void Function(GUserFollowersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFollowersData build() => _build();

  _$GUserFollowersData _build() {
    _$GUserFollowersData _$result;
    try {
      _$result = _$v ??
          new _$GUserFollowersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFollowersData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFollowersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFollowersData_user extends GUserFollowersData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GUserFollowersData_user_followers> followers;

  factory _$GUserFollowersData_user(
          [void Function(GUserFollowersData_userBuilder)? updates]) =>
      (new GUserFollowersData_userBuilder()..update(updates))._build();

  _$GUserFollowersData_user._(
      {required this.G__typename, required this.id, required this.followers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFollowersData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserFollowersData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        followers, r'GUserFollowersData_user', 'followers');
  }

  @override
  GUserFollowersData_user rebuild(
          void Function(GUserFollowersData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFollowersData_userBuilder toBuilder() =>
      new GUserFollowersData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFollowersData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        followers == other.followers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, followers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFollowersData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('followers', followers))
        .toString();
  }
}

class GUserFollowersData_userBuilder
    implements
        Builder<GUserFollowersData_user, GUserFollowersData_userBuilder> {
  _$GUserFollowersData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GUserFollowersData_user_followers>? _followers;
  ListBuilder<GUserFollowersData_user_followers> get followers =>
      _$this._followers ??=
          new ListBuilder<GUserFollowersData_user_followers>();
  set followers(ListBuilder<GUserFollowersData_user_followers>? followers) =>
      _$this._followers = followers;

  GUserFollowersData_userBuilder() {
    GUserFollowersData_user._initializeBuilder(this);
  }

  GUserFollowersData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _followers = $v.followers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFollowersData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFollowersData_user;
  }

  @override
  void update(void Function(GUserFollowersData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFollowersData_user build() => _build();

  _$GUserFollowersData_user _build() {
    _$GUserFollowersData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserFollowersData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFollowersData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFollowersData_user', 'id'),
              followers: followers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'followers';
        followers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFollowersData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFollowersData_user_followers
    extends GUserFollowersData_user_followers {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GUserFollowersData_user_followers_iconImage? iconImage;

  factory _$GUserFollowersData_user_followers(
          [void Function(GUserFollowersData_user_followersBuilder)? updates]) =>
      (new GUserFollowersData_user_followersBuilder()..update(updates))
          ._build();

  _$GUserFollowersData_user_followers._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFollowersData_user_followers', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFollowersData_user_followers', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GUserFollowersData_user_followers', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GUserFollowersData_user_followers', 'name');
  }

  @override
  GUserFollowersData_user_followers rebuild(
          void Function(GUserFollowersData_user_followersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFollowersData_user_followersBuilder toBuilder() =>
      new GUserFollowersData_user_followersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFollowersData_user_followers &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFollowersData_user_followers')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GUserFollowersData_user_followersBuilder
    implements
        Builder<GUserFollowersData_user_followers,
            GUserFollowersData_user_followersBuilder> {
  _$GUserFollowersData_user_followers? _$v;

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

  GUserFollowersData_user_followers_iconImageBuilder? _iconImage;
  GUserFollowersData_user_followers_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GUserFollowersData_user_followers_iconImageBuilder();
  set iconImage(
          GUserFollowersData_user_followers_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GUserFollowersData_user_followersBuilder() {
    GUserFollowersData_user_followers._initializeBuilder(this);
  }

  GUserFollowersData_user_followersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _name = $v.name;
      _iconImage = $v.iconImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFollowersData_user_followers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFollowersData_user_followers;
  }

  @override
  void update(
      void Function(GUserFollowersData_user_followersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFollowersData_user_followers build() => _build();

  _$GUserFollowersData_user_followers _build() {
    _$GUserFollowersData_user_followers _$result;
    try {
      _$result = _$v ??
          new _$GUserFollowersData_user_followers._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GUserFollowersData_user_followers', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFollowersData_user_followers', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GUserFollowersData_user_followers', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GUserFollowersData_user_followers', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFollowersData_user_followers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFollowersData_user_followers_iconImage
    extends GUserFollowersData_user_followers_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserFollowersData_user_followers_iconImage(
          [void Function(GUserFollowersData_user_followers_iconImageBuilder)?
              updates]) =>
      (new GUserFollowersData_user_followers_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GUserFollowersData_user_followers_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUserFollowersData_user_followers_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFollowersData_user_followers_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GUserFollowersData_user_followers_iconImage', 'downloadURL');
  }

  @override
  GUserFollowersData_user_followers_iconImage rebuild(
          void Function(GUserFollowersData_user_followers_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFollowersData_user_followers_iconImageBuilder toBuilder() =>
      new GUserFollowersData_user_followers_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFollowersData_user_followers_iconImage &&
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
            r'GUserFollowersData_user_followers_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserFollowersData_user_followers_iconImageBuilder
    implements
        Builder<GUserFollowersData_user_followers_iconImage,
            GUserFollowersData_user_followers_iconImageBuilder> {
  _$GUserFollowersData_user_followers_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserFollowersData_user_followers_iconImageBuilder() {
    GUserFollowersData_user_followers_iconImage._initializeBuilder(this);
  }

  GUserFollowersData_user_followers_iconImageBuilder get _$this {
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
  void replace(GUserFollowersData_user_followers_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFollowersData_user_followers_iconImage;
  }

  @override
  void update(
      void Function(GUserFollowersData_user_followers_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFollowersData_user_followers_iconImage build() => _build();

  _$GUserFollowersData_user_followers_iconImage _build() {
    final _$result = _$v ??
        new _$GUserFollowersData_user_followers_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserFollowersData_user_followers_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserFollowersData_user_followers_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GUserFollowersData_user_followers_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
