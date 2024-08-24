// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_rating_image_generation_task.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateRatingImageGenerationTaskVars>
    _$gUpdateRatingImageGenerationTaskVarsSerializer =
    new _$GUpdateRatingImageGenerationTaskVarsSerializer();

class _$GUpdateRatingImageGenerationTaskVarsSerializer
    implements StructuredSerializer<GUpdateRatingImageGenerationTaskVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateRatingImageGenerationTaskVars,
    _$GUpdateRatingImageGenerationTaskVars
  ];
  @override
  final String wireName = 'GUpdateRatingImageGenerationTaskVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateRatingImageGenerationTaskVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType:
              const FullType(_i1.GUpdateRatingImageGenerationResultInput)),
    ];

    return result;
  }

  @override
  GUpdateRatingImageGenerationTaskVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateRatingImageGenerationTaskVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i1.GUpdateRatingImageGenerationResultInput))!
              as _i1.GUpdateRatingImageGenerationResultInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateRatingImageGenerationTaskVars
    extends GUpdateRatingImageGenerationTaskVars {
  @override
  final _i1.GUpdateRatingImageGenerationResultInput input;

  factory _$GUpdateRatingImageGenerationTaskVars(
          [void Function(GUpdateRatingImageGenerationTaskVarsBuilder)?
              updates]) =>
      (new GUpdateRatingImageGenerationTaskVarsBuilder()..update(updates))
          ._build();

  _$GUpdateRatingImageGenerationTaskVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GUpdateRatingImageGenerationTaskVars', 'input');
  }

  @override
  GUpdateRatingImageGenerationTaskVars rebuild(
          void Function(GUpdateRatingImageGenerationTaskVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateRatingImageGenerationTaskVarsBuilder toBuilder() =>
      new GUpdateRatingImageGenerationTaskVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateRatingImageGenerationTaskVars &&
        input == other.input;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, input.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateRatingImageGenerationTaskVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateRatingImageGenerationTaskVarsBuilder
    implements
        Builder<GUpdateRatingImageGenerationTaskVars,
            GUpdateRatingImageGenerationTaskVarsBuilder> {
  _$GUpdateRatingImageGenerationTaskVars? _$v;

  _i1.GUpdateRatingImageGenerationResultInputBuilder? _input;
  _i1.GUpdateRatingImageGenerationResultInputBuilder get input =>
      _$this._input ??=
          new _i1.GUpdateRatingImageGenerationResultInputBuilder();
  set input(_i1.GUpdateRatingImageGenerationResultInputBuilder? input) =>
      _$this._input = input;

  GUpdateRatingImageGenerationTaskVarsBuilder();

  GUpdateRatingImageGenerationTaskVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateRatingImageGenerationTaskVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateRatingImageGenerationTaskVars;
  }

  @override
  void update(
      void Function(GUpdateRatingImageGenerationTaskVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateRatingImageGenerationTaskVars build() => _build();

  _$GUpdateRatingImageGenerationTaskVars _build() {
    _$GUpdateRatingImageGenerationTaskVars _$result;
    try {
      _$result = _$v ??
          new _$GUpdateRatingImageGenerationTaskVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateRatingImageGenerationTaskVars',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
