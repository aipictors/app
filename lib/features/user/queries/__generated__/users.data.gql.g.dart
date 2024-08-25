// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUsersData> _$gUsersDataSerializer = new _$GUsersDataSerializer();
Serializer<GUsersData_users> _$gUsersDataUsersSerializer =
    new _$GUsersData_usersSerializer();

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
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
  final String? iconUrl;

  factory _$GUsersData_users(
          [void Function(GUsersData_usersBuilder)? updates]) =>
      (new GUsersData_usersBuilder()..update(updates))._build();

  _$GUsersData_users._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconUrl})
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
    return (newBuiltValueToStringHelper(r'GUsersData_users')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconUrl', iconUrl))
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

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

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
      _iconUrl = $v.iconUrl;
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
    final _$result = _$v ??
        new _$GUsersData_users._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUsersData_users', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUsersData_users', 'id'),
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GUsersData_users', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GUsersData_users', 'name'),
            iconUrl: iconUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
