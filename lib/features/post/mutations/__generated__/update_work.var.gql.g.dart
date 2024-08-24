// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateWorkVars> _$gUpdateWorkVarsSerializer =
    new _$GUpdateWorkVarsSerializer();

class _$GUpdateWorkVarsSerializer
    implements StructuredSerializer<GUpdateWorkVars> {
  @override
  final Iterable<Type> types = const [GUpdateWorkVars, _$GUpdateWorkVars];
  @override
  final String wireName = 'GUpdateWorkVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUpdateWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GUpdateWorkInput)),
    ];

    return result;
  }

  @override
  GUpdateWorkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUpdateWorkInput))!
              as _i1.GUpdateWorkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateWorkVars extends GUpdateWorkVars {
  @override
  final _i1.GUpdateWorkInput input;

  factory _$GUpdateWorkVars([void Function(GUpdateWorkVarsBuilder)? updates]) =>
      (new GUpdateWorkVarsBuilder()..update(updates))._build();

  _$GUpdateWorkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GUpdateWorkVars', 'input');
  }

  @override
  GUpdateWorkVars rebuild(void Function(GUpdateWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateWorkVarsBuilder toBuilder() =>
      new GUpdateWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateWorkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GUpdateWorkVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateWorkVarsBuilder
    implements Builder<GUpdateWorkVars, GUpdateWorkVarsBuilder> {
  _$GUpdateWorkVars? _$v;

  _i1.GUpdateWorkInputBuilder? _input;
  _i1.GUpdateWorkInputBuilder get input =>
      _$this._input ??= new _i1.GUpdateWorkInputBuilder();
  set input(_i1.GUpdateWorkInputBuilder? input) => _$this._input = input;

  GUpdateWorkVarsBuilder();

  GUpdateWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateWorkVars;
  }

  @override
  void update(void Function(GUpdateWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateWorkVars build() => _build();

  _$GUpdateWorkVars _build() {
    _$GUpdateWorkVars _$result;
    try {
      _$result = _$v ?? new _$GUpdateWorkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateWorkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
