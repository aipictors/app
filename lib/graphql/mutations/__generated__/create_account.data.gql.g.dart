// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAccountData> _$gCreateAccountDataSerializer =
    new _$GCreateAccountDataSerializer();
Serializer<GCreateAccountData_createAccount>
    _$gCreateAccountDataCreateAccountSerializer =
    new _$GCreateAccountData_createAccountSerializer();

class _$GCreateAccountDataSerializer
    implements StructuredSerializer<GCreateAccountData> {
  @override
  final Iterable<Type> types = const [GCreateAccountData, _$GCreateAccountData];
  @override
  final String wireName = 'GCreateAccountData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAccountData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createAccount',
      serializers.serialize(object.createAccount,
          specifiedType: const FullType(GCreateAccountData_createAccount)),
    ];

    return result;
  }

  @override
  GCreateAccountData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAccountDataBuilder();

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
        case 'createAccount':
          result.createAccount.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateAccountData_createAccount))!
              as GCreateAccountData_createAccount);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAccountData_createAccountSerializer
    implements StructuredSerializer<GCreateAccountData_createAccount> {
  @override
  final Iterable<Type> types = const [
    GCreateAccountData_createAccount,
    _$GCreateAccountData_createAccount
  ];
  @override
  final String wireName = 'GCreateAccountData_createAccount';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAccountData_createAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateAccountData_createAccount deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAccountData_createAccountBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GCreateAccountData extends GCreateAccountData {
  @override
  final String G__typename;
  @override
  final GCreateAccountData_createAccount createAccount;

  factory _$GCreateAccountData(
          [void Function(GCreateAccountDataBuilder)? updates]) =>
      (new GCreateAccountDataBuilder()..update(updates))._build();

  _$GCreateAccountData._(
      {required this.G__typename, required this.createAccount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateAccountData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createAccount, r'GCreateAccountData', 'createAccount');
  }

  @override
  GCreateAccountData rebuild(
          void Function(GCreateAccountDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAccountDataBuilder toBuilder() =>
      new GCreateAccountDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAccountData &&
        G__typename == other.G__typename &&
        createAccount == other.createAccount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createAccount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateAccountData')
          ..add('G__typename', G__typename)
          ..add('createAccount', createAccount))
        .toString();
  }
}

class GCreateAccountDataBuilder
    implements Builder<GCreateAccountData, GCreateAccountDataBuilder> {
  _$GCreateAccountData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateAccountData_createAccountBuilder? _createAccount;
  GCreateAccountData_createAccountBuilder get createAccount =>
      _$this._createAccount ??= new GCreateAccountData_createAccountBuilder();
  set createAccount(GCreateAccountData_createAccountBuilder? createAccount) =>
      _$this._createAccount = createAccount;

  GCreateAccountDataBuilder() {
    GCreateAccountData._initializeBuilder(this);
  }

  GCreateAccountDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createAccount = $v.createAccount.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAccountData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAccountData;
  }

  @override
  void update(void Function(GCreateAccountDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAccountData build() => _build();

  _$GCreateAccountData _build() {
    _$GCreateAccountData _$result;
    try {
      _$result = _$v ??
          new _$GCreateAccountData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateAccountData', 'G__typename'),
              createAccount: createAccount.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createAccount';
        createAccount.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateAccountData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateAccountData_createAccount
    extends GCreateAccountData_createAccount {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateAccountData_createAccount(
          [void Function(GCreateAccountData_createAccountBuilder)? updates]) =>
      (new GCreateAccountData_createAccountBuilder()..update(updates))._build();

  _$GCreateAccountData_createAccount._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateAccountData_createAccount', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateAccountData_createAccount', 'id');
  }

  @override
  GCreateAccountData_createAccount rebuild(
          void Function(GCreateAccountData_createAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAccountData_createAccountBuilder toBuilder() =>
      new GCreateAccountData_createAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAccountData_createAccount &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateAccountData_createAccount')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateAccountData_createAccountBuilder
    implements
        Builder<GCreateAccountData_createAccount,
            GCreateAccountData_createAccountBuilder> {
  _$GCreateAccountData_createAccount? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateAccountData_createAccountBuilder() {
    GCreateAccountData_createAccount._initializeBuilder(this);
  }

  GCreateAccountData_createAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAccountData_createAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAccountData_createAccount;
  }

  @override
  void update(void Function(GCreateAccountData_createAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAccountData_createAccount build() => _build();

  _$GCreateAccountData_createAccount _build() {
    final _$result = _$v ??
        new _$GCreateAccountData_createAccount._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateAccountData_createAccount', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateAccountData_createAccount', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
