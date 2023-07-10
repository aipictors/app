// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_work_like.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWorkLikeVars> _$gCreateWorkLikeVarsSerializer =
    new _$GCreateWorkLikeVarsSerializer();

class _$GCreateWorkLikeVarsSerializer
    implements StructuredSerializer<GCreateWorkLikeVars> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkLikeVars,
    _$GCreateWorkLikeVars
  ];
  @override
  final String wireName = 'GCreateWorkLikeVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkLikeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateWorkLikeInput)),
    ];

    return result;
  }

  @override
  GCreateWorkLikeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkLikeVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateWorkLikeInput))!
              as _i1.GCreateWorkLikeInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkLikeVars extends GCreateWorkLikeVars {
  @override
  final _i1.GCreateWorkLikeInput input;

  factory _$GCreateWorkLikeVars(
          [void Function(GCreateWorkLikeVarsBuilder)? updates]) =>
      (new GCreateWorkLikeVarsBuilder()..update(updates))._build();

  _$GCreateWorkLikeVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateWorkLikeVars', 'input');
  }

  @override
  GCreateWorkLikeVars rebuild(
          void Function(GCreateWorkLikeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkLikeVarsBuilder toBuilder() =>
      new GCreateWorkLikeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkLikeVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateWorkLikeVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateWorkLikeVarsBuilder
    implements Builder<GCreateWorkLikeVars, GCreateWorkLikeVarsBuilder> {
  _$GCreateWorkLikeVars? _$v;

  _i1.GCreateWorkLikeInputBuilder? _input;
  _i1.GCreateWorkLikeInputBuilder get input =>
      _$this._input ??= new _i1.GCreateWorkLikeInputBuilder();
  set input(_i1.GCreateWorkLikeInputBuilder? input) => _$this._input = input;

  GCreateWorkLikeVarsBuilder();

  GCreateWorkLikeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkLikeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkLikeVars;
  }

  @override
  void update(void Function(GCreateWorkLikeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkLikeVars build() => _build();

  _$GCreateWorkLikeVars _build() {
    _$GCreateWorkLikeVars _$result;
    try {
      _$result = _$v ?? new _$GCreateWorkLikeVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkLikeVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
