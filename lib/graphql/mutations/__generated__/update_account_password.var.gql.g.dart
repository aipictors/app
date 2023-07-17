// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_password.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateAccountPasswordVars> _$gUpdateAccountPasswordVarsSerializer =
    new _$GUpdateAccountPasswordVarsSerializer();

class _$GUpdateAccountPasswordVarsSerializer
    implements StructuredSerializer<GUpdateAccountPasswordVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountPasswordVars,
    _$GUpdateAccountPasswordVars
  ];
  @override
  final String wireName = 'GUpdateAccountPasswordVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateAccountPasswordVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GUpdateAccountPasswordInput)),
    ];

    return result;
  }

  @override
  GUpdateAccountPasswordVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateAccountPasswordVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i1.GUpdateAccountPasswordInput))!
              as _i1.GUpdateAccountPasswordInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateAccountPasswordVars extends GUpdateAccountPasswordVars {
  @override
  final _i1.GUpdateAccountPasswordInput input;

  factory _$GUpdateAccountPasswordVars(
          [void Function(GUpdateAccountPasswordVarsBuilder)? updates]) =>
      (new GUpdateAccountPasswordVarsBuilder()..update(updates))._build();

  _$GUpdateAccountPasswordVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GUpdateAccountPasswordVars', 'input');
  }

  @override
  GUpdateAccountPasswordVars rebuild(
          void Function(GUpdateAccountPasswordVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountPasswordVarsBuilder toBuilder() =>
      new GUpdateAccountPasswordVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountPasswordVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GUpdateAccountPasswordVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateAccountPasswordVarsBuilder
    implements
        Builder<GUpdateAccountPasswordVars, GUpdateAccountPasswordVarsBuilder> {
  _$GUpdateAccountPasswordVars? _$v;

  _i1.GUpdateAccountPasswordInputBuilder? _input;
  _i1.GUpdateAccountPasswordInputBuilder get input =>
      _$this._input ??= new _i1.GUpdateAccountPasswordInputBuilder();
  set input(_i1.GUpdateAccountPasswordInputBuilder? input) =>
      _$this._input = input;

  GUpdateAccountPasswordVarsBuilder();

  GUpdateAccountPasswordVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountPasswordVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountPasswordVars;
  }

  @override
  void update(void Function(GUpdateAccountPasswordVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountPasswordVars build() => _build();

  _$GUpdateAccountPasswordVars _build() {
    _$GUpdateAccountPasswordVars _$result;
    try {
      _$result =
          _$v ?? new _$GUpdateAccountPasswordVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateAccountPasswordVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
