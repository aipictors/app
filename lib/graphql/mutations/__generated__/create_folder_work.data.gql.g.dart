// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateFolderWorkData> _$gCreateFolderWorkDataSerializer =
    new _$GCreateFolderWorkDataSerializer();
Serializer<GCreateFolderWorkData_createFolderWork>
    _$gCreateFolderWorkDataCreateFolderWorkSerializer =
    new _$GCreateFolderWorkData_createFolderWorkSerializer();

class _$GCreateFolderWorkDataSerializer
    implements StructuredSerializer<GCreateFolderWorkData> {
  @override
  final Iterable<Type> types = const [
    GCreateFolderWorkData,
    _$GCreateFolderWorkData
  ];
  @override
  final String wireName = 'GCreateFolderWorkData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateFolderWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createFolderWork',
      serializers.serialize(object.createFolderWork,
          specifiedType:
              const FullType(GCreateFolderWorkData_createFolderWork)),
    ];

    return result;
  }

  @override
  GCreateFolderWorkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateFolderWorkDataBuilder();

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
        case 'createFolderWork':
          result.createFolderWork.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateFolderWorkData_createFolderWork))!
              as GCreateFolderWorkData_createFolderWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateFolderWorkData_createFolderWorkSerializer
    implements StructuredSerializer<GCreateFolderWorkData_createFolderWork> {
  @override
  final Iterable<Type> types = const [
    GCreateFolderWorkData_createFolderWork,
    _$GCreateFolderWorkData_createFolderWork
  ];
  @override
  final String wireName = 'GCreateFolderWorkData_createFolderWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateFolderWorkData_createFolderWork object,
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
  GCreateFolderWorkData_createFolderWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateFolderWorkData_createFolderWorkBuilder();

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

class _$GCreateFolderWorkData extends GCreateFolderWorkData {
  @override
  final String G__typename;
  @override
  final GCreateFolderWorkData_createFolderWork createFolderWork;

  factory _$GCreateFolderWorkData(
          [void Function(GCreateFolderWorkDataBuilder)? updates]) =>
      (new GCreateFolderWorkDataBuilder()..update(updates))._build();

  _$GCreateFolderWorkData._(
      {required this.G__typename, required this.createFolderWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateFolderWorkData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createFolderWork, r'GCreateFolderWorkData', 'createFolderWork');
  }

  @override
  GCreateFolderWorkData rebuild(
          void Function(GCreateFolderWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateFolderWorkDataBuilder toBuilder() =>
      new GCreateFolderWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateFolderWorkData &&
        G__typename == other.G__typename &&
        createFolderWork == other.createFolderWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createFolderWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateFolderWorkData')
          ..add('G__typename', G__typename)
          ..add('createFolderWork', createFolderWork))
        .toString();
  }
}

class GCreateFolderWorkDataBuilder
    implements Builder<GCreateFolderWorkData, GCreateFolderWorkDataBuilder> {
  _$GCreateFolderWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateFolderWorkData_createFolderWorkBuilder? _createFolderWork;
  GCreateFolderWorkData_createFolderWorkBuilder get createFolderWork =>
      _$this._createFolderWork ??=
          new GCreateFolderWorkData_createFolderWorkBuilder();
  set createFolderWork(
          GCreateFolderWorkData_createFolderWorkBuilder? createFolderWork) =>
      _$this._createFolderWork = createFolderWork;

  GCreateFolderWorkDataBuilder() {
    GCreateFolderWorkData._initializeBuilder(this);
  }

  GCreateFolderWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createFolderWork = $v.createFolderWork.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateFolderWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateFolderWorkData;
  }

  @override
  void update(void Function(GCreateFolderWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateFolderWorkData build() => _build();

  _$GCreateFolderWorkData _build() {
    _$GCreateFolderWorkData _$result;
    try {
      _$result = _$v ??
          new _$GCreateFolderWorkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateFolderWorkData', 'G__typename'),
              createFolderWork: createFolderWork.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createFolderWork';
        createFolderWork.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateFolderWorkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateFolderWorkData_createFolderWork
    extends GCreateFolderWorkData_createFolderWork {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateFolderWorkData_createFolderWork(
          [void Function(GCreateFolderWorkData_createFolderWorkBuilder)?
              updates]) =>
      (new GCreateFolderWorkData_createFolderWorkBuilder()..update(updates))
          ._build();

  _$GCreateFolderWorkData_createFolderWork._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateFolderWorkData_createFolderWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateFolderWorkData_createFolderWork', 'id');
  }

  @override
  GCreateFolderWorkData_createFolderWork rebuild(
          void Function(GCreateFolderWorkData_createFolderWorkBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateFolderWorkData_createFolderWorkBuilder toBuilder() =>
      new GCreateFolderWorkData_createFolderWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateFolderWorkData_createFolderWork &&
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
            r'GCreateFolderWorkData_createFolderWork')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateFolderWorkData_createFolderWorkBuilder
    implements
        Builder<GCreateFolderWorkData_createFolderWork,
            GCreateFolderWorkData_createFolderWorkBuilder> {
  _$GCreateFolderWorkData_createFolderWork? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateFolderWorkData_createFolderWorkBuilder() {
    GCreateFolderWorkData_createFolderWork._initializeBuilder(this);
  }

  GCreateFolderWorkData_createFolderWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateFolderWorkData_createFolderWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateFolderWorkData_createFolderWork;
  }

  @override
  void update(
      void Function(GCreateFolderWorkData_createFolderWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateFolderWorkData_createFolderWork build() => _build();

  _$GCreateFolderWorkData_createFolderWork _build() {
    final _$result = _$v ??
        new _$GCreateFolderWorkData_createFolderWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateFolderWorkData_createFolderWork', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateFolderWorkData_createFolderWork', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
