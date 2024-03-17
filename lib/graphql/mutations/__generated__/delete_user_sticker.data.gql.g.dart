// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteUserStickerData> _$gDeleteUserStickerDataSerializer =
    new _$GDeleteUserStickerDataSerializer();
Serializer<GDeleteUserStickerData_deleteSticker>
    _$gDeleteUserStickerDataDeleteStickerSerializer =
    new _$GDeleteUserStickerData_deleteStickerSerializer();

class _$GDeleteUserStickerDataSerializer
    implements StructuredSerializer<GDeleteUserStickerData> {
  @override
  final Iterable<Type> types = const [
    GDeleteUserStickerData,
    _$GDeleteUserStickerData
  ];
  @override
  final String wireName = 'GDeleteUserStickerData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteUserStickerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deleteSticker',
      serializers.serialize(object.deleteSticker,
          specifiedType: const FullType(GDeleteUserStickerData_deleteSticker)),
    ];

    return result;
  }

  @override
  GDeleteUserStickerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteUserStickerDataBuilder();

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
                      const FullType(GDeleteUserStickerData_deleteSticker))!
              as GDeleteUserStickerData_deleteSticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteUserStickerData_deleteStickerSerializer
    implements StructuredSerializer<GDeleteUserStickerData_deleteSticker> {
  @override
  final Iterable<Type> types = const [
    GDeleteUserStickerData_deleteSticker,
    _$GDeleteUserStickerData_deleteSticker
  ];
  @override
  final String wireName = 'GDeleteUserStickerData_deleteSticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteUserStickerData_deleteSticker object,
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
  GDeleteUserStickerData_deleteSticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteUserStickerData_deleteStickerBuilder();

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

class _$GDeleteUserStickerData extends GDeleteUserStickerData {
  @override
  final String G__typename;
  @override
  final GDeleteUserStickerData_deleteSticker deleteSticker;

  factory _$GDeleteUserStickerData(
          [void Function(GDeleteUserStickerDataBuilder)? updates]) =>
      (new GDeleteUserStickerDataBuilder()..update(updates))._build();

  _$GDeleteUserStickerData._(
      {required this.G__typename, required this.deleteSticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteUserStickerData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deleteSticker, r'GDeleteUserStickerData', 'deleteSticker');
  }

  @override
  GDeleteUserStickerData rebuild(
          void Function(GDeleteUserStickerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteUserStickerDataBuilder toBuilder() =>
      new GDeleteUserStickerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteUserStickerData &&
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
    return (newBuiltValueToStringHelper(r'GDeleteUserStickerData')
          ..add('G__typename', G__typename)
          ..add('deleteSticker', deleteSticker))
        .toString();
  }
}

class GDeleteUserStickerDataBuilder
    implements Builder<GDeleteUserStickerData, GDeleteUserStickerDataBuilder> {
  _$GDeleteUserStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteUserStickerData_deleteStickerBuilder? _deleteSticker;
  GDeleteUserStickerData_deleteStickerBuilder get deleteSticker =>
      _$this._deleteSticker ??=
          new GDeleteUserStickerData_deleteStickerBuilder();
  set deleteSticker(
          GDeleteUserStickerData_deleteStickerBuilder? deleteSticker) =>
      _$this._deleteSticker = deleteSticker;

  GDeleteUserStickerDataBuilder() {
    GDeleteUserStickerData._initializeBuilder(this);
  }

  GDeleteUserStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteSticker = $v.deleteSticker.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteUserStickerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteUserStickerData;
  }

  @override
  void update(void Function(GDeleteUserStickerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteUserStickerData build() => _build();

  _$GDeleteUserStickerData _build() {
    _$GDeleteUserStickerData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteUserStickerData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDeleteUserStickerData', 'G__typename'),
              deleteSticker: deleteSticker.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteSticker';
        deleteSticker.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteUserStickerData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteUserStickerData_deleteSticker
    extends GDeleteUserStickerData_deleteSticker {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteUserStickerData_deleteSticker(
          [void Function(GDeleteUserStickerData_deleteStickerBuilder)?
              updates]) =>
      (new GDeleteUserStickerData_deleteStickerBuilder()..update(updates))
          ._build();

  _$GDeleteUserStickerData_deleteSticker._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteUserStickerData_deleteSticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteUserStickerData_deleteSticker', 'id');
  }

  @override
  GDeleteUserStickerData_deleteSticker rebuild(
          void Function(GDeleteUserStickerData_deleteStickerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteUserStickerData_deleteStickerBuilder toBuilder() =>
      new GDeleteUserStickerData_deleteStickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteUserStickerData_deleteSticker &&
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
    return (newBuiltValueToStringHelper(r'GDeleteUserStickerData_deleteSticker')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteUserStickerData_deleteStickerBuilder
    implements
        Builder<GDeleteUserStickerData_deleteSticker,
            GDeleteUserStickerData_deleteStickerBuilder> {
  _$GDeleteUserStickerData_deleteSticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteUserStickerData_deleteStickerBuilder() {
    GDeleteUserStickerData_deleteSticker._initializeBuilder(this);
  }

  GDeleteUserStickerData_deleteStickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteUserStickerData_deleteSticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteUserStickerData_deleteSticker;
  }

  @override
  void update(
      void Function(GDeleteUserStickerData_deleteStickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteUserStickerData_deleteSticker build() => _build();

  _$GDeleteUserStickerData_deleteSticker _build() {
    final _$result = _$v ??
        new _$GDeleteUserStickerData_deleteSticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDeleteUserStickerData_deleteSticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteUserStickerData_deleteSticker', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
