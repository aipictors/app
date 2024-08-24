// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_image_generation_task.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteImageGenerationTaskVars>
    _$gDeleteImageGenerationTaskVarsSerializer =
    new _$GDeleteImageGenerationTaskVarsSerializer();

class _$GDeleteImageGenerationTaskVarsSerializer
    implements StructuredSerializer<GDeleteImageGenerationTaskVars> {
  @override
  final Iterable<Type> types = const [
    GDeleteImageGenerationTaskVars,
    _$GDeleteImageGenerationTaskVars
  ];
  @override
  final String wireName = 'GDeleteImageGenerationTaskVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteImageGenerationTaskVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteImageGenerationResultInput)),
    ];

    return result;
  }

  @override
  GDeleteImageGenerationTaskVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteImageGenerationTaskVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i1.GDeleteImageGenerationResultInput))!
              as _i1.GDeleteImageGenerationResultInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteImageGenerationTaskVars extends GDeleteImageGenerationTaskVars {
  @override
  final _i1.GDeleteImageGenerationResultInput input;

  factory _$GDeleteImageGenerationTaskVars(
          [void Function(GDeleteImageGenerationTaskVarsBuilder)? updates]) =>
      (new GDeleteImageGenerationTaskVarsBuilder()..update(updates))._build();

  _$GDeleteImageGenerationTaskVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GDeleteImageGenerationTaskVars', 'input');
  }

  @override
  GDeleteImageGenerationTaskVars rebuild(
          void Function(GDeleteImageGenerationTaskVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteImageGenerationTaskVarsBuilder toBuilder() =>
      new GDeleteImageGenerationTaskVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteImageGenerationTaskVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GDeleteImageGenerationTaskVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteImageGenerationTaskVarsBuilder
    implements
        Builder<GDeleteImageGenerationTaskVars,
            GDeleteImageGenerationTaskVarsBuilder> {
  _$GDeleteImageGenerationTaskVars? _$v;

  _i1.GDeleteImageGenerationResultInputBuilder? _input;
  _i1.GDeleteImageGenerationResultInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteImageGenerationResultInputBuilder();
  set input(_i1.GDeleteImageGenerationResultInputBuilder? input) =>
      _$this._input = input;

  GDeleteImageGenerationTaskVarsBuilder();

  GDeleteImageGenerationTaskVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteImageGenerationTaskVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteImageGenerationTaskVars;
  }

  @override
  void update(void Function(GDeleteImageGenerationTaskVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteImageGenerationTaskVars build() => _build();

  _$GDeleteImageGenerationTaskVars _build() {
    _$GDeleteImageGenerationTaskVars _$result;
    try {
      _$result =
          _$v ?? new _$GDeleteImageGenerationTaskVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteImageGenerationTaskVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
