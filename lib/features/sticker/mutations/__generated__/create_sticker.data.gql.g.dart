// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateStickerData> _$gCreateStickerDataSerializer =
    new _$GCreateStickerDataSerializer();
Serializer<GCreateStickerData_createSticker>
    _$gCreateStickerDataCreateStickerSerializer =
    new _$GCreateStickerData_createStickerSerializer();

class _$GCreateStickerDataSerializer
    implements StructuredSerializer<GCreateStickerData> {
  @override
  final Iterable<Type> types = const [GCreateStickerData, _$GCreateStickerData];
  @override
  final String wireName = 'GCreateStickerData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateStickerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createSticker',
      serializers.serialize(object.createSticker,
          specifiedType: const FullType(GCreateStickerData_createSticker)),
    ];

    return result;
  }

  @override
  GCreateStickerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateStickerDataBuilder();

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
                      const FullType(GCreateStickerData_createSticker))!
              as GCreateStickerData_createSticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateStickerData_createStickerSerializer
    implements StructuredSerializer<GCreateStickerData_createSticker> {
  @override
  final Iterable<Type> types = const [
    GCreateStickerData_createSticker,
    _$GCreateStickerData_createSticker
  ];
  @override
  final String wireName = 'GCreateStickerData_createSticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateStickerData_createSticker object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateStickerData_createSticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateStickerData_createStickerBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateStickerData extends GCreateStickerData {
  @override
  final String G__typename;
  @override
  final GCreateStickerData_createSticker createSticker;

  factory _$GCreateStickerData(
          [void Function(GCreateStickerDataBuilder)? updates]) =>
      (new GCreateStickerDataBuilder()..update(updates))._build();

  _$GCreateStickerData._(
      {required this.G__typename, required this.createSticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateStickerData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createSticker, r'GCreateStickerData', 'createSticker');
  }

  @override
  GCreateStickerData rebuild(
          void Function(GCreateStickerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateStickerDataBuilder toBuilder() =>
      new GCreateStickerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateStickerData &&
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
    return (newBuiltValueToStringHelper(r'GCreateStickerData')
          ..add('G__typename', G__typename)
          ..add('createSticker', createSticker))
        .toString();
  }
}

class GCreateStickerDataBuilder
    implements Builder<GCreateStickerData, GCreateStickerDataBuilder> {
  _$GCreateStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateStickerData_createStickerBuilder? _createSticker;
  GCreateStickerData_createStickerBuilder get createSticker =>
      _$this._createSticker ??= new GCreateStickerData_createStickerBuilder();
  set createSticker(GCreateStickerData_createStickerBuilder? createSticker) =>
      _$this._createSticker = createSticker;

  GCreateStickerDataBuilder() {
    GCreateStickerData._initializeBuilder(this);
  }

  GCreateStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createSticker = $v.createSticker.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateStickerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateStickerData;
  }

  @override
  void update(void Function(GCreateStickerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateStickerData build() => _build();

  _$GCreateStickerData _build() {
    _$GCreateStickerData _$result;
    try {
      _$result = _$v ??
          new _$GCreateStickerData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateStickerData', 'G__typename'),
              createSticker: createSticker.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createSticker';
        createSticker.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateStickerData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateStickerData_createSticker
    extends GCreateStickerData_createSticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;

  factory _$GCreateStickerData_createSticker(
          [void Function(GCreateStickerData_createStickerBuilder)? updates]) =>
      (new GCreateStickerData_createStickerBuilder()..update(updates))._build();

  _$GCreateStickerData_createSticker._(
      {required this.G__typename, required this.id, required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateStickerData_createSticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateStickerData_createSticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GCreateStickerData_createSticker', 'title');
  }

  @override
  GCreateStickerData_createSticker rebuild(
          void Function(GCreateStickerData_createStickerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateStickerData_createStickerBuilder toBuilder() =>
      new GCreateStickerData_createStickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateStickerData_createSticker &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateStickerData_createSticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class GCreateStickerData_createStickerBuilder
    implements
        Builder<GCreateStickerData_createSticker,
            GCreateStickerData_createStickerBuilder> {
  _$GCreateStickerData_createSticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GCreateStickerData_createStickerBuilder() {
    GCreateStickerData_createSticker._initializeBuilder(this);
  }

  GCreateStickerData_createStickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateStickerData_createSticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateStickerData_createSticker;
  }

  @override
  void update(void Function(GCreateStickerData_createStickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateStickerData_createSticker build() => _build();

  _$GCreateStickerData_createSticker _build() {
    final _$result = _$v ??
        new _$GCreateStickerData_createSticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateStickerData_createSticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateStickerData_createSticker', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GCreateStickerData_createSticker', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
