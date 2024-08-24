// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_notification_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFollowNotificationFieldsData>
    _$gFollowNotificationFieldsDataSerializer =
    new _$GFollowNotificationFieldsDataSerializer();
Serializer<GFollowNotificationFieldsData_user>
    _$gFollowNotificationFieldsDataUserSerializer =
    new _$GFollowNotificationFieldsData_userSerializer();

class _$GFollowNotificationFieldsDataSerializer
    implements StructuredSerializer<GFollowNotificationFieldsData> {
  @override
  final Iterable<Type> types = const [
    GFollowNotificationFieldsData,
    _$GFollowNotificationFieldsData
  ];
  @override
  final String wireName = 'GFollowNotificationFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFollowNotificationFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFollowNotificationFieldsData_user)));
    }
    return result;
  }

  @override
  GFollowNotificationFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowNotificationFieldsDataBuilder();

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
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFollowNotificationFieldsData_user))!
              as GFollowNotificationFieldsData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowNotificationFieldsData_userSerializer
    implements StructuredSerializer<GFollowNotificationFieldsData_user> {
  @override
  final Iterable<Type> types = const [
    GFollowNotificationFieldsData_user,
    _$GFollowNotificationFieldsData_user
  ];
  @override
  final String wireName = 'GFollowNotificationFieldsData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFollowNotificationFieldsData_user object,
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
  GFollowNotificationFieldsData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowNotificationFieldsData_userBuilder();

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

class _$GFollowNotificationFieldsData extends GFollowNotificationFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final GFollowNotificationFieldsData_user? user;

  factory _$GFollowNotificationFieldsData(
          [void Function(GFollowNotificationFieldsDataBuilder)? updates]) =>
      (new GFollowNotificationFieldsDataBuilder()..update(updates))._build();

  _$GFollowNotificationFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFollowNotificationFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFollowNotificationFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFollowNotificationFieldsData', 'createdAt');
  }

  @override
  GFollowNotificationFieldsData rebuild(
          void Function(GFollowNotificationFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowNotificationFieldsDataBuilder toBuilder() =>
      new GFollowNotificationFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowNotificationFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFollowNotificationFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('user', user))
        .toString();
  }
}

class GFollowNotificationFieldsDataBuilder
    implements
        Builder<GFollowNotificationFieldsData,
            GFollowNotificationFieldsDataBuilder> {
  _$GFollowNotificationFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  GFollowNotificationFieldsData_userBuilder? _user;
  GFollowNotificationFieldsData_userBuilder get user =>
      _$this._user ??= new GFollowNotificationFieldsData_userBuilder();
  set user(GFollowNotificationFieldsData_userBuilder? user) =>
      _$this._user = user;

  GFollowNotificationFieldsDataBuilder() {
    GFollowNotificationFieldsData._initializeBuilder(this);
  }

  GFollowNotificationFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowNotificationFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFollowNotificationFieldsData;
  }

  @override
  void update(void Function(GFollowNotificationFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFollowNotificationFieldsData build() => _build();

  _$GFollowNotificationFieldsData _build() {
    _$GFollowNotificationFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GFollowNotificationFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFollowNotificationFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFollowNotificationFieldsData', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GFollowNotificationFieldsData', 'createdAt'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFollowNotificationFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowNotificationFieldsData_user
    extends GFollowNotificationFieldsData_user {
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

  factory _$GFollowNotificationFieldsData_user(
          [void Function(GFollowNotificationFieldsData_userBuilder)?
              updates]) =>
      (new GFollowNotificationFieldsData_userBuilder()..update(updates))
          ._build();

  _$GFollowNotificationFieldsData_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFollowNotificationFieldsData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFollowNotificationFieldsData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFollowNotificationFieldsData_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFollowNotificationFieldsData_user', 'name');
  }

  @override
  GFollowNotificationFieldsData_user rebuild(
          void Function(GFollowNotificationFieldsData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowNotificationFieldsData_userBuilder toBuilder() =>
      new GFollowNotificationFieldsData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowNotificationFieldsData_user &&
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
    return (newBuiltValueToStringHelper(r'GFollowNotificationFieldsData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconUrl', iconUrl))
        .toString();
  }
}

class GFollowNotificationFieldsData_userBuilder
    implements
        Builder<GFollowNotificationFieldsData_user,
            GFollowNotificationFieldsData_userBuilder> {
  _$GFollowNotificationFieldsData_user? _$v;

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

  GFollowNotificationFieldsData_userBuilder() {
    GFollowNotificationFieldsData_user._initializeBuilder(this);
  }

  GFollowNotificationFieldsData_userBuilder get _$this {
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
  void replace(GFollowNotificationFieldsData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFollowNotificationFieldsData_user;
  }

  @override
  void update(
      void Function(GFollowNotificationFieldsData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFollowNotificationFieldsData_user build() => _build();

  _$GFollowNotificationFieldsData_user _build() {
    final _$result = _$v ??
        new _$GFollowNotificationFieldsData_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFollowNotificationFieldsData_user', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFollowNotificationFieldsData_user', 'id'),
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GFollowNotificationFieldsData_user', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GFollowNotificationFieldsData_user', 'name'),
            iconUrl: iconUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
