// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAccountVars> _$gCreateAccountVarsSerializer =
    new _$GCreateAccountVarsSerializer();

class _$GCreateAccountVarsSerializer
    implements StructuredSerializer<GCreateAccountVars> {
  @override
  final Iterable<Type> types = const [GCreateAccountVars, _$GCreateAccountVars];
  @override
  final String wireName = 'GCreateAccountVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAccountVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateAccountInput)),
    ];

    return result;
  }

  @override
  GCreateAccountVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAccountVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateAccountInput))!
              as _i1.GCreateAccountInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAccountVars extends GCreateAccountVars {
  @override
  final _i1.GCreateAccountInput input;

  factory _$GCreateAccountVars(
          [void Function(GCreateAccountVarsBuilder)? updates]) =>
      (new GCreateAccountVarsBuilder()..update(updates))._build();

  _$GCreateAccountVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateAccountVars', 'input');
  }

  @override
  GCreateAccountVars rebuild(
          void Function(GCreateAccountVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAccountVarsBuilder toBuilder() =>
      new GCreateAccountVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAccountVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateAccountVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateAccountVarsBuilder
    implements Builder<GCreateAccountVars, GCreateAccountVarsBuilder> {
  _$GCreateAccountVars? _$v;

  _i1.GCreateAccountInputBuilder? _input;
  _i1.GCreateAccountInputBuilder get input =>
      _$this._input ??= new _i1.GCreateAccountInputBuilder();
  set input(_i1.GCreateAccountInputBuilder? input) => _$this._input = input;

  GCreateAccountVarsBuilder();

  GCreateAccountVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAccountVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAccountVars;
  }

  @override
  void update(void Function(GCreateAccountVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAccountVars build() => _build();

  _$GCreateAccountVars _build() {
    _$GCreateAccountVars _$result;
    try {
      _$result = _$v ?? new _$GCreateAccountVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateAccountVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
