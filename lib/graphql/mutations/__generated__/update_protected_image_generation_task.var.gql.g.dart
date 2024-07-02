// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_protected_image_generation_task.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateProtectedImageGenerationTaskVars>
    _$gUpdateProtectedImageGenerationTaskVarsSerializer =
    new _$GUpdateProtectedImageGenerationTaskVarsSerializer();

class _$GUpdateProtectedImageGenerationTaskVarsSerializer
    implements StructuredSerializer<GUpdateProtectedImageGenerationTaskVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateProtectedImageGenerationTaskVars,
    _$GUpdateProtectedImageGenerationTaskVars
  ];
  @override
  final String wireName = 'GUpdateProtectedImageGenerationTaskVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateProtectedImageGenerationTaskVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType:
              const FullType(_i1.GUpdateProtectedImageGenerationResultInput)),
    ];

    return result;
  }

  @override
  GUpdateProtectedImageGenerationTaskVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateProtectedImageGenerationTaskVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i1.GUpdateProtectedImageGenerationResultInput))!
              as _i1.GUpdateProtectedImageGenerationResultInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateProtectedImageGenerationTaskVars
    extends GUpdateProtectedImageGenerationTaskVars {
  @override
  final _i1.GUpdateProtectedImageGenerationResultInput input;

  factory _$GUpdateProtectedImageGenerationTaskVars(
          [void Function(GUpdateProtectedImageGenerationTaskVarsBuilder)?
              updates]) =>
      (new GUpdateProtectedImageGenerationTaskVarsBuilder()..update(updates))
          ._build();

  _$GUpdateProtectedImageGenerationTaskVars._({required this.input})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GUpdateProtectedImageGenerationTaskVars', 'input');
  }

  @override
  GUpdateProtectedImageGenerationTaskVars rebuild(
          void Function(GUpdateProtectedImageGenerationTaskVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateProtectedImageGenerationTaskVarsBuilder toBuilder() =>
      new GUpdateProtectedImageGenerationTaskVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateProtectedImageGenerationTaskVars &&
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
    return (newBuiltValueToStringHelper(
            r'GUpdateProtectedImageGenerationTaskVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateProtectedImageGenerationTaskVarsBuilder
    implements
        Builder<GUpdateProtectedImageGenerationTaskVars,
            GUpdateProtectedImageGenerationTaskVarsBuilder> {
  _$GUpdateProtectedImageGenerationTaskVars? _$v;

  _i1.GUpdateProtectedImageGenerationResultInputBuilder? _input;
  _i1.GUpdateProtectedImageGenerationResultInputBuilder get input =>
      _$this._input ??=
          new _i1.GUpdateProtectedImageGenerationResultInputBuilder();
  set input(_i1.GUpdateProtectedImageGenerationResultInputBuilder? input) =>
      _$this._input = input;

  GUpdateProtectedImageGenerationTaskVarsBuilder();

  GUpdateProtectedImageGenerationTaskVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateProtectedImageGenerationTaskVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateProtectedImageGenerationTaskVars;
  }

  @override
  void update(
      void Function(GUpdateProtectedImageGenerationTaskVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateProtectedImageGenerationTaskVars build() => _build();

  _$GUpdateProtectedImageGenerationTaskVars _build() {
    _$GUpdateProtectedImageGenerationTaskVars _$result;
    try {
      _$result = _$v ??
          new _$GUpdateProtectedImageGenerationTaskVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateProtectedImageGenerationTaskVars',
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
