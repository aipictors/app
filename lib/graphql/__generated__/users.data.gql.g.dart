// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUsersData> _$gUsersDataSerializer = new _$GUsersDataSerializer();
Serializer<GUsersData_users> _$gUsersDataUsersSerializer =
    new _$GUsersData_usersSerializer();
Serializer<GUsersData_users_iconImage> _$gUsersDataUsersIconImageSerializer =
    new _$GUsersData_users_iconImageSerializer();

class _$GUsersDataSerializer implements StructuredSerializer<GUsersData> {
  @override
  final Iterable<Type> types = const [GUsersData, _$GUsersData];
  @override
  final String wireName = 'GUsersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUsersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'users',
      serializers.serialize(object.users,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GUsersData_users)])),
    ];

    return result;
  }

  @override
  GUsersData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUsersDataBuilder();

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
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GUsersData_users)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUsersData_usersSerializer
    implements StructuredSerializer<GUsersData_users> {
  @override
  final Iterable<Type> types = const [GUsersData_users, _$GUsersData_users];
  @override
  final String wireName = 'GUsersData_users';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUsersData_users object,
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
            specifiedType: const FullType(GUsersData_users_iconImage)));
    }
    return result;
  }

  @override
  GUsersData_users deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUsersData_usersBuilder();

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
                  specifiedType: const FullType(GUsersData_users_iconImage))!
              as GUsersData_users_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GUsersData_users_iconImageSerializer
    implements StructuredSerializer<GUsersData_users_iconImage> {
  @override
  final Iterable<Type> types = const [
    GUsersData_users_iconImage,
    _$GUsersData_users_iconImage
  ];
  @override
  final String wireName = 'GUsersData_users_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUsersData_users_iconImage object,
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
  GUsersData_users_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUsersData_users_iconImageBuilder();

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

class _$GUsersData extends GUsersData {
  @override
  final String G__typename;
  @override
  final BuiltList<GUsersData_users> users;

  factory _$GUsersData([void Function(GUsersDataBuilder)? updates]) =>
      (new GUsersDataBuilder()..update(updates))._build();

  _$GUsersData._({required this.G__typename, required this.users}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUsersData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(users, r'GUsersData', 'users');
  }

  @override
  GUsersData rebuild(void Function(GUsersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUsersDataBuilder toBuilder() => new GUsersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersData &&
        G__typename == other.G__typename &&
        users == other.users;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUsersData')
          ..add('G__typename', G__typename)
          ..add('users', users))
        .toString();
  }
}

class GUsersDataBuilder implements Builder<GUsersData, GUsersDataBuilder> {
  _$GUsersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GUsersData_users>? _users;
  ListBuilder<GUsersData_users> get users =>
      _$this._users ??= new ListBuilder<GUsersData_users>();
  set users(ListBuilder<GUsersData_users>? users) => _$this._users = users;

  GUsersDataBuilder() {
    GUsersData._initializeBuilder(this);
  }

  GUsersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUsersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUsersData;
  }

  @override
  void update(void Function(GUsersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersData build() => _build();

  _$GUsersData _build() {
    _$GUsersData _$result;
    try {
      _$result = _$v ??
          new _$GUsersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUsersData', 'G__typename'),
              users: users.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUsersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUsersData_users extends GUsersData_users {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GUsersData_users_iconImage? iconImage;

  factory _$GUsersData_users(
          [void Function(GUsersData_usersBuilder)? updates]) =>
      (new GUsersData_usersBuilder()..update(updates))._build();

  _$GUsersData_users._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUsersData_users', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUsersData_users', 'id');
    BuiltValueNullFieldError.checkNotNull(login, r'GUsersData_users', 'login');
    BuiltValueNullFieldError.checkNotNull(name, r'GUsersData_users', 'name');
  }

  @override
  GUsersData_users rebuild(void Function(GUsersData_usersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUsersData_usersBuilder toBuilder() =>
      new GUsersData_usersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersData_users &&
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
    return (newBuiltValueToStringHelper(r'GUsersData_users')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GUsersData_usersBuilder
    implements Builder<GUsersData_users, GUsersData_usersBuilder> {
  _$GUsersData_users? _$v;

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

  GUsersData_users_iconImageBuilder? _iconImage;
  GUsersData_users_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GUsersData_users_iconImageBuilder();
  set iconImage(GUsersData_users_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GUsersData_usersBuilder() {
    GUsersData_users._initializeBuilder(this);
  }

  GUsersData_usersBuilder get _$this {
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
  void replace(GUsersData_users other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUsersData_users;
  }

  @override
  void update(void Function(GUsersData_usersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersData_users build() => _build();

  _$GUsersData_users _build() {
    _$GUsersData_users _$result;
    try {
      _$result = _$v ??
          new _$GUsersData_users._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUsersData_users', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUsersData_users', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GUsersData_users', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GUsersData_users', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUsersData_users', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUsersData_users_iconImage extends GUsersData_users_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUsersData_users_iconImage(
          [void Function(GUsersData_users_iconImageBuilder)? updates]) =>
      (new GUsersData_users_iconImageBuilder()..update(updates))._build();

  _$GUsersData_users_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUsersData_users_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUsersData_users_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GUsersData_users_iconImage', 'downloadURL');
  }

  @override
  GUsersData_users_iconImage rebuild(
          void Function(GUsersData_users_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUsersData_users_iconImageBuilder toBuilder() =>
      new GUsersData_users_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersData_users_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GUsersData_users_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUsersData_users_iconImageBuilder
    implements
        Builder<GUsersData_users_iconImage, GUsersData_users_iconImageBuilder> {
  _$GUsersData_users_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUsersData_users_iconImageBuilder() {
    GUsersData_users_iconImage._initializeBuilder(this);
  }

  GUsersData_users_iconImageBuilder get _$this {
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
  void replace(GUsersData_users_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUsersData_users_iconImage;
  }

  @override
  void update(void Function(GUsersData_users_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersData_users_iconImage build() => _build();

  _$GUsersData_users_iconImage _build() {
    final _$result = _$v ??
        new _$GUsersData_users_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUsersData_users_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUsersData_users_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GUsersData_users_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
