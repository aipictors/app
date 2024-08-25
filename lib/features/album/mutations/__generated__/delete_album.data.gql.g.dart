// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_album.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteAlbumData> _$gDeleteAlbumDataSerializer =
    new _$GDeleteAlbumDataSerializer();
Serializer<GDeleteAlbumData_deleteAlbum>
    _$gDeleteAlbumDataDeleteAlbumSerializer =
    new _$GDeleteAlbumData_deleteAlbumSerializer();

class _$GDeleteAlbumDataSerializer
    implements StructuredSerializer<GDeleteAlbumData> {
  @override
  final Iterable<Type> types = const [GDeleteAlbumData, _$GDeleteAlbumData];
  @override
  final String wireName = 'GDeleteAlbumData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDeleteAlbumData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deleteAlbum',
      serializers.serialize(object.deleteAlbum,
          specifiedType: const FullType(GDeleteAlbumData_deleteAlbum)),
    ];

    return result;
  }

  @override
  GDeleteAlbumData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteAlbumDataBuilder();

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
        case 'deleteAlbum':
          result.deleteAlbum.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GDeleteAlbumData_deleteAlbum))!
              as GDeleteAlbumData_deleteAlbum);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteAlbumData_deleteAlbumSerializer
    implements StructuredSerializer<GDeleteAlbumData_deleteAlbum> {
  @override
  final Iterable<Type> types = const [
    GDeleteAlbumData_deleteAlbum,
    _$GDeleteAlbumData_deleteAlbum
  ];
  @override
  final String wireName = 'GDeleteAlbumData_deleteAlbum';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteAlbumData_deleteAlbum object,
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
  GDeleteAlbumData_deleteAlbum deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteAlbumData_deleteAlbumBuilder();

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

class _$GDeleteAlbumData extends GDeleteAlbumData {
  @override
  final String G__typename;
  @override
  final GDeleteAlbumData_deleteAlbum deleteAlbum;

  factory _$GDeleteAlbumData(
          [void Function(GDeleteAlbumDataBuilder)? updates]) =>
      (new GDeleteAlbumDataBuilder()..update(updates))._build();

  _$GDeleteAlbumData._({required this.G__typename, required this.deleteAlbum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteAlbumData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deleteAlbum, r'GDeleteAlbumData', 'deleteAlbum');
  }

  @override
  GDeleteAlbumData rebuild(void Function(GDeleteAlbumDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteAlbumDataBuilder toBuilder() =>
      new GDeleteAlbumDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteAlbumData &&
        G__typename == other.G__typename &&
        deleteAlbum == other.deleteAlbum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteAlbum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteAlbumData')
          ..add('G__typename', G__typename)
          ..add('deleteAlbum', deleteAlbum))
        .toString();
  }
}

class GDeleteAlbumDataBuilder
    implements Builder<GDeleteAlbumData, GDeleteAlbumDataBuilder> {
  _$GDeleteAlbumData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteAlbumData_deleteAlbumBuilder? _deleteAlbum;
  GDeleteAlbumData_deleteAlbumBuilder get deleteAlbum =>
      _$this._deleteAlbum ??= new GDeleteAlbumData_deleteAlbumBuilder();
  set deleteAlbum(GDeleteAlbumData_deleteAlbumBuilder? deleteAlbum) =>
      _$this._deleteAlbum = deleteAlbum;

  GDeleteAlbumDataBuilder() {
    GDeleteAlbumData._initializeBuilder(this);
  }

  GDeleteAlbumDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteAlbum = $v.deleteAlbum.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteAlbumData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteAlbumData;
  }

  @override
  void update(void Function(GDeleteAlbumDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteAlbumData build() => _build();

  _$GDeleteAlbumData _build() {
    _$GDeleteAlbumData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteAlbumData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDeleteAlbumData', 'G__typename'),
              deleteAlbum: deleteAlbum.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteAlbum';
        deleteAlbum.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteAlbumData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteAlbumData_deleteAlbum extends GDeleteAlbumData_deleteAlbum {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteAlbumData_deleteAlbum(
          [void Function(GDeleteAlbumData_deleteAlbumBuilder)? updates]) =>
      (new GDeleteAlbumData_deleteAlbumBuilder()..update(updates))._build();

  _$GDeleteAlbumData_deleteAlbum._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteAlbumData_deleteAlbum', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteAlbumData_deleteAlbum', 'id');
  }

  @override
  GDeleteAlbumData_deleteAlbum rebuild(
          void Function(GDeleteAlbumData_deleteAlbumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteAlbumData_deleteAlbumBuilder toBuilder() =>
      new GDeleteAlbumData_deleteAlbumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteAlbumData_deleteAlbum &&
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
    return (newBuiltValueToStringHelper(r'GDeleteAlbumData_deleteAlbum')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteAlbumData_deleteAlbumBuilder
    implements
        Builder<GDeleteAlbumData_deleteAlbum,
            GDeleteAlbumData_deleteAlbumBuilder> {
  _$GDeleteAlbumData_deleteAlbum? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteAlbumData_deleteAlbumBuilder() {
    GDeleteAlbumData_deleteAlbum._initializeBuilder(this);
  }

  GDeleteAlbumData_deleteAlbumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteAlbumData_deleteAlbum other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteAlbumData_deleteAlbum;
  }

  @override
  void update(void Function(GDeleteAlbumData_deleteAlbumBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteAlbumData_deleteAlbum build() => _build();

  _$GDeleteAlbumData_deleteAlbum _build() {
    final _$result = _$v ??
        new _$GDeleteAlbumData_deleteAlbum._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GDeleteAlbumData_deleteAlbum', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteAlbumData_deleteAlbum', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
