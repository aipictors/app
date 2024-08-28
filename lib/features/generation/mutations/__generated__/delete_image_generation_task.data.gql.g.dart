// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_image_generation_task.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteImageGenerationTaskData>
    _$gDeleteImageGenerationTaskDataSerializer =
    new _$GDeleteImageGenerationTaskDataSerializer();
Serializer<GDeleteImageGenerationTaskData_deleteImageGenerationResult>
    _$gDeleteImageGenerationTaskDataDeleteImageGenerationResultSerializer =
    new _$GDeleteImageGenerationTaskData_deleteImageGenerationResultSerializer();

class _$GDeleteImageGenerationTaskDataSerializer
    implements StructuredSerializer<GDeleteImageGenerationTaskData> {
  @override
  final Iterable<Type> types = const [
    GDeleteImageGenerationTaskData,
    _$GDeleteImageGenerationTaskData
  ];
  @override
  final String wireName = 'GDeleteImageGenerationTaskData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteImageGenerationTaskData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deleteImageGenerationResult',
      serializers.serialize(object.deleteImageGenerationResult,
          specifiedType: const FullType(
              GDeleteImageGenerationTaskData_deleteImageGenerationResult)),
    ];

    return result;
  }

  @override
  GDeleteImageGenerationTaskData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteImageGenerationTaskDataBuilder();

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
        case 'deleteImageGenerationResult':
          result.deleteImageGenerationResult.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      GDeleteImageGenerationTaskData_deleteImageGenerationResult))!
              as GDeleteImageGenerationTaskData_deleteImageGenerationResult);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteImageGenerationTaskData_deleteImageGenerationResultSerializer
    implements
        StructuredSerializer<
            GDeleteImageGenerationTaskData_deleteImageGenerationResult> {
  @override
  final Iterable<Type> types = const [
    GDeleteImageGenerationTaskData_deleteImageGenerationResult,
    _$GDeleteImageGenerationTaskData_deleteImageGenerationResult
  ];
  @override
  final String wireName =
      'GDeleteImageGenerationTaskData_deleteImageGenerationResult';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GDeleteImageGenerationTaskData_deleteImageGenerationResult object,
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
  GDeleteImageGenerationTaskData_deleteImageGenerationResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder();

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

class _$GDeleteImageGenerationTaskData extends GDeleteImageGenerationTaskData {
  @override
  final String G__typename;
  @override
  final GDeleteImageGenerationTaskData_deleteImageGenerationResult
      deleteImageGenerationResult;

  factory _$GDeleteImageGenerationTaskData(
          [void Function(GDeleteImageGenerationTaskDataBuilder)? updates]) =>
      (new GDeleteImageGenerationTaskDataBuilder()..update(updates))._build();

  _$GDeleteImageGenerationTaskData._(
      {required this.G__typename, required this.deleteImageGenerationResult})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteImageGenerationTaskData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(deleteImageGenerationResult,
        r'GDeleteImageGenerationTaskData', 'deleteImageGenerationResult');
  }

  @override
  GDeleteImageGenerationTaskData rebuild(
          void Function(GDeleteImageGenerationTaskDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteImageGenerationTaskDataBuilder toBuilder() =>
      new GDeleteImageGenerationTaskDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteImageGenerationTaskData &&
        G__typename == other.G__typename &&
        deleteImageGenerationResult == other.deleteImageGenerationResult;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteImageGenerationResult.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteImageGenerationTaskData')
          ..add('G__typename', G__typename)
          ..add('deleteImageGenerationResult', deleteImageGenerationResult))
        .toString();
  }
}

class GDeleteImageGenerationTaskDataBuilder
    implements
        Builder<GDeleteImageGenerationTaskData,
            GDeleteImageGenerationTaskDataBuilder> {
  _$GDeleteImageGenerationTaskData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder?
      _deleteImageGenerationResult;
  GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder
      get deleteImageGenerationResult => _$this._deleteImageGenerationResult ??=
          new GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder();
  set deleteImageGenerationResult(
          GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder?
              deleteImageGenerationResult) =>
      _$this._deleteImageGenerationResult = deleteImageGenerationResult;

  GDeleteImageGenerationTaskDataBuilder() {
    GDeleteImageGenerationTaskData._initializeBuilder(this);
  }

  GDeleteImageGenerationTaskDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteImageGenerationResult = $v.deleteImageGenerationResult.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteImageGenerationTaskData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteImageGenerationTaskData;
  }

  @override
  void update(void Function(GDeleteImageGenerationTaskDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteImageGenerationTaskData build() => _build();

  _$GDeleteImageGenerationTaskData _build() {
    _$GDeleteImageGenerationTaskData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteImageGenerationTaskData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GDeleteImageGenerationTaskData', 'G__typename'),
              deleteImageGenerationResult: deleteImageGenerationResult.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteImageGenerationResult';
        deleteImageGenerationResult.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteImageGenerationTaskData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteImageGenerationTaskData_deleteImageGenerationResult
    extends GDeleteImageGenerationTaskData_deleteImageGenerationResult {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteImageGenerationTaskData_deleteImageGenerationResult(
          [void Function(
                  GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder)?
              updates]) =>
      (new GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder()
            ..update(updates))
          ._build();

  _$GDeleteImageGenerationTaskData_deleteImageGenerationResult._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GDeleteImageGenerationTaskData_deleteImageGenerationResult',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(id,
        r'GDeleteImageGenerationTaskData_deleteImageGenerationResult', 'id');
  }

  @override
  GDeleteImageGenerationTaskData_deleteImageGenerationResult rebuild(
          void Function(
                  GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder
      toBuilder() =>
          new GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GDeleteImageGenerationTaskData_deleteImageGenerationResult &&
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
            r'GDeleteImageGenerationTaskData_deleteImageGenerationResult')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder
    implements
        Builder<GDeleteImageGenerationTaskData_deleteImageGenerationResult,
            GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder> {
  _$GDeleteImageGenerationTaskData_deleteImageGenerationResult? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder() {
    GDeleteImageGenerationTaskData_deleteImageGenerationResult
        ._initializeBuilder(this);
  }

  GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GDeleteImageGenerationTaskData_deleteImageGenerationResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteImageGenerationTaskData_deleteImageGenerationResult;
  }

  @override
  void update(
      void Function(
              GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteImageGenerationTaskData_deleteImageGenerationResult build() =>
      _build();

  _$GDeleteImageGenerationTaskData_deleteImageGenerationResult _build() {
    final _$result = _$v ??
        new _$GDeleteImageGenerationTaskData_deleteImageGenerationResult._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GDeleteImageGenerationTaskData_deleteImageGenerationResult',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GDeleteImageGenerationTaskData_deleteImageGenerationResult',
                'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
