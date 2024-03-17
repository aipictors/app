// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteUserStickerData> _$gDeleteUserStickerDataSerializer =
    new _$GDeleteUserStickerDataSerializer();
Serializer<GDeleteUserStickerData_deleteUserSticker>
    _$gDeleteUserStickerDataDeleteUserStickerSerializer =
    new _$GDeleteUserStickerData_deleteUserStickerSerializer();

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
      'deleteUserSticker',
      serializers.serialize(object.deleteUserSticker,
          specifiedType:
              const FullType(GDeleteUserStickerData_deleteUserSticker)),
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
        case 'deleteUserSticker':
          result.deleteUserSticker.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDeleteUserStickerData_deleteUserSticker))!
              as GDeleteUserStickerData_deleteUserSticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteUserStickerData_deleteUserStickerSerializer
    implements StructuredSerializer<GDeleteUserStickerData_deleteUserSticker> {
  @override
  final Iterable<Type> types = const [
    GDeleteUserStickerData_deleteUserSticker,
    _$GDeleteUserStickerData_deleteUserSticker
  ];
  @override
  final String wireName = 'GDeleteUserStickerData_deleteUserSticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteUserStickerData_deleteUserSticker object,
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
  GDeleteUserStickerData_deleteUserSticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteUserStickerData_deleteUserStickerBuilder();

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
  final GDeleteUserStickerData_deleteUserSticker deleteUserSticker;

  factory _$GDeleteUserStickerData(
          [void Function(GDeleteUserStickerDataBuilder)? updates]) =>
      (new GDeleteUserStickerDataBuilder()..update(updates))._build();

  _$GDeleteUserStickerData._(
      {required this.G__typename, required this.deleteUserSticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteUserStickerData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deleteUserSticker, r'GDeleteUserStickerData', 'deleteUserSticker');
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
        deleteUserSticker == other.deleteUserSticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteUserSticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteUserStickerData')
          ..add('G__typename', G__typename)
          ..add('deleteUserSticker', deleteUserSticker))
        .toString();
  }
}

class GDeleteUserStickerDataBuilder
    implements Builder<GDeleteUserStickerData, GDeleteUserStickerDataBuilder> {
  _$GDeleteUserStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteUserStickerData_deleteUserStickerBuilder? _deleteUserSticker;
  GDeleteUserStickerData_deleteUserStickerBuilder get deleteUserSticker =>
      _$this._deleteUserSticker ??=
          new GDeleteUserStickerData_deleteUserStickerBuilder();
  set deleteUserSticker(
          GDeleteUserStickerData_deleteUserStickerBuilder? deleteUserSticker) =>
      _$this._deleteUserSticker = deleteUserSticker;

  GDeleteUserStickerDataBuilder() {
    GDeleteUserStickerData._initializeBuilder(this);
  }

  GDeleteUserStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteUserSticker = $v.deleteUserSticker.toBuilder();
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
              deleteUserSticker: deleteUserSticker.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteUserSticker';
        deleteUserSticker.build();
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

class _$GDeleteUserStickerData_deleteUserSticker
    extends GDeleteUserStickerData_deleteUserSticker {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteUserStickerData_deleteUserSticker(
          [void Function(GDeleteUserStickerData_deleteUserStickerBuilder)?
              updates]) =>
      (new GDeleteUserStickerData_deleteUserStickerBuilder()..update(updates))
          ._build();

  _$GDeleteUserStickerData_deleteUserSticker._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GDeleteUserStickerData_deleteUserSticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteUserStickerData_deleteUserSticker', 'id');
  }

  @override
  GDeleteUserStickerData_deleteUserSticker rebuild(
          void Function(GDeleteUserStickerData_deleteUserStickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteUserStickerData_deleteUserStickerBuilder toBuilder() =>
      new GDeleteUserStickerData_deleteUserStickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteUserStickerData_deleteUserSticker &&
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
            r'GDeleteUserStickerData_deleteUserSticker')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteUserStickerData_deleteUserStickerBuilder
    implements
        Builder<GDeleteUserStickerData_deleteUserSticker,
            GDeleteUserStickerData_deleteUserStickerBuilder> {
  _$GDeleteUserStickerData_deleteUserSticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteUserStickerData_deleteUserStickerBuilder() {
    GDeleteUserStickerData_deleteUserSticker._initializeBuilder(this);
  }

  GDeleteUserStickerData_deleteUserStickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteUserStickerData_deleteUserSticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteUserStickerData_deleteUserSticker;
  }

  @override
  void update(
      void Function(GDeleteUserStickerData_deleteUserStickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteUserStickerData_deleteUserSticker build() => _build();

  _$GDeleteUserStickerData_deleteUserSticker _build() {
    final _$result = _$v ??
        new _$GDeleteUserStickerData_deleteUserSticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDeleteUserStickerData_deleteUserSticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteUserStickerData_deleteUserSticker', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
