// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteStickerData> _$gDeleteStickerDataSerializer =
    new _$GDeleteStickerDataSerializer();
Serializer<GDeleteStickerData_deleteSticker>
    _$gDeleteStickerDataDeleteStickerSerializer =
    new _$GDeleteStickerData_deleteStickerSerializer();

class _$GDeleteStickerDataSerializer
    implements StructuredSerializer<GDeleteStickerData> {
  @override
  final Iterable<Type> types = const [GDeleteStickerData, _$GDeleteStickerData];
  @override
  final String wireName = 'GDeleteStickerData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteStickerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deleteSticker',
      serializers.serialize(object.deleteSticker,
          specifiedType: const FullType(GDeleteStickerData_deleteSticker)),
    ];

    return result;
  }

  @override
  GDeleteStickerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteStickerDataBuilder();

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
        case 'deleteSticker':
          result.deleteSticker.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDeleteStickerData_deleteSticker))!
              as GDeleteStickerData_deleteSticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteStickerData_deleteStickerSerializer
    implements StructuredSerializer<GDeleteStickerData_deleteSticker> {
  @override
  final Iterable<Type> types = const [
    GDeleteStickerData_deleteSticker,
    _$GDeleteStickerData_deleteSticker
  ];
  @override
  final String wireName = 'GDeleteStickerData_deleteSticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteStickerData_deleteSticker object,
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
  GDeleteStickerData_deleteSticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteStickerData_deleteStickerBuilder();

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

class _$GDeleteStickerData extends GDeleteStickerData {
  @override
  final String G__typename;
  @override
  final GDeleteStickerData_deleteSticker deleteSticker;

  factory _$GDeleteStickerData(
          [void Function(GDeleteStickerDataBuilder)? updates]) =>
      (new GDeleteStickerDataBuilder()..update(updates))._build();

  _$GDeleteStickerData._(
      {required this.G__typename, required this.deleteSticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteStickerData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deleteSticker, r'GDeleteStickerData', 'deleteSticker');
  }

  @override
  GDeleteStickerData rebuild(
          void Function(GDeleteStickerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteStickerDataBuilder toBuilder() =>
      new GDeleteStickerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteStickerData &&
        G__typename == other.G__typename &&
        deleteSticker == other.deleteSticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteSticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteStickerData')
          ..add('G__typename', G__typename)
          ..add('deleteSticker', deleteSticker))
        .toString();
  }
}

class GDeleteStickerDataBuilder
    implements Builder<GDeleteStickerData, GDeleteStickerDataBuilder> {
  _$GDeleteStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteStickerData_deleteStickerBuilder? _deleteSticker;
  GDeleteStickerData_deleteStickerBuilder get deleteSticker =>
      _$this._deleteSticker ??= new GDeleteStickerData_deleteStickerBuilder();
  set deleteSticker(GDeleteStickerData_deleteStickerBuilder? deleteSticker) =>
      _$this._deleteSticker = deleteSticker;

  GDeleteStickerDataBuilder() {
    GDeleteStickerData._initializeBuilder(this);
  }

  GDeleteStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteSticker = $v.deleteSticker.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteStickerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteStickerData;
  }

  @override
  void update(void Function(GDeleteStickerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteStickerData build() => _build();

  _$GDeleteStickerData _build() {
    _$GDeleteStickerData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteStickerData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDeleteStickerData', 'G__typename'),
              deleteSticker: deleteSticker.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteSticker';
        deleteSticker.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteStickerData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteStickerData_deleteSticker
    extends GDeleteStickerData_deleteSticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;

  factory _$GDeleteStickerData_deleteSticker(
          [void Function(GDeleteStickerData_deleteStickerBuilder)? updates]) =>
      (new GDeleteStickerData_deleteStickerBuilder()..update(updates))._build();

  _$GDeleteStickerData_deleteSticker._(
      {required this.G__typename, required this.id, required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteStickerData_deleteSticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteStickerData_deleteSticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GDeleteStickerData_deleteSticker', 'title');
  }

  @override
  GDeleteStickerData_deleteSticker rebuild(
          void Function(GDeleteStickerData_deleteStickerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteStickerData_deleteStickerBuilder toBuilder() =>
      new GDeleteStickerData_deleteStickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteStickerData_deleteSticker &&
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
    return (newBuiltValueToStringHelper(r'GDeleteStickerData_deleteSticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class GDeleteStickerData_deleteStickerBuilder
    implements
        Builder<GDeleteStickerData_deleteSticker,
            GDeleteStickerData_deleteStickerBuilder> {
  _$GDeleteStickerData_deleteSticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GDeleteStickerData_deleteStickerBuilder() {
    GDeleteStickerData_deleteSticker._initializeBuilder(this);
  }

  GDeleteStickerData_deleteStickerBuilder get _$this {
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
  void replace(GDeleteStickerData_deleteSticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteStickerData_deleteSticker;
  }

  @override
  void update(void Function(GDeleteStickerData_deleteStickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteStickerData_deleteSticker build() => _build();

  _$GDeleteStickerData_deleteSticker _build() {
    final _$result = _$v ??
        new _$GDeleteStickerData_deleteSticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDeleteStickerData_deleteSticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteStickerData_deleteSticker', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GDeleteStickerData_deleteSticker', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
