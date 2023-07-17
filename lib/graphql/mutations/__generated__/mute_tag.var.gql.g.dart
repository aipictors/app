// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_tag.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMuteTagVars> _$gMuteTagVarsSerializer =
    new _$GMuteTagVarsSerializer();

class _$GMuteTagVarsSerializer implements StructuredSerializer<GMuteTagVars> {
  @override
  final Iterable<Type> types = const [GMuteTagVars, _$GMuteTagVars];
  @override
  final String wireName = 'GMuteTagVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMuteTagVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GMuteTagInput)),
    ];

    return result;
  }

  @override
  GMuteTagVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteTagVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GMuteTagInput))!
              as _i1.GMuteTagInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteTagVars extends GMuteTagVars {
  @override
  final _i1.GMuteTagInput input;

  factory _$GMuteTagVars([void Function(GMuteTagVarsBuilder)? updates]) =>
      (new GMuteTagVarsBuilder()..update(updates))._build();

  _$GMuteTagVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GMuteTagVars', 'input');
  }

  @override
  GMuteTagVars rebuild(void Function(GMuteTagVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteTagVarsBuilder toBuilder() => new GMuteTagVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteTagVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GMuteTagVars')..add('input', input))
        .toString();
  }
}

class GMuteTagVarsBuilder
    implements Builder<GMuteTagVars, GMuteTagVarsBuilder> {
  _$GMuteTagVars? _$v;

  _i1.GMuteTagInputBuilder? _input;
  _i1.GMuteTagInputBuilder get input =>
      _$this._input ??= new _i1.GMuteTagInputBuilder();
  set input(_i1.GMuteTagInputBuilder? input) => _$this._input = input;

  GMuteTagVarsBuilder();

  GMuteTagVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteTagVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteTagVars;
  }

  @override
  void update(void Function(GMuteTagVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteTagVars build() => _build();

  _$GMuteTagVars _build() {
    _$GMuteTagVars _$result;
    try {
      _$result = _$v ?? new _$GMuteTagVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMuteTagVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
