// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_rating_image_generation_task.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateRatingImageGenerationTaskData>
    _$gUpdateRatingImageGenerationTaskDataSerializer =
    new _$GUpdateRatingImageGenerationTaskDataSerializer();
Serializer<
        GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult>
    _$gUpdateRatingImageGenerationTaskDataUpdateRatingImageGenerationResultSerializer =
    new _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultSerializer();

class _$GUpdateRatingImageGenerationTaskDataSerializer
    implements StructuredSerializer<GUpdateRatingImageGenerationTaskData> {
  @override
  final Iterable<Type> types = const [
    GUpdateRatingImageGenerationTaskData,
    _$GUpdateRatingImageGenerationTaskData
  ];
  @override
  final String wireName = 'GUpdateRatingImageGenerationTaskData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateRatingImageGenerationTaskData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateRatingImageGenerationResult',
      serializers.serialize(object.updateRatingImageGenerationResult,
          specifiedType: const FullType(
              GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult)),
    ];

    return result;
  }

  @override
  GUpdateRatingImageGenerationTaskData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateRatingImageGenerationTaskDataBuilder();

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
        case 'updateRatingImageGenerationResult':
          result.updateRatingImageGenerationResult.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult))!
              as GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultSerializer
    implements
        StructuredSerializer<
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult> {
  @override
  final Iterable<Type> types = const [
    GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult,
    _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
  ];
  @override
  final String wireName =
      'GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
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
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder();

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
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateRatingImageGenerationTaskData
    extends GUpdateRatingImageGenerationTaskData {
  @override
  final String G__typename;
  @override
  final GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
      updateRatingImageGenerationResult;

  factory _$GUpdateRatingImageGenerationTaskData(
          [void Function(GUpdateRatingImageGenerationTaskDataBuilder)?
              updates]) =>
      (new GUpdateRatingImageGenerationTaskDataBuilder()..update(updates))
          ._build();

  _$GUpdateRatingImageGenerationTaskData._(
      {required this.G__typename,
      required this.updateRatingImageGenerationResult})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateRatingImageGenerationTaskData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        updateRatingImageGenerationResult,
        r'GUpdateRatingImageGenerationTaskData',
        'updateRatingImageGenerationResult');
  }

  @override
  GUpdateRatingImageGenerationTaskData rebuild(
          void Function(GUpdateRatingImageGenerationTaskDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateRatingImageGenerationTaskDataBuilder toBuilder() =>
      new GUpdateRatingImageGenerationTaskDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateRatingImageGenerationTaskData &&
        G__typename == other.G__typename &&
        updateRatingImageGenerationResult ==
            other.updateRatingImageGenerationResult;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateRatingImageGenerationResult.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateRatingImageGenerationTaskData')
          ..add('G__typename', G__typename)
          ..add('updateRatingImageGenerationResult',
              updateRatingImageGenerationResult))
        .toString();
  }
}

class GUpdateRatingImageGenerationTaskDataBuilder
    implements
        Builder<GUpdateRatingImageGenerationTaskData,
            GUpdateRatingImageGenerationTaskDataBuilder> {
  _$GUpdateRatingImageGenerationTaskData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder?
      _updateRatingImageGenerationResult;
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder
      get updateRatingImageGenerationResult => _$this
              ._updateRatingImageGenerationResult ??=
          new GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder();
  set updateRatingImageGenerationResult(
          GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder?
              updateRatingImageGenerationResult) =>
      _$this._updateRatingImageGenerationResult =
          updateRatingImageGenerationResult;

  GUpdateRatingImageGenerationTaskDataBuilder() {
    GUpdateRatingImageGenerationTaskData._initializeBuilder(this);
  }

  GUpdateRatingImageGenerationTaskDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateRatingImageGenerationResult =
          $v.updateRatingImageGenerationResult.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateRatingImageGenerationTaskData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateRatingImageGenerationTaskData;
  }

  @override
  void update(
      void Function(GUpdateRatingImageGenerationTaskDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateRatingImageGenerationTaskData build() => _build();

  _$GUpdateRatingImageGenerationTaskData _build() {
    _$GUpdateRatingImageGenerationTaskData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateRatingImageGenerationTaskData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GUpdateRatingImageGenerationTaskData', 'G__typename'),
              updateRatingImageGenerationResult:
                  updateRatingImageGenerationResult.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateRatingImageGenerationResult';
        updateRatingImageGenerationResult.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateRatingImageGenerationTaskData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
    extends GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int? rating;

  factory _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult(
          [void Function(
                  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder)?
              updates]) =>
      (new GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder()
            ..update(updates))
          ._build();

  _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult._(
      {required this.G__typename, required this.id, this.rating})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult',
        'id');
  }

  @override
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult rebuild(
          void Function(
                  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder
      toBuilder() =>
          new GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult &&
        G__typename == other.G__typename &&
        id == other.id &&
        rating == other.rating;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('rating', rating))
        .toString();
  }
}

class GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder
    implements
        Builder<
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult,
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder> {
  _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder() {
    GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
        ._initializeBuilder(this);
  }

  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _rating = $v.rating;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult;
  }

  @override
  void update(
      void Function(
              GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
      build() => _build();

  _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
      _build() {
    final _$result = _$v ??
        new _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult',
                'id'),
            rating: rating);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
