// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteWorkVars> _$gDeleteWorkVarsSerializer =
    new _$GDeleteWorkVarsSerializer();

class _$GDeleteWorkVarsSerializer
    implements StructuredSerializer<GDeleteWorkVars> {
  @override
  final Iterable<Type> types = const [GDeleteWorkVars, _$GDeleteWorkVars];
  @override
  final String wireName = 'GDeleteWorkVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDeleteWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteWorkInput)),
    ];

    return result;
  }

  @override
  GDeleteWorkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDeleteWorkInput))!
              as _i1.GDeleteWorkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteWorkVars extends GDeleteWorkVars {
  @override
  final _i1.GDeleteWorkInput input;

  factory _$GDeleteWorkVars([void Function(GDeleteWorkVarsBuilder)? updates]) =>
      (new GDeleteWorkVarsBuilder()..update(updates))._build();

  _$GDeleteWorkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GDeleteWorkVars', 'input');
  }

  @override
  GDeleteWorkVars rebuild(void Function(GDeleteWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteWorkVarsBuilder toBuilder() =>
      new GDeleteWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteWorkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GDeleteWorkVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteWorkVarsBuilder
    implements Builder<GDeleteWorkVars, GDeleteWorkVarsBuilder> {
  _$GDeleteWorkVars? _$v;

  _i1.GDeleteWorkInputBuilder? _input;
  _i1.GDeleteWorkInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteWorkInputBuilder();
  set input(_i1.GDeleteWorkInputBuilder? input) => _$this._input = input;

  GDeleteWorkVarsBuilder();

  GDeleteWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteWorkVars;
  }

  @override
  void update(void Function(GDeleteWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteWorkVars build() => _build();

  _$GDeleteWorkVars _build() {
    _$GDeleteWorkVars _$result;
    try {
      _$result = _$v ?? new _$GDeleteWorkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteWorkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
