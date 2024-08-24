// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_album_work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteAlbumWorkData> _$gDeleteAlbumWorkDataSerializer =
    new _$GDeleteAlbumWorkDataSerializer();
Serializer<GDeleteAlbumWorkData_deleteAlbumWork>
    _$gDeleteAlbumWorkDataDeleteAlbumWorkSerializer =
    new _$GDeleteAlbumWorkData_deleteAlbumWorkSerializer();

class _$GDeleteAlbumWorkDataSerializer
    implements StructuredSerializer<GDeleteAlbumWorkData> {
  @override
  final Iterable<Type> types = const [
    GDeleteAlbumWorkData,
    _$GDeleteAlbumWorkData
  ];
  @override
  final String wireName = 'GDeleteAlbumWorkData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteAlbumWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deleteAlbumWork',
      serializers.serialize(object.deleteAlbumWork,
          specifiedType: const FullType(GDeleteAlbumWorkData_deleteAlbumWork)),
    ];

    return result;
  }

  @override
  GDeleteAlbumWorkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteAlbumWorkDataBuilder();

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
        case 'deleteAlbumWork':
          result.deleteAlbumWork.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDeleteAlbumWorkData_deleteAlbumWork))!
              as GDeleteAlbumWorkData_deleteAlbumWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteAlbumWorkData_deleteAlbumWorkSerializer
    implements StructuredSerializer<GDeleteAlbumWorkData_deleteAlbumWork> {
  @override
  final Iterable<Type> types = const [
    GDeleteAlbumWorkData_deleteAlbumWork,
    _$GDeleteAlbumWorkData_deleteAlbumWork
  ];
  @override
  final String wireName = 'GDeleteAlbumWorkData_deleteAlbumWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteAlbumWorkData_deleteAlbumWork object,
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
  GDeleteAlbumWorkData_deleteAlbumWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteAlbumWorkData_deleteAlbumWorkBuilder();

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

class _$GDeleteAlbumWorkData extends GDeleteAlbumWorkData {
  @override
  final String G__typename;
  @override
  final GDeleteAlbumWorkData_deleteAlbumWork deleteAlbumWork;

  factory _$GDeleteAlbumWorkData(
          [void Function(GDeleteAlbumWorkDataBuilder)? updates]) =>
      (new GDeleteAlbumWorkDataBuilder()..update(updates))._build();

  _$GDeleteAlbumWorkData._(
      {required this.G__typename, required this.deleteAlbumWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteAlbumWorkData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deleteAlbumWork, r'GDeleteAlbumWorkData', 'deleteAlbumWork');
  }

  @override
  GDeleteAlbumWorkData rebuild(
          void Function(GDeleteAlbumWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteAlbumWorkDataBuilder toBuilder() =>
      new GDeleteAlbumWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteAlbumWorkData &&
        G__typename == other.G__typename &&
        deleteAlbumWork == other.deleteAlbumWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteAlbumWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteAlbumWorkData')
          ..add('G__typename', G__typename)
          ..add('deleteAlbumWork', deleteAlbumWork))
        .toString();
  }
}

class GDeleteAlbumWorkDataBuilder
    implements Builder<GDeleteAlbumWorkData, GDeleteAlbumWorkDataBuilder> {
  _$GDeleteAlbumWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteAlbumWorkData_deleteAlbumWorkBuilder? _deleteAlbumWork;
  GDeleteAlbumWorkData_deleteAlbumWorkBuilder get deleteAlbumWork =>
      _$this._deleteAlbumWork ??=
          new GDeleteAlbumWorkData_deleteAlbumWorkBuilder();
  set deleteAlbumWork(
          GDeleteAlbumWorkData_deleteAlbumWorkBuilder? deleteAlbumWork) =>
      _$this._deleteAlbumWork = deleteAlbumWork;

  GDeleteAlbumWorkDataBuilder() {
    GDeleteAlbumWorkData._initializeBuilder(this);
  }

  GDeleteAlbumWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteAlbumWork = $v.deleteAlbumWork.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteAlbumWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteAlbumWorkData;
  }

  @override
  void update(void Function(GDeleteAlbumWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteAlbumWorkData build() => _build();

  _$GDeleteAlbumWorkData _build() {
    _$GDeleteAlbumWorkData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteAlbumWorkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDeleteAlbumWorkData', 'G__typename'),
              deleteAlbumWork: deleteAlbumWork.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteAlbumWork';
        deleteAlbumWork.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteAlbumWorkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteAlbumWorkData_deleteAlbumWork
    extends GDeleteAlbumWorkData_deleteAlbumWork {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteAlbumWorkData_deleteAlbumWork(
          [void Function(GDeleteAlbumWorkData_deleteAlbumWorkBuilder)?
              updates]) =>
      (new GDeleteAlbumWorkData_deleteAlbumWorkBuilder()..update(updates))
          ._build();

  _$GDeleteAlbumWorkData_deleteAlbumWork._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteAlbumWorkData_deleteAlbumWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteAlbumWorkData_deleteAlbumWork', 'id');
  }

  @override
  GDeleteAlbumWorkData_deleteAlbumWork rebuild(
          void Function(GDeleteAlbumWorkData_deleteAlbumWorkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteAlbumWorkData_deleteAlbumWorkBuilder toBuilder() =>
      new GDeleteAlbumWorkData_deleteAlbumWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteAlbumWorkData_deleteAlbumWork &&
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
    return (newBuiltValueToStringHelper(r'GDeleteAlbumWorkData_deleteAlbumWork')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteAlbumWorkData_deleteAlbumWorkBuilder
    implements
        Builder<GDeleteAlbumWorkData_deleteAlbumWork,
            GDeleteAlbumWorkData_deleteAlbumWorkBuilder> {
  _$GDeleteAlbumWorkData_deleteAlbumWork? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteAlbumWorkData_deleteAlbumWorkBuilder() {
    GDeleteAlbumWorkData_deleteAlbumWork._initializeBuilder(this);
  }

  GDeleteAlbumWorkData_deleteAlbumWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteAlbumWorkData_deleteAlbumWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteAlbumWorkData_deleteAlbumWork;
  }

  @override
  void update(
      void Function(GDeleteAlbumWorkData_deleteAlbumWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteAlbumWorkData_deleteAlbumWork build() => _build();

  _$GDeleteAlbumWorkData_deleteAlbumWork _build() {
    final _$result = _$v ??
        new _$GDeleteAlbumWorkData_deleteAlbumWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDeleteAlbumWorkData_deleteAlbumWork', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteAlbumWorkData_deleteAlbumWork', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
