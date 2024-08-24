// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_password.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLoginWithPasswordData> _$gLoginWithPasswordDataSerializer =
    new _$GLoginWithPasswordDataSerializer();
Serializer<GLoginWithPasswordData_loginWithPassword>
    _$gLoginWithPasswordDataLoginWithPasswordSerializer =
    new _$GLoginWithPasswordData_loginWithPasswordSerializer();

class _$GLoginWithPasswordDataSerializer
    implements StructuredSerializer<GLoginWithPasswordData> {
  @override
  final Iterable<Type> types = const [
    GLoginWithPasswordData,
    _$GLoginWithPasswordData
  ];
  @override
  final String wireName = 'GLoginWithPasswordData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginWithPasswordData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'loginWithPassword',
      serializers.serialize(object.loginWithPassword,
          specifiedType:
              const FullType(GLoginWithPasswordData_loginWithPassword)),
    ];

    return result;
  }

  @override
  GLoginWithPasswordData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginWithPasswordDataBuilder();

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
        case 'loginWithPassword':
          result.loginWithPassword.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GLoginWithPasswordData_loginWithPassword))!
              as GLoginWithPasswordData_loginWithPassword);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginWithPasswordData_loginWithPasswordSerializer
    implements StructuredSerializer<GLoginWithPasswordData_loginWithPassword> {
  @override
  final Iterable<Type> types = const [
    GLoginWithPasswordData_loginWithPassword,
    _$GLoginWithPasswordData_loginWithPassword
  ];
  @override
  final String wireName = 'GLoginWithPasswordData_loginWithPassword';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginWithPasswordData_loginWithPassword object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GLoginWithPasswordData_loginWithPassword deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginWithPasswordData_loginWithPasswordBuilder();

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
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginWithPasswordData extends GLoginWithPasswordData {
  @override
  final String G__typename;
  @override
  final GLoginWithPasswordData_loginWithPassword loginWithPassword;

  factory _$GLoginWithPasswordData(
          [void Function(GLoginWithPasswordDataBuilder)? updates]) =>
      (new GLoginWithPasswordDataBuilder()..update(updates))._build();

  _$GLoginWithPasswordData._(
      {required this.G__typename, required this.loginWithPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GLoginWithPasswordData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        loginWithPassword, r'GLoginWithPasswordData', 'loginWithPassword');
  }

  @override
  GLoginWithPasswordData rebuild(
          void Function(GLoginWithPasswordDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginWithPasswordDataBuilder toBuilder() =>
      new GLoginWithPasswordDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginWithPasswordData &&
        G__typename == other.G__typename &&
        loginWithPassword == other.loginWithPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, loginWithPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GLoginWithPasswordData')
          ..add('G__typename', G__typename)
          ..add('loginWithPassword', loginWithPassword))
        .toString();
  }
}

class GLoginWithPasswordDataBuilder
    implements Builder<GLoginWithPasswordData, GLoginWithPasswordDataBuilder> {
  _$GLoginWithPasswordData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GLoginWithPasswordData_loginWithPasswordBuilder? _loginWithPassword;
  GLoginWithPasswordData_loginWithPasswordBuilder get loginWithPassword =>
      _$this._loginWithPassword ??=
          new GLoginWithPasswordData_loginWithPasswordBuilder();
  set loginWithPassword(
          GLoginWithPasswordData_loginWithPasswordBuilder? loginWithPassword) =>
      _$this._loginWithPassword = loginWithPassword;

  GLoginWithPasswordDataBuilder() {
    GLoginWithPasswordData._initializeBuilder(this);
  }

  GLoginWithPasswordDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _loginWithPassword = $v.loginWithPassword.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginWithPasswordData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginWithPasswordData;
  }

  @override
  void update(void Function(GLoginWithPasswordDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLoginWithPasswordData build() => _build();

  _$GLoginWithPasswordData _build() {
    _$GLoginWithPasswordData _$result;
    try {
      _$result = _$v ??
          new _$GLoginWithPasswordData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GLoginWithPasswordData', 'G__typename'),
              loginWithPassword: loginWithPassword.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'loginWithPassword';
        loginWithPassword.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GLoginWithPasswordData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLoginWithPasswordData_loginWithPassword
    extends GLoginWithPasswordData_loginWithPassword {
  @override
  final String G__typename;
  @override
  final String token;

  factory _$GLoginWithPasswordData_loginWithPassword(
          [void Function(GLoginWithPasswordData_loginWithPasswordBuilder)?
              updates]) =>
      (new GLoginWithPasswordData_loginWithPasswordBuilder()..update(updates))
          ._build();

  _$GLoginWithPasswordData_loginWithPassword._(
      {required this.G__typename, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GLoginWithPasswordData_loginWithPassword', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        token, r'GLoginWithPasswordData_loginWithPassword', 'token');
  }

  @override
  GLoginWithPasswordData_loginWithPassword rebuild(
          void Function(GLoginWithPasswordData_loginWithPasswordBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginWithPasswordData_loginWithPasswordBuilder toBuilder() =>
      new GLoginWithPasswordData_loginWithPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginWithPasswordData_loginWithPassword &&
        G__typename == other.G__typename &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GLoginWithPasswordData_loginWithPassword')
          ..add('G__typename', G__typename)
          ..add('token', token))
        .toString();
  }
}

class GLoginWithPasswordData_loginWithPasswordBuilder
    implements
        Builder<GLoginWithPasswordData_loginWithPassword,
            GLoginWithPasswordData_loginWithPasswordBuilder> {
  _$GLoginWithPasswordData_loginWithPassword? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  GLoginWithPasswordData_loginWithPasswordBuilder() {
    GLoginWithPasswordData_loginWithPassword._initializeBuilder(this);
  }

  GLoginWithPasswordData_loginWithPasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginWithPasswordData_loginWithPassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginWithPasswordData_loginWithPassword;
  }

  @override
  void update(
      void Function(GLoginWithPasswordData_loginWithPasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLoginWithPasswordData_loginWithPassword build() => _build();

  _$GLoginWithPasswordData_loginWithPassword _build() {
    final _$result = _$v ??
        new _$GLoginWithPasswordData_loginWithPassword._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GLoginWithPasswordData_loginWithPassword', 'G__typename'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GLoginWithPasswordData_loginWithPassword', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
