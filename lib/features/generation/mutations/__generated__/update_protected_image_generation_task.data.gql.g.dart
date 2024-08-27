// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_protected_image_generation_task.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateProtectedImageGenerationTaskData>
    _$gUpdateProtectedImageGenerationTaskDataSerializer =
    new _$GUpdateProtectedImageGenerationTaskDataSerializer();
Serializer<
        GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult>
    _$gUpdateProtectedImageGenerationTaskDataUpdateProtectedImageGenerationResultSerializer =
    new _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultSerializer();

class _$GUpdateProtectedImageGenerationTaskDataSerializer
    implements StructuredSerializer<GUpdateProtectedImageGenerationTaskData> {
  @override
  final Iterable<Type> types = const [
    GUpdateProtectedImageGenerationTaskData,
    _$GUpdateProtectedImageGenerationTaskData
  ];
  @override
  final String wireName = 'GUpdateProtectedImageGenerationTaskData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateProtectedImageGenerationTaskData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateProtectedImageGenerationResult',
      serializers.serialize(object.updateProtectedImageGenerationResult,
          specifiedType: const FullType(
              GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult)),
    ];

    return result;
  }

  @override
  GUpdateProtectedImageGenerationTaskData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateProtectedImageGenerationTaskDataBuilder();

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
        case 'updateProtectedImageGenerationResult':
          result.updateProtectedImageGenerationResult.replace(serializers
                  .deserialize(value,
                      specifiedType: const FullType(
                          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult))!
              as GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultSerializer
    implements
        StructuredSerializer<
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult> {
  @override
  final Iterable<Type> types = const [
    GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult,
    _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
  ];
  @override
  final String wireName =
      'GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isProtected;
    if (value != null) {
      result
        ..add('isProtected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder();

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
        case 'isProtected':
          result.isProtected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateProtectedImageGenerationTaskData
    extends GUpdateProtectedImageGenerationTaskData {
  @override
  final String G__typename;
  @override
  final GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
      updateProtectedImageGenerationResult;

  factory _$GUpdateProtectedImageGenerationTaskData(
          [void Function(GUpdateProtectedImageGenerationTaskDataBuilder)?
              updates]) =>
      (new GUpdateProtectedImageGenerationTaskDataBuilder()..update(updates))
          ._build();

  _$GUpdateProtectedImageGenerationTaskData._(
      {required this.G__typename,
      required this.updateProtectedImageGenerationResult})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateProtectedImageGenerationTaskData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        updateProtectedImageGenerationResult,
        r'GUpdateProtectedImageGenerationTaskData',
        'updateProtectedImageGenerationResult');
  }

  @override
  GUpdateProtectedImageGenerationTaskData rebuild(
          void Function(GUpdateProtectedImageGenerationTaskDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateProtectedImageGenerationTaskDataBuilder toBuilder() =>
      new GUpdateProtectedImageGenerationTaskDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateProtectedImageGenerationTaskData &&
        G__typename == other.G__typename &&
        updateProtectedImageGenerationResult ==
            other.updateProtectedImageGenerationResult;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateProtectedImageGenerationResult.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUpdateProtectedImageGenerationTaskData')
          ..add('G__typename', G__typename)
          ..add('updateProtectedImageGenerationResult',
              updateProtectedImageGenerationResult))
        .toString();
  }
}

class GUpdateProtectedImageGenerationTaskDataBuilder
    implements
        Builder<GUpdateProtectedImageGenerationTaskData,
            GUpdateProtectedImageGenerationTaskDataBuilder> {
  _$GUpdateProtectedImageGenerationTaskData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder?
      _updateProtectedImageGenerationResult;
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder
      get updateProtectedImageGenerationResult => _$this
              ._updateProtectedImageGenerationResult ??=
          new GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder();
  set updateProtectedImageGenerationResult(
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder?
              updateProtectedImageGenerationResult) =>
      _$this._updateProtectedImageGenerationResult =
          updateProtectedImageGenerationResult;

  GUpdateProtectedImageGenerationTaskDataBuilder() {
    GUpdateProtectedImageGenerationTaskData._initializeBuilder(this);
  }

  GUpdateProtectedImageGenerationTaskDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateProtectedImageGenerationResult =
          $v.updateProtectedImageGenerationResult.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateProtectedImageGenerationTaskData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateProtectedImageGenerationTaskData;
  }

  @override
  void update(
      void Function(GUpdateProtectedImageGenerationTaskDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateProtectedImageGenerationTaskData build() => _build();

  _$GUpdateProtectedImageGenerationTaskData _build() {
    _$GUpdateProtectedImageGenerationTaskData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateProtectedImageGenerationTaskData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GUpdateProtectedImageGenerationTaskData', 'G__typename'),
              updateProtectedImageGenerationResult:
                  updateProtectedImageGenerationResult.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateProtectedImageGenerationResult';
        updateProtectedImageGenerationResult.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateProtectedImageGenerationTaskData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
    extends GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool? isProtected;

  factory _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult(
          [void Function(
                  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder)?
              updates]) =>
      (new GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder()
            ..update(updates))
          ._build();

  _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult._(
      {required this.G__typename, required this.id, this.isProtected})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult',
        'id');
  }

  @override
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
      rebuild(
              void Function(
                      GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder
      toBuilder() =>
          new GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult &&
        G__typename == other.G__typename &&
        id == other.id &&
        isProtected == other.isProtected;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isProtected.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isProtected', isProtected))
        .toString();
  }
}

class GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder
    implements
        Builder<
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult,
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder> {
  _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isProtected;
  bool? get isProtected => _$this._isProtected;
  set isProtected(bool? isProtected) => _$this._isProtected = isProtected;

  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder() {
    GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
        ._initializeBuilder(this);
  }

  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isProtected = $v.isProtected;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult;
  }

  @override
  void update(
      void Function(
              GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
      build() => _build();

  _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
      _build() {
    final _$result = _$v ??
        new _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult',
                'id'),
            isProtected: isProtected);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
