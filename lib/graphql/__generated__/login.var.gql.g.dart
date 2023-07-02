// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLoginWithPasswordVars> _$gLoginWithPasswordVarsSerializer =
    new _$GLoginWithPasswordVarsSerializer();

class _$GLoginWithPasswordVarsSerializer
    implements StructuredSerializer<GLoginWithPasswordVars> {
  @override
  final Iterable<Type> types = const [
    GLoginWithPasswordVars,
    _$GLoginWithPasswordVars
  ];
  @override
  final String wireName = 'GLoginWithPasswordVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginWithPasswordVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GLoginWithPasswordInput)),
    ];

    return result;
  }

  @override
  GLoginWithPasswordVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginWithPasswordVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GLoginWithPasswordInput))!
              as _i1.GLoginWithPasswordInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoginWithPasswordVars extends GLoginWithPasswordVars {
  @override
  final _i1.GLoginWithPasswordInput input;

  factory _$GLoginWithPasswordVars(
          [void Function(GLoginWithPasswordVarsBuilder)? updates]) =>
      (new GLoginWithPasswordVarsBuilder()..update(updates))._build();

  _$GLoginWithPasswordVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GLoginWithPasswordVars', 'input');
  }

  @override
  GLoginWithPasswordVars rebuild(
          void Function(GLoginWithPasswordVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginWithPasswordVarsBuilder toBuilder() =>
      new GLoginWithPasswordVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginWithPasswordVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GLoginWithPasswordVars')
          ..add('input', input))
        .toString();
  }
}

class GLoginWithPasswordVarsBuilder
    implements Builder<GLoginWithPasswordVars, GLoginWithPasswordVarsBuilder> {
  _$GLoginWithPasswordVars? _$v;

  _i1.GLoginWithPasswordInputBuilder? _input;
  _i1.GLoginWithPasswordInputBuilder get input =>
      _$this._input ??= new _i1.GLoginWithPasswordInputBuilder();
  set input(_i1.GLoginWithPasswordInputBuilder? input) => _$this._input = input;

  GLoginWithPasswordVarsBuilder();

  GLoginWithPasswordVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginWithPasswordVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginWithPasswordVars;
  }

  @override
  void update(void Function(GLoginWithPasswordVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLoginWithPasswordVars build() => _build();

  _$GLoginWithPasswordVars _build() {
    _$GLoginWithPasswordVars _$result;
    try {
      _$result = _$v ?? new _$GLoginWithPasswordVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GLoginWithPasswordVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
