// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateUserProfileVars> _$gUpdateUserProfileVarsSerializer =
    new _$GUpdateUserProfileVarsSerializer();

class _$GUpdateUserProfileVarsSerializer
    implements StructuredSerializer<GUpdateUserProfileVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileVars,
    _$GUpdateUserProfileVars
  ];
  @override
  final String wireName = 'GUpdateUserProfileVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserProfileVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GUpdateUserProfileInput)),
    ];

    return result;
  }

  @override
  GUpdateUserProfileVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserProfileVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUpdateUserProfileInput))!
              as _i1.GUpdateUserProfileInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserProfileVars extends GUpdateUserProfileVars {
  @override
  final _i1.GUpdateUserProfileInput input;

  factory _$GUpdateUserProfileVars(
          [void Function(GUpdateUserProfileVarsBuilder)? updates]) =>
      (new GUpdateUserProfileVarsBuilder()..update(updates))._build();

  _$GUpdateUserProfileVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GUpdateUserProfileVars', 'input');
  }

  @override
  GUpdateUserProfileVars rebuild(
          void Function(GUpdateUserProfileVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileVarsBuilder toBuilder() =>
      new GUpdateUserProfileVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserProfileVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GUpdateUserProfileVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateUserProfileVarsBuilder
    implements Builder<GUpdateUserProfileVars, GUpdateUserProfileVarsBuilder> {
  _$GUpdateUserProfileVars? _$v;

  _i1.GUpdateUserProfileInputBuilder? _input;
  _i1.GUpdateUserProfileInputBuilder get input =>
      _$this._input ??= new _i1.GUpdateUserProfileInputBuilder();
  set input(_i1.GUpdateUserProfileInputBuilder? input) => _$this._input = input;

  GUpdateUserProfileVarsBuilder();

  GUpdateUserProfileVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserProfileVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserProfileVars;
  }

  @override
  void update(void Function(GUpdateUserProfileVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserProfileVars build() => _build();

  _$GUpdateUserProfileVars _build() {
    _$GUpdateUserProfileVars _$result;
    try {
      _$result = _$v ?? new _$GUpdateUserProfileVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateUserProfileVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
