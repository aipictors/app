// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_fcm_token.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateAccountFcmTokenData> _$gUpdateAccountFcmTokenDataSerializer =
    new _$GUpdateAccountFcmTokenDataSerializer();
Serializer<GUpdateAccountFcmTokenData_updateAccountFcmToken>
    _$gUpdateAccountFcmTokenDataUpdateAccountFcmTokenSerializer =
    new _$GUpdateAccountFcmTokenData_updateAccountFcmTokenSerializer();

class _$GUpdateAccountFcmTokenDataSerializer
    implements StructuredSerializer<GUpdateAccountFcmTokenData> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountFcmTokenData,
    _$GUpdateAccountFcmTokenData
  ];
  @override
  final String wireName = 'GUpdateAccountFcmTokenData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateAccountFcmTokenData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateAccountFcmToken',
      serializers.serialize(object.updateAccountFcmToken,
          specifiedType:
              const FullType(GUpdateAccountFcmTokenData_updateAccountFcmToken)),
    ];

    return result;
  }

  @override
  GUpdateAccountFcmTokenData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateAccountFcmTokenDataBuilder();

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
        case 'updateAccountFcmToken':
          result.updateAccountFcmToken.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GUpdateAccountFcmTokenData_updateAccountFcmToken))!
              as GUpdateAccountFcmTokenData_updateAccountFcmToken);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateAccountFcmTokenData_updateAccountFcmTokenSerializer
    implements
        StructuredSerializer<GUpdateAccountFcmTokenData_updateAccountFcmToken> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountFcmTokenData_updateAccountFcmToken,
    _$GUpdateAccountFcmTokenData_updateAccountFcmToken
  ];
  @override
  final String wireName = 'GUpdateAccountFcmTokenData_updateAccountFcmToken';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUpdateAccountFcmTokenData_updateAccountFcmToken object,
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
  GUpdateAccountFcmTokenData_updateAccountFcmToken deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder();

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

class _$GUpdateAccountFcmTokenData extends GUpdateAccountFcmTokenData {
  @override
  final String G__typename;
  @override
  final GUpdateAccountFcmTokenData_updateAccountFcmToken updateAccountFcmToken;

  factory _$GUpdateAccountFcmTokenData(
          [void Function(GUpdateAccountFcmTokenDataBuilder)? updates]) =>
      (new GUpdateAccountFcmTokenDataBuilder()..update(updates))._build();

  _$GUpdateAccountFcmTokenData._(
      {required this.G__typename, required this.updateAccountFcmToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateAccountFcmTokenData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(updateAccountFcmToken,
        r'GUpdateAccountFcmTokenData', 'updateAccountFcmToken');
  }

  @override
  GUpdateAccountFcmTokenData rebuild(
          void Function(GUpdateAccountFcmTokenDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountFcmTokenDataBuilder toBuilder() =>
      new GUpdateAccountFcmTokenDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountFcmTokenData &&
        G__typename == other.G__typename &&
        updateAccountFcmToken == other.updateAccountFcmToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateAccountFcmToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateAccountFcmTokenData')
          ..add('G__typename', G__typename)
          ..add('updateAccountFcmToken', updateAccountFcmToken))
        .toString();
  }
}

class GUpdateAccountFcmTokenDataBuilder
    implements
        Builder<GUpdateAccountFcmTokenData, GUpdateAccountFcmTokenDataBuilder> {
  _$GUpdateAccountFcmTokenData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder?
      _updateAccountFcmToken;
  GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder
      get updateAccountFcmToken => _$this._updateAccountFcmToken ??=
          new GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder();
  set updateAccountFcmToken(
          GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder?
              updateAccountFcmToken) =>
      _$this._updateAccountFcmToken = updateAccountFcmToken;

  GUpdateAccountFcmTokenDataBuilder() {
    GUpdateAccountFcmTokenData._initializeBuilder(this);
  }

  GUpdateAccountFcmTokenDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateAccountFcmToken = $v.updateAccountFcmToken.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountFcmTokenData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountFcmTokenData;
  }

  @override
  void update(void Function(GUpdateAccountFcmTokenDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountFcmTokenData build() => _build();

  _$GUpdateAccountFcmTokenData _build() {
    _$GUpdateAccountFcmTokenData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateAccountFcmTokenData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdateAccountFcmTokenData', 'G__typename'),
              updateAccountFcmToken: updateAccountFcmToken.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateAccountFcmToken';
        updateAccountFcmToken.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateAccountFcmTokenData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateAccountFcmTokenData_updateAccountFcmToken
    extends GUpdateAccountFcmTokenData_updateAccountFcmToken {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GUpdateAccountFcmTokenData_updateAccountFcmToken(
          [void Function(
                  GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder)?
              updates]) =>
      (new GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder()
            ..update(updates))
          ._build();

  _$GUpdateAccountFcmTokenData_updateAccountFcmToken._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUpdateAccountFcmTokenData_updateAccountFcmToken', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateAccountFcmTokenData_updateAccountFcmToken', 'id');
  }

  @override
  GUpdateAccountFcmTokenData_updateAccountFcmToken rebuild(
          void Function(GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder toBuilder() =>
      new GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountFcmTokenData_updateAccountFcmToken &&
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
    return (newBuiltValueToStringHelper(
            r'GUpdateAccountFcmTokenData_updateAccountFcmToken')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder
    implements
        Builder<GUpdateAccountFcmTokenData_updateAccountFcmToken,
            GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder> {
  _$GUpdateAccountFcmTokenData_updateAccountFcmToken? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder() {
    GUpdateAccountFcmTokenData_updateAccountFcmToken._initializeBuilder(this);
  }

  GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountFcmTokenData_updateAccountFcmToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountFcmTokenData_updateAccountFcmToken;
  }

  @override
  void update(
      void Function(GUpdateAccountFcmTokenData_updateAccountFcmTokenBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountFcmTokenData_updateAccountFcmToken build() => _build();

  _$GUpdateAccountFcmTokenData_updateAccountFcmToken _build() {
    final _$result = _$v ??
        new _$GUpdateAccountFcmTokenData_updateAccountFcmToken._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GUpdateAccountFcmTokenData_updateAccountFcmToken',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateAccountFcmTokenData_updateAccountFcmToken', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
