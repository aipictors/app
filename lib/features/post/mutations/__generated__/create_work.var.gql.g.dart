// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWorkVars> _$gCreateWorkVarsSerializer =
    new _$GCreateWorkVarsSerializer();

class _$GCreateWorkVarsSerializer
    implements StructuredSerializer<GCreateWorkVars> {
  @override
  final Iterable<Type> types = const [GCreateWorkVars, _$GCreateWorkVars];
  @override
  final String wireName = 'GCreateWorkVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateWorkInput)),
    ];

    return result;
  }

  @override
  GCreateWorkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateWorkInput))!
              as _i1.GCreateWorkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkVars extends GCreateWorkVars {
  @override
  final _i1.GCreateWorkInput input;

  factory _$GCreateWorkVars([void Function(GCreateWorkVarsBuilder)? updates]) =>
      (new GCreateWorkVarsBuilder()..update(updates))._build();

  _$GCreateWorkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GCreateWorkVars', 'input');
  }

  @override
  GCreateWorkVars rebuild(void Function(GCreateWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkVarsBuilder toBuilder() =>
      new GCreateWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateWorkVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateWorkVarsBuilder
    implements Builder<GCreateWorkVars, GCreateWorkVarsBuilder> {
  _$GCreateWorkVars? _$v;

  _i1.GCreateWorkInputBuilder? _input;
  _i1.GCreateWorkInputBuilder get input =>
      _$this._input ??= new _i1.GCreateWorkInputBuilder();
  set input(_i1.GCreateWorkInputBuilder? input) => _$this._input = input;

  GCreateWorkVarsBuilder();

  GCreateWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkVars;
  }

  @override
  void update(void Function(GCreateWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkVars build() => _build();

  _$GCreateWorkVars _build() {
    _$GCreateWorkVars _$result;
    try {
      _$result = _$v ?? new _$GCreateWorkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
