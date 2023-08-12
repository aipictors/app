// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_album_work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAlbumWorkData> _$gCreateAlbumWorkDataSerializer =
    new _$GCreateAlbumWorkDataSerializer();
Serializer<GCreateAlbumWorkData_createAlbumWork>
    _$gCreateAlbumWorkDataCreateAlbumWorkSerializer =
    new _$GCreateAlbumWorkData_createAlbumWorkSerializer();

class _$GCreateAlbumWorkDataSerializer
    implements StructuredSerializer<GCreateAlbumWorkData> {
  @override
  final Iterable<Type> types = const [
    GCreateAlbumWorkData,
    _$GCreateAlbumWorkData
  ];
  @override
  final String wireName = 'GCreateAlbumWorkData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAlbumWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createAlbumWork',
      serializers.serialize(object.createAlbumWork,
          specifiedType: const FullType(GCreateAlbumWorkData_createAlbumWork)),
    ];

    return result;
  }

  @override
  GCreateAlbumWorkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAlbumWorkDataBuilder();

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
        case 'createAlbumWork':
          result.createAlbumWork.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateAlbumWorkData_createAlbumWork))!
              as GCreateAlbumWorkData_createAlbumWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAlbumWorkData_createAlbumWorkSerializer
    implements StructuredSerializer<GCreateAlbumWorkData_createAlbumWork> {
  @override
  final Iterable<Type> types = const [
    GCreateAlbumWorkData_createAlbumWork,
    _$GCreateAlbumWorkData_createAlbumWork
  ];
  @override
  final String wireName = 'GCreateAlbumWorkData_createAlbumWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAlbumWorkData_createAlbumWork object,
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
  GCreateAlbumWorkData_createAlbumWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAlbumWorkData_createAlbumWorkBuilder();

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

class _$GCreateAlbumWorkData extends GCreateAlbumWorkData {
  @override
  final String G__typename;
  @override
  final GCreateAlbumWorkData_createAlbumWork createAlbumWork;

  factory _$GCreateAlbumWorkData(
          [void Function(GCreateAlbumWorkDataBuilder)? updates]) =>
      (new GCreateAlbumWorkDataBuilder()..update(updates))._build();

  _$GCreateAlbumWorkData._(
      {required this.G__typename, required this.createAlbumWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateAlbumWorkData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createAlbumWork, r'GCreateAlbumWorkData', 'createAlbumWork');
  }

  @override
  GCreateAlbumWorkData rebuild(
          void Function(GCreateAlbumWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAlbumWorkDataBuilder toBuilder() =>
      new GCreateAlbumWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAlbumWorkData &&
        G__typename == other.G__typename &&
        createAlbumWork == other.createAlbumWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createAlbumWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateAlbumWorkData')
          ..add('G__typename', G__typename)
          ..add('createAlbumWork', createAlbumWork))
        .toString();
  }
}

class GCreateAlbumWorkDataBuilder
    implements Builder<GCreateAlbumWorkData, GCreateAlbumWorkDataBuilder> {
  _$GCreateAlbumWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateAlbumWorkData_createAlbumWorkBuilder? _createAlbumWork;
  GCreateAlbumWorkData_createAlbumWorkBuilder get createAlbumWork =>
      _$this._createAlbumWork ??=
          new GCreateAlbumWorkData_createAlbumWorkBuilder();
  set createAlbumWork(
          GCreateAlbumWorkData_createAlbumWorkBuilder? createAlbumWork) =>
      _$this._createAlbumWork = createAlbumWork;

  GCreateAlbumWorkDataBuilder() {
    GCreateAlbumWorkData._initializeBuilder(this);
  }

  GCreateAlbumWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createAlbumWork = $v.createAlbumWork.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAlbumWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAlbumWorkData;
  }

  @override
  void update(void Function(GCreateAlbumWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAlbumWorkData build() => _build();

  _$GCreateAlbumWorkData _build() {
    _$GCreateAlbumWorkData _$result;
    try {
      _$result = _$v ??
          new _$GCreateAlbumWorkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateAlbumWorkData', 'G__typename'),
              createAlbumWork: createAlbumWork.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createAlbumWork';
        createAlbumWork.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateAlbumWorkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateAlbumWorkData_createAlbumWork
    extends GCreateAlbumWorkData_createAlbumWork {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateAlbumWorkData_createAlbumWork(
          [void Function(GCreateAlbumWorkData_createAlbumWorkBuilder)?
              updates]) =>
      (new GCreateAlbumWorkData_createAlbumWorkBuilder()..update(updates))
          ._build();

  _$GCreateAlbumWorkData_createAlbumWork._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateAlbumWorkData_createAlbumWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateAlbumWorkData_createAlbumWork', 'id');
  }

  @override
  GCreateAlbumWorkData_createAlbumWork rebuild(
          void Function(GCreateAlbumWorkData_createAlbumWorkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAlbumWorkData_createAlbumWorkBuilder toBuilder() =>
      new GCreateAlbumWorkData_createAlbumWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAlbumWorkData_createAlbumWork &&
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
    return (newBuiltValueToStringHelper(r'GCreateAlbumWorkData_createAlbumWork')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateAlbumWorkData_createAlbumWorkBuilder
    implements
        Builder<GCreateAlbumWorkData_createAlbumWork,
            GCreateAlbumWorkData_createAlbumWorkBuilder> {
  _$GCreateAlbumWorkData_createAlbumWork? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateAlbumWorkData_createAlbumWorkBuilder() {
    GCreateAlbumWorkData_createAlbumWork._initializeBuilder(this);
  }

  GCreateAlbumWorkData_createAlbumWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAlbumWorkData_createAlbumWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAlbumWorkData_createAlbumWork;
  }

  @override
  void update(
      void Function(GCreateAlbumWorkData_createAlbumWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAlbumWorkData_createAlbumWork build() => _build();

  _$GCreateAlbumWorkData_createAlbumWork _build() {
    final _$result = _$v ??
        new _$GCreateAlbumWorkData_createAlbumWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateAlbumWorkData_createAlbumWork', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateAlbumWorkData_createAlbumWork', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
