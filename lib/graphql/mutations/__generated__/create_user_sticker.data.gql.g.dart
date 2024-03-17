// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateUserStickerData> _$gCreateUserStickerDataSerializer =
    new _$GCreateUserStickerDataSerializer();
Serializer<GCreateUserStickerData_createSticker>
    _$gCreateUserStickerDataCreateStickerSerializer =
    new _$GCreateUserStickerData_createStickerSerializer();

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
      'createSticker',
      serializers.serialize(object.createSticker,
          specifiedType: const FullType(GCreateUserStickerData_createSticker)),
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
        case 'createSticker':
          result.createSticker.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateUserStickerData_createSticker))!
              as GCreateUserStickerData_createSticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateUserStickerData_createStickerSerializer
    implements StructuredSerializer<GCreateUserStickerData_createSticker> {
  @override
  final Iterable<Type> types = const [
    GCreateUserStickerData_createSticker,
    _$GCreateUserStickerData_createSticker
  ];
  @override
  final String wireName = 'GCreateUserStickerData_createSticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateUserStickerData_createSticker object,
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
  GCreateUserStickerData_createSticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserStickerData_createStickerBuilder();

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
  final GCreateUserStickerData_createSticker createSticker;

  factory _$GCreateUserStickerData(
          [void Function(GCreateUserStickerDataBuilder)? updates]) =>
      (new GCreateUserStickerDataBuilder()..update(updates))._build();

  _$GCreateUserStickerData._(
      {required this.G__typename, required this.createSticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateUserStickerData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createSticker, r'GCreateUserStickerData', 'createSticker');
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
        createSticker == other.createSticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createSticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateUserStickerData')
          ..add('G__typename', G__typename)
          ..add('createSticker', createSticker))
        .toString();
  }
}

class GCreateUserStickerDataBuilder
    implements Builder<GCreateUserStickerData, GCreateUserStickerDataBuilder> {
  _$GCreateUserStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateUserStickerData_createStickerBuilder? _createSticker;
  GCreateUserStickerData_createStickerBuilder get createSticker =>
      _$this._createSticker ??=
          new GCreateUserStickerData_createStickerBuilder();
  set createSticker(
          GCreateUserStickerData_createStickerBuilder? createSticker) =>
      _$this._createSticker = createSticker;

  GCreateUserStickerDataBuilder() {
    GCreateUserStickerData._initializeBuilder(this);
  }

  GCreateUserStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createSticker = $v.createSticker.toBuilder();
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
              createSticker: createSticker.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createSticker';
        createSticker.build();
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

class _$GCreateUserStickerData_createSticker
    extends GCreateUserStickerData_createSticker {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateUserStickerData_createSticker(
          [void Function(GCreateUserStickerData_createStickerBuilder)?
              updates]) =>
      (new GCreateUserStickerData_createStickerBuilder()..update(updates))
          ._build();

  _$GCreateUserStickerData_createSticker._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateUserStickerData_createSticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateUserStickerData_createSticker', 'id');
  }

  @override
  GCreateUserStickerData_createSticker rebuild(
          void Function(GCreateUserStickerData_createStickerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserStickerData_createStickerBuilder toBuilder() =>
      new GCreateUserStickerData_createStickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserStickerData_createSticker &&
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
    return (newBuiltValueToStringHelper(r'GCreateUserStickerData_createSticker')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateUserStickerData_createStickerBuilder
    implements
        Builder<GCreateUserStickerData_createSticker,
            GCreateUserStickerData_createStickerBuilder> {
  _$GCreateUserStickerData_createSticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateUserStickerData_createStickerBuilder() {
    GCreateUserStickerData_createSticker._initializeBuilder(this);
  }

  GCreateUserStickerData_createStickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserStickerData_createSticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserStickerData_createSticker;
  }

  @override
  void update(
      void Function(GCreateUserStickerData_createStickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserStickerData_createSticker build() => _build();

  _$GCreateUserStickerData_createSticker _build() {
    final _$result = _$v ??
        new _$GCreateUserStickerData_createSticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateUserStickerData_createSticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateUserStickerData_createSticker', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
