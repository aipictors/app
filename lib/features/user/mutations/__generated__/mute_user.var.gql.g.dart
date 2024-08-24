// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_user.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMuteUserVars> _$gMuteUserVarsSerializer =
    new _$GMuteUserVarsSerializer();

class _$GMuteUserVarsSerializer implements StructuredSerializer<GMuteUserVars> {
  @override
  final Iterable<Type> types = const [GMuteUserVars, _$GMuteUserVars];
  @override
  final String wireName = 'GMuteUserVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMuteUserVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GMuteUserInput)),
    ];

    return result;
  }

  @override
  GMuteUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteUserVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GMuteUserInput))!
              as _i1.GMuteUserInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteUserVars extends GMuteUserVars {
  @override
  final _i1.GMuteUserInput input;

  factory _$GMuteUserVars([void Function(GMuteUserVarsBuilder)? updates]) =>
      (new GMuteUserVarsBuilder()..update(updates))._build();

  _$GMuteUserVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GMuteUserVars', 'input');
  }

  @override
  GMuteUserVars rebuild(void Function(GMuteUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteUserVarsBuilder toBuilder() => new GMuteUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteUserVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GMuteUserVars')..add('input', input))
        .toString();
  }
}

class GMuteUserVarsBuilder
    implements Builder<GMuteUserVars, GMuteUserVarsBuilder> {
  _$GMuteUserVars? _$v;

  _i1.GMuteUserInputBuilder? _input;
  _i1.GMuteUserInputBuilder get input =>
      _$this._input ??= new _i1.GMuteUserInputBuilder();
  set input(_i1.GMuteUserInputBuilder? input) => _$this._input = input;

  GMuteUserVarsBuilder();

  GMuteUserVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteUserVars;
  }

  @override
  void update(void Function(GMuteUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteUserVars build() => _build();

  _$GMuteUserVars _build() {
    _$GMuteUserVars _$result;
    try {
      _$result = _$v ?? new _$GMuteUserVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMuteUserVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
