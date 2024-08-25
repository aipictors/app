// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_image_generation_task.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateImageGenerationTaskVars>
    _$gCreateImageGenerationTaskVarsSerializer =
    new _$GCreateImageGenerationTaskVarsSerializer();

class _$GCreateImageGenerationTaskVarsSerializer
    implements StructuredSerializer<GCreateImageGenerationTaskVars> {
  @override
  final Iterable<Type> types = const [
    GCreateImageGenerationTaskVars,
    _$GCreateImageGenerationTaskVars
  ];
  @override
  final String wireName = 'GCreateImageGenerationTaskVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateImageGenerationTaskVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateImageGenerationTaskInput)),
    ];

    return result;
  }

  @override
  GCreateImageGenerationTaskVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateImageGenerationTaskVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i1.GCreateImageGenerationTaskInput))!
              as _i1.GCreateImageGenerationTaskInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateImageGenerationTaskVars extends GCreateImageGenerationTaskVars {
  @override
  final _i1.GCreateImageGenerationTaskInput input;

  factory _$GCreateImageGenerationTaskVars(
          [void Function(GCreateImageGenerationTaskVarsBuilder)? updates]) =>
      (new GCreateImageGenerationTaskVarsBuilder()..update(updates))._build();

  _$GCreateImageGenerationTaskVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateImageGenerationTaskVars', 'input');
  }

  @override
  GCreateImageGenerationTaskVars rebuild(
          void Function(GCreateImageGenerationTaskVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateImageGenerationTaskVarsBuilder toBuilder() =>
      new GCreateImageGenerationTaskVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateImageGenerationTaskVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateImageGenerationTaskVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateImageGenerationTaskVarsBuilder
    implements
        Builder<GCreateImageGenerationTaskVars,
            GCreateImageGenerationTaskVarsBuilder> {
  _$GCreateImageGenerationTaskVars? _$v;

  _i1.GCreateImageGenerationTaskInputBuilder? _input;
  _i1.GCreateImageGenerationTaskInputBuilder get input =>
      _$this._input ??= new _i1.GCreateImageGenerationTaskInputBuilder();
  set input(_i1.GCreateImageGenerationTaskInputBuilder? input) =>
      _$this._input = input;

  GCreateImageGenerationTaskVarsBuilder();

  GCreateImageGenerationTaskVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateImageGenerationTaskVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateImageGenerationTaskVars;
  }

  @override
  void update(void Function(GCreateImageGenerationTaskVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateImageGenerationTaskVars build() => _build();

  _$GCreateImageGenerationTaskVars _build() {
    _$GCreateImageGenerationTaskVars _$result;
    try {
      _$result =
          _$v ?? new _$GCreateImageGenerationTaskVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateImageGenerationTaskVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
