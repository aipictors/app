// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_password.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateAccountPasswordData> _$gUpdateAccountPasswordDataSerializer =
    new _$GUpdateAccountPasswordDataSerializer();
Serializer<GUpdateAccountPasswordData_updateAccountPassword>
    _$gUpdateAccountPasswordDataUpdateAccountPasswordSerializer =
    new _$GUpdateAccountPasswordData_updateAccountPasswordSerializer();

class _$GUpdateAccountPasswordDataSerializer
    implements StructuredSerializer<GUpdateAccountPasswordData> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountPasswordData,
    _$GUpdateAccountPasswordData
  ];
  @override
  final String wireName = 'GUpdateAccountPasswordData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateAccountPasswordData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateAccountPassword',
      serializers.serialize(object.updateAccountPassword,
          specifiedType:
              const FullType(GUpdateAccountPasswordData_updateAccountPassword)),
    ];

    return result;
  }

  @override
  GUpdateAccountPasswordData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateAccountPasswordDataBuilder();

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
        case 'updateAccountPassword':
          result.updateAccountPassword.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GUpdateAccountPasswordData_updateAccountPassword))!
              as GUpdateAccountPasswordData_updateAccountPassword);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateAccountPasswordData_updateAccountPasswordSerializer
    implements
        StructuredSerializer<GUpdateAccountPasswordData_updateAccountPassword> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountPasswordData_updateAccountPassword,
    _$GUpdateAccountPasswordData_updateAccountPassword
  ];
  @override
  final String wireName = 'GUpdateAccountPasswordData_updateAccountPassword';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUpdateAccountPasswordData_updateAccountPassword object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUpdateAccountPasswordData_updateAccountPassword deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUpdateAccountPasswordData_updateAccountPasswordBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateAccountPasswordData extends GUpdateAccountPasswordData {
  @override
  final String G__typename;
  @override
  final GUpdateAccountPasswordData_updateAccountPassword updateAccountPassword;

  factory _$GUpdateAccountPasswordData(
          [void Function(GUpdateAccountPasswordDataBuilder)? updates]) =>
      (new GUpdateAccountPasswordDataBuilder()..update(updates))._build();

  _$GUpdateAccountPasswordData._(
      {required this.G__typename, required this.updateAccountPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateAccountPasswordData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(updateAccountPassword,
        r'GUpdateAccountPasswordData', 'updateAccountPassword');
  }

  @override
  GUpdateAccountPasswordData rebuild(
          void Function(GUpdateAccountPasswordDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountPasswordDataBuilder toBuilder() =>
      new GUpdateAccountPasswordDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountPasswordData &&
        G__typename == other.G__typename &&
        updateAccountPassword == other.updateAccountPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateAccountPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateAccountPasswordData')
          ..add('G__typename', G__typename)
          ..add('updateAccountPassword', updateAccountPassword))
        .toString();
  }
}

class GUpdateAccountPasswordDataBuilder
    implements
        Builder<GUpdateAccountPasswordData, GUpdateAccountPasswordDataBuilder> {
  _$GUpdateAccountPasswordData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateAccountPasswordData_updateAccountPasswordBuilder?
      _updateAccountPassword;
  GUpdateAccountPasswordData_updateAccountPasswordBuilder
      get updateAccountPassword => _$this._updateAccountPassword ??=
          new GUpdateAccountPasswordData_updateAccountPasswordBuilder();
  set updateAccountPassword(
          GUpdateAccountPasswordData_updateAccountPasswordBuilder?
              updateAccountPassword) =>
      _$this._updateAccountPassword = updateAccountPassword;

  GUpdateAccountPasswordDataBuilder() {
    GUpdateAccountPasswordData._initializeBuilder(this);
  }

  GUpdateAccountPasswordDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateAccountPassword = $v.updateAccountPassword.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountPasswordData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountPasswordData;
  }

  @override
  void update(void Function(GUpdateAccountPasswordDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountPasswordData build() => _build();

  _$GUpdateAccountPasswordData _build() {
    _$GUpdateAccountPasswordData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateAccountPasswordData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdateAccountPasswordData', 'G__typename'),
              updateAccountPassword: updateAccountPassword.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateAccountPassword';
        updateAccountPassword.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateAccountPasswordData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateAccountPasswordData_updateAccountPassword
    extends GUpdateAccountPasswordData_updateAccountPassword {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GUpdateAccountPasswordData_updateAccountPassword(
          [void Function(
                  GUpdateAccountPasswordData_updateAccountPasswordBuilder)?
              updates]) =>
      (new GUpdateAccountPasswordData_updateAccountPasswordBuilder()
            ..update(updates))
          ._build();

  _$GUpdateAccountPasswordData_updateAccountPassword._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUpdateAccountPasswordData_updateAccountPassword', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateAccountPasswordData_updateAccountPassword', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GUpdateAccountPasswordData_updateAccountPassword', 'name');
  }

  @override
  GUpdateAccountPasswordData_updateAccountPassword rebuild(
          void Function(GUpdateAccountPasswordData_updateAccountPasswordBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountPasswordData_updateAccountPasswordBuilder toBuilder() =>
      new GUpdateAccountPasswordData_updateAccountPasswordBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountPasswordData_updateAccountPassword &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUpdateAccountPasswordData_updateAccountPassword')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GUpdateAccountPasswordData_updateAccountPasswordBuilder
    implements
        Builder<GUpdateAccountPasswordData_updateAccountPassword,
            GUpdateAccountPasswordData_updateAccountPasswordBuilder> {
  _$GUpdateAccountPasswordData_updateAccountPassword? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GUpdateAccountPasswordData_updateAccountPasswordBuilder() {
    GUpdateAccountPasswordData_updateAccountPassword._initializeBuilder(this);
  }

  GUpdateAccountPasswordData_updateAccountPasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountPasswordData_updateAccountPassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountPasswordData_updateAccountPassword;
  }

  @override
  void update(
      void Function(GUpdateAccountPasswordData_updateAccountPasswordBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountPasswordData_updateAccountPassword build() => _build();

  _$GUpdateAccountPasswordData_updateAccountPassword _build() {
    final _$result = _$v ??
        new _$GUpdateAccountPasswordData_updateAccountPassword._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GUpdateAccountPasswordData_updateAccountPassword',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateAccountPasswordData_updateAccountPassword', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GUpdateAccountPasswordData_updateAccountPassword', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
