// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateUserStickerData> _$gCreateUserStickerDataSerializer =
    new _$GCreateUserStickerDataSerializer();
Serializer<GCreateUserStickerData_createUserSticker>
    _$gCreateUserStickerDataCreateUserStickerSerializer =
    new _$GCreateUserStickerData_createUserStickerSerializer();

class _$GCreateUserStickerDataSerializer
    implements StructuredSerializer<GCreateUserStickerData> {
  @override
  final Iterable<Type> types = const [
    GCreateUserStickerData,
    _$GCreateUserStickerData
  ];
  @override
  final String wireName = 'GCreateUserStickerData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateUserStickerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createUserSticker',
      serializers.serialize(object.createUserSticker,
          specifiedType:
              const FullType(GCreateUserStickerData_createUserSticker)),
    ];

    return result;
  }

  @override
  GCreateUserStickerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserStickerDataBuilder();

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
        case 'createUserSticker':
          result.createUserSticker.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateUserStickerData_createUserSticker))!
              as GCreateUserStickerData_createUserSticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateUserStickerData_createUserStickerSerializer
    implements StructuredSerializer<GCreateUserStickerData_createUserSticker> {
  @override
  final Iterable<Type> types = const [
    GCreateUserStickerData_createUserSticker,
    _$GCreateUserStickerData_createUserSticker
  ];
  @override
  final String wireName = 'GCreateUserStickerData_createUserSticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateUserStickerData_createUserSticker object,
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
  GCreateUserStickerData_createUserSticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserStickerData_createUserStickerBuilder();

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

class _$GCreateUserStickerData extends GCreateUserStickerData {
  @override
  final String G__typename;
  @override
  final GCreateUserStickerData_createUserSticker createUserSticker;

  factory _$GCreateUserStickerData(
          [void Function(GCreateUserStickerDataBuilder)? updates]) =>
      (new GCreateUserStickerDataBuilder()..update(updates))._build();

  _$GCreateUserStickerData._(
      {required this.G__typename, required this.createUserSticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateUserStickerData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createUserSticker, r'GCreateUserStickerData', 'createUserSticker');
  }

  @override
  GCreateUserStickerData rebuild(
          void Function(GCreateUserStickerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserStickerDataBuilder toBuilder() =>
      new GCreateUserStickerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserStickerData &&
        G__typename == other.G__typename &&
        createUserSticker == other.createUserSticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createUserSticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateUserStickerData')
          ..add('G__typename', G__typename)
          ..add('createUserSticker', createUserSticker))
        .toString();
  }
}

class GCreateUserStickerDataBuilder
    implements Builder<GCreateUserStickerData, GCreateUserStickerDataBuilder> {
  _$GCreateUserStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateUserStickerData_createUserStickerBuilder? _createUserSticker;
  GCreateUserStickerData_createUserStickerBuilder get createUserSticker =>
      _$this._createUserSticker ??=
          new GCreateUserStickerData_createUserStickerBuilder();
  set createUserSticker(
          GCreateUserStickerData_createUserStickerBuilder? createUserSticker) =>
      _$this._createUserSticker = createUserSticker;

  GCreateUserStickerDataBuilder() {
    GCreateUserStickerData._initializeBuilder(this);
  }

  GCreateUserStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createUserSticker = $v.createUserSticker.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserStickerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserStickerData;
  }

  @override
  void update(void Function(GCreateUserStickerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserStickerData build() => _build();

  _$GCreateUserStickerData _build() {
    _$GCreateUserStickerData _$result;
    try {
      _$result = _$v ??
          new _$GCreateUserStickerData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateUserStickerData', 'G__typename'),
              createUserSticker: createUserSticker.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createUserSticker';
        createUserSticker.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateUserStickerData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateUserStickerData_createUserSticker
    extends GCreateUserStickerData_createUserSticker {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateUserStickerData_createUserSticker(
          [void Function(GCreateUserStickerData_createUserStickerBuilder)?
              updates]) =>
      (new GCreateUserStickerData_createUserStickerBuilder()..update(updates))
          ._build();

  _$GCreateUserStickerData_createUserSticker._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GCreateUserStickerData_createUserSticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateUserStickerData_createUserSticker', 'id');
  }

  @override
  GCreateUserStickerData_createUserSticker rebuild(
          void Function(GCreateUserStickerData_createUserStickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserStickerData_createUserStickerBuilder toBuilder() =>
      new GCreateUserStickerData_createUserStickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserStickerData_createUserSticker &&
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
            r'GCreateUserStickerData_createUserSticker')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateUserStickerData_createUserStickerBuilder
    implements
        Builder<GCreateUserStickerData_createUserSticker,
            GCreateUserStickerData_createUserStickerBuilder> {
  _$GCreateUserStickerData_createUserSticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateUserStickerData_createUserStickerBuilder() {
    GCreateUserStickerData_createUserSticker._initializeBuilder(this);
  }

  GCreateUserStickerData_createUserStickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserStickerData_createUserSticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserStickerData_createUserSticker;
  }

  @override
  void update(
      void Function(GCreateUserStickerData_createUserStickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserStickerData_createUserSticker build() => _build();

  _$GCreateUserStickerData_createUserSticker _build() {
    final _$result = _$v ??
        new _$GCreateUserStickerData_createUserSticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateUserStickerData_createUserSticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateUserStickerData_createUserSticker', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
