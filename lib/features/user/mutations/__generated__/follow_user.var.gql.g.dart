// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_user.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFollowUserVars> _$gFollowUserVarsSerializer =
    new _$GFollowUserVarsSerializer();

class _$GFollowUserVarsSerializer
    implements StructuredSerializer<GFollowUserVars> {
  @override
  final Iterable<Type> types = const [GFollowUserVars, _$GFollowUserVars];
  @override
  final String wireName = 'GFollowUserVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFollowUserVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GFollowUserInput)),
    ];

    return result;
  }

  @override
  GFollowUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowUserVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GFollowUserInput))!
              as _i1.GFollowUserInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowUserVars extends GFollowUserVars {
  @override
  final _i1.GFollowUserInput input;

  factory _$GFollowUserVars([void Function(GFollowUserVarsBuilder)? updates]) =>
      (new GFollowUserVarsBuilder()..update(updates))._build();

  _$GFollowUserVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GFollowUserVars', 'input');
  }

  @override
  GFollowUserVars rebuild(void Function(GFollowUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowUserVarsBuilder toBuilder() =>
      new GFollowUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowUserVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GFollowUserVars')
          ..add('input', input))
        .toString();
  }
}

class GFollowUserVarsBuilder
    implements Builder<GFollowUserVars, GFollowUserVarsBuilder> {
  _$GFollowUserVars? _$v;

  _i1.GFollowUserInputBuilder? _input;
  _i1.GFollowUserInputBuilder get input =>
      _$this._input ??= new _i1.GFollowUserInputBuilder();
  set input(_i1.GFollowUserInputBuilder? input) => _$this._input = input;

  GFollowUserVarsBuilder();

  GFollowUserVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFollowUserVars;
  }

  @override
  void update(void Function(GFollowUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFollowUserVars build() => _build();

  _$GFollowUserVars _build() {
    _$GFollowUserVars _$result;
    try {
      _$result = _$v ?? new _$GFollowUserVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFollowUserVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
