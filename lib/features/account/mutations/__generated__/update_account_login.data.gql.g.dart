// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_login.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateAccountLoginData> _$gUpdateAccountLoginDataSerializer =
    new _$GUpdateAccountLoginDataSerializer();
Serializer<GUpdateAccountLoginData_updateAccountLogin>
    _$gUpdateAccountLoginDataUpdateAccountLoginSerializer =
    new _$GUpdateAccountLoginData_updateAccountLoginSerializer();

class _$GUpdateAccountLoginDataSerializer
    implements StructuredSerializer<GUpdateAccountLoginData> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountLoginData,
    _$GUpdateAccountLoginData
  ];
  @override
  final String wireName = 'GUpdateAccountLoginData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateAccountLoginData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateAccountLogin',
      serializers.serialize(object.updateAccountLogin,
          specifiedType:
              const FullType(GUpdateAccountLoginData_updateAccountLogin)),
    ];

    return result;
  }

  @override
  GUpdateAccountLoginData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateAccountLoginDataBuilder();

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
        case 'updateAccountLogin':
          result.updateAccountLogin.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GUpdateAccountLoginData_updateAccountLogin))!
              as GUpdateAccountLoginData_updateAccountLogin);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateAccountLoginData_updateAccountLoginSerializer
    implements
        StructuredSerializer<GUpdateAccountLoginData_updateAccountLogin> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountLoginData_updateAccountLogin,
    _$GUpdateAccountLoginData_updateAccountLogin
  ];
  @override
  final String wireName = 'GUpdateAccountLoginData_updateAccountLogin';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUpdateAccountLoginData_updateAccountLogin object,
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
    ];

    return result;
  }

  @override
  GUpdateAccountLoginData_updateAccountLogin deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateAccountLoginData_updateAccountLoginBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GUpdateAccountLoginData extends GUpdateAccountLoginData {
  @override
  final String G__typename;
  @override
  final GUpdateAccountLoginData_updateAccountLogin updateAccountLogin;

  factory _$GUpdateAccountLoginData(
          [void Function(GUpdateAccountLoginDataBuilder)? updates]) =>
      (new GUpdateAccountLoginDataBuilder()..update(updates))._build();

  _$GUpdateAccountLoginData._(
      {required this.G__typename, required this.updateAccountLogin})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateAccountLoginData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        updateAccountLogin, r'GUpdateAccountLoginData', 'updateAccountLogin');
  }

  @override
  GUpdateAccountLoginData rebuild(
          void Function(GUpdateAccountLoginDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountLoginDataBuilder toBuilder() =>
      new GUpdateAccountLoginDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountLoginData &&
        G__typename == other.G__typename &&
        updateAccountLogin == other.updateAccountLogin;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateAccountLogin.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateAccountLoginData')
          ..add('G__typename', G__typename)
          ..add('updateAccountLogin', updateAccountLogin))
        .toString();
  }
}

class GUpdateAccountLoginDataBuilder
    implements
        Builder<GUpdateAccountLoginData, GUpdateAccountLoginDataBuilder> {
  _$GUpdateAccountLoginData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateAccountLoginData_updateAccountLoginBuilder? _updateAccountLogin;
  GUpdateAccountLoginData_updateAccountLoginBuilder get updateAccountLogin =>
      _$this._updateAccountLogin ??=
          new GUpdateAccountLoginData_updateAccountLoginBuilder();
  set updateAccountLogin(
          GUpdateAccountLoginData_updateAccountLoginBuilder?
              updateAccountLogin) =>
      _$this._updateAccountLogin = updateAccountLogin;

  GUpdateAccountLoginDataBuilder() {
    GUpdateAccountLoginData._initializeBuilder(this);
  }

  GUpdateAccountLoginDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateAccountLogin = $v.updateAccountLogin.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountLoginData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountLoginData;
  }

  @override
  void update(void Function(GUpdateAccountLoginDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountLoginData build() => _build();

  _$GUpdateAccountLoginData _build() {
    _$GUpdateAccountLoginData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateAccountLoginData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdateAccountLoginData', 'G__typename'),
              updateAccountLogin: updateAccountLogin.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateAccountLogin';
        updateAccountLogin.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateAccountLoginData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateAccountLoginData_updateAccountLogin
    extends GUpdateAccountLoginData_updateAccountLogin {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;

  factory _$GUpdateAccountLoginData_updateAccountLogin(
          [void Function(GUpdateAccountLoginData_updateAccountLoginBuilder)?
              updates]) =>
      (new GUpdateAccountLoginData_updateAccountLoginBuilder()..update(updates))
          ._build();

  _$GUpdateAccountLoginData_updateAccountLogin._(
      {required this.G__typename, required this.id, required this.login})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUpdateAccountLoginData_updateAccountLogin', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateAccountLoginData_updateAccountLogin', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GUpdateAccountLoginData_updateAccountLogin', 'login');
  }

  @override
  GUpdateAccountLoginData_updateAccountLogin rebuild(
          void Function(GUpdateAccountLoginData_updateAccountLoginBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountLoginData_updateAccountLoginBuilder toBuilder() =>
      new GUpdateAccountLoginData_updateAccountLoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountLoginData_updateAccountLogin &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUpdateAccountLoginData_updateAccountLogin')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login))
        .toString();
  }
}

class GUpdateAccountLoginData_updateAccountLoginBuilder
    implements
        Builder<GUpdateAccountLoginData_updateAccountLogin,
            GUpdateAccountLoginData_updateAccountLoginBuilder> {
  _$GUpdateAccountLoginData_updateAccountLogin? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  GUpdateAccountLoginData_updateAccountLoginBuilder() {
    GUpdateAccountLoginData_updateAccountLogin._initializeBuilder(this);
  }

  GUpdateAccountLoginData_updateAccountLoginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountLoginData_updateAccountLogin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountLoginData_updateAccountLogin;
  }

  @override
  void update(
      void Function(GUpdateAccountLoginData_updateAccountLoginBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountLoginData_updateAccountLogin build() => _build();

  _$GUpdateAccountLoginData_updateAccountLogin _build() {
    final _$result = _$v ??
        new _$GUpdateAccountLoginData_updateAccountLogin._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUpdateAccountLoginData_updateAccountLogin', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateAccountLoginData_updateAccountLogin', 'id'),
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GUpdateAccountLoginData_updateAccountLogin', 'login'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
