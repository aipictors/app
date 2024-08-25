// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_login.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateAccountLoginVars> _$gUpdateAccountLoginVarsSerializer =
    new _$GUpdateAccountLoginVarsSerializer();

class _$GUpdateAccountLoginVarsSerializer
    implements StructuredSerializer<GUpdateAccountLoginVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountLoginVars,
    _$GUpdateAccountLoginVars
  ];
  @override
  final String wireName = 'GUpdateAccountLoginVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateAccountLoginVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GUpdateAccountLoginInput)),
    ];

    return result;
  }

  @override
  GUpdateAccountLoginVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateAccountLoginVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUpdateAccountLoginInput))!
              as _i1.GUpdateAccountLoginInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateAccountLoginVars extends GUpdateAccountLoginVars {
  @override
  final _i1.GUpdateAccountLoginInput input;

  factory _$GUpdateAccountLoginVars(
          [void Function(GUpdateAccountLoginVarsBuilder)? updates]) =>
      (new GUpdateAccountLoginVarsBuilder()..update(updates))._build();

  _$GUpdateAccountLoginVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GUpdateAccountLoginVars', 'input');
  }

  @override
  GUpdateAccountLoginVars rebuild(
          void Function(GUpdateAccountLoginVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountLoginVarsBuilder toBuilder() =>
      new GUpdateAccountLoginVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountLoginVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GUpdateAccountLoginVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateAccountLoginVarsBuilder
    implements
        Builder<GUpdateAccountLoginVars, GUpdateAccountLoginVarsBuilder> {
  _$GUpdateAccountLoginVars? _$v;

  _i1.GUpdateAccountLoginInputBuilder? _input;
  _i1.GUpdateAccountLoginInputBuilder get input =>
      _$this._input ??= new _i1.GUpdateAccountLoginInputBuilder();
  set input(_i1.GUpdateAccountLoginInputBuilder? input) =>
      _$this._input = input;

  GUpdateAccountLoginVarsBuilder();

  GUpdateAccountLoginVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountLoginVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountLoginVars;
  }

  @override
  void update(void Function(GUpdateAccountLoginVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountLoginVars build() => _build();

  _$GUpdateAccountLoginVars _build() {
    _$GUpdateAccountLoginVars _$result;
    try {
      _$result = _$v ?? new _$GUpdateAccountLoginVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateAccountLoginVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
