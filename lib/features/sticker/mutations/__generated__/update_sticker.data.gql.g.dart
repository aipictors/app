// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateStickerData> _$gUpdateStickerDataSerializer =
    new _$GUpdateStickerDataSerializer();
Serializer<GUpdateStickerData_updateSticker>
    _$gUpdateStickerDataUpdateStickerSerializer =
    new _$GUpdateStickerData_updateStickerSerializer();

class _$GUpdateStickerDataSerializer
    implements StructuredSerializer<GUpdateStickerData> {
  @override
  final Iterable<Type> types = const [GUpdateStickerData, _$GUpdateStickerData];
  @override
  final String wireName = 'GUpdateStickerData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateStickerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateSticker',
      serializers.serialize(object.updateSticker,
          specifiedType: const FullType(GUpdateStickerData_updateSticker)),
    ];

    return result;
  }

  @override
  GUpdateStickerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateStickerDataBuilder();

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
        case 'updateSticker':
          result.updateSticker.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUpdateStickerData_updateSticker))!
              as GUpdateStickerData_updateSticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateStickerData_updateStickerSerializer
    implements StructuredSerializer<GUpdateStickerData_updateSticker> {
  @override
  final Iterable<Type> types = const [
    GUpdateStickerData_updateSticker,
    _$GUpdateStickerData_updateSticker
  ];
  @override
  final String wireName = 'GUpdateStickerData_updateSticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateStickerData_updateSticker object,
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
  GUpdateStickerData_updateSticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateStickerData_updateStickerBuilder();

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

class _$GUpdateStickerData extends GUpdateStickerData {
  @override
  final String G__typename;
  @override
  final GUpdateStickerData_updateSticker updateSticker;

  factory _$GUpdateStickerData(
          [void Function(GUpdateStickerDataBuilder)? updates]) =>
      (new GUpdateStickerDataBuilder()..update(updates))._build();

  _$GUpdateStickerData._(
      {required this.G__typename, required this.updateSticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateStickerData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        updateSticker, r'GUpdateStickerData', 'updateSticker');
  }

  @override
  GUpdateStickerData rebuild(
          void Function(GUpdateStickerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateStickerDataBuilder toBuilder() =>
      new GUpdateStickerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateStickerData &&
        G__typename == other.G__typename &&
        updateSticker == other.updateSticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateSticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateStickerData')
          ..add('G__typename', G__typename)
          ..add('updateSticker', updateSticker))
        .toString();
  }
}

class GUpdateStickerDataBuilder
    implements Builder<GUpdateStickerData, GUpdateStickerDataBuilder> {
  _$GUpdateStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateStickerData_updateStickerBuilder? _updateSticker;
  GUpdateStickerData_updateStickerBuilder get updateSticker =>
      _$this._updateSticker ??= new GUpdateStickerData_updateStickerBuilder();
  set updateSticker(GUpdateStickerData_updateStickerBuilder? updateSticker) =>
      _$this._updateSticker = updateSticker;

  GUpdateStickerDataBuilder() {
    GUpdateStickerData._initializeBuilder(this);
  }

  GUpdateStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateSticker = $v.updateSticker.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateStickerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateStickerData;
  }

  @override
  void update(void Function(GUpdateStickerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateStickerData build() => _build();

  _$GUpdateStickerData _build() {
    _$GUpdateStickerData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateStickerData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdateStickerData', 'G__typename'),
              updateSticker: updateSticker.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateSticker';
        updateSticker.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateStickerData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateStickerData_updateSticker
    extends GUpdateStickerData_updateSticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;

  factory _$GUpdateStickerData_updateSticker(
          [void Function(GUpdateStickerData_updateStickerBuilder)? updates]) =>
      (new GUpdateStickerData_updateStickerBuilder()..update(updates))._build();

  _$GUpdateStickerData_updateSticker._(
      {required this.G__typename, required this.id, required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateStickerData_updateSticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateStickerData_updateSticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUpdateStickerData_updateSticker', 'title');
  }

  @override
  GUpdateStickerData_updateSticker rebuild(
          void Function(GUpdateStickerData_updateStickerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateStickerData_updateStickerBuilder toBuilder() =>
      new GUpdateStickerData_updateStickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateStickerData_updateSticker &&
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
    return (newBuiltValueToStringHelper(r'GUpdateStickerData_updateSticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class GUpdateStickerData_updateStickerBuilder
    implements
        Builder<GUpdateStickerData_updateSticker,
            GUpdateStickerData_updateStickerBuilder> {
  _$GUpdateStickerData_updateSticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GUpdateStickerData_updateStickerBuilder() {
    GUpdateStickerData_updateSticker._initializeBuilder(this);
  }

  GUpdateStickerData_updateStickerBuilder get _$this {
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
  void replace(GUpdateStickerData_updateSticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateStickerData_updateSticker;
  }

  @override
  void update(void Function(GUpdateStickerData_updateStickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateStickerData_updateSticker build() => _build();

  _$GUpdateStickerData_updateSticker _build() {
    final _$result = _$v ??
        new _$GUpdateStickerData_updateSticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUpdateStickerData_updateSticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateStickerData_updateSticker', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GUpdateStickerData_updateSticker', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
