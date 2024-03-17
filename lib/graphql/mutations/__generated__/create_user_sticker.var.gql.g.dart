// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_sticker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateUserStickerVars> _$gCreateUserStickerVarsSerializer =
    new _$GCreateUserStickerVarsSerializer();

class _$GCreateUserStickerVarsSerializer
    implements StructuredSerializer<GCreateUserStickerVars> {
  @override
  final Iterable<Type> types = const [
    GCreateUserStickerVars,
    _$GCreateUserStickerVars
  ];
  @override
  final String wireName = 'GCreateUserStickerVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateUserStickerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateStickerInput)),
    ];

    return result;
  }

  @override
  GCreateUserStickerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserStickerVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateStickerInput))!
              as _i1.GCreateStickerInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateUserStickerVars extends GCreateUserStickerVars {
  @override
  final _i1.GCreateStickerInput input;

  factory _$GCreateUserStickerVars(
          [void Function(GCreateUserStickerVarsBuilder)? updates]) =>
      (new GCreateUserStickerVarsBuilder()..update(updates))._build();

  _$GCreateUserStickerVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateUserStickerVars', 'input');
  }

  @override
  GCreateUserStickerVars rebuild(
          void Function(GCreateUserStickerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserStickerVarsBuilder toBuilder() =>
      new GCreateUserStickerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserStickerVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateUserStickerVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateUserStickerVarsBuilder
    implements Builder<GCreateUserStickerVars, GCreateUserStickerVarsBuilder> {
  _$GCreateUserStickerVars? _$v;

  _i1.GCreateStickerInputBuilder? _input;
  _i1.GCreateStickerInputBuilder get input =>
      _$this._input ??= new _i1.GCreateStickerInputBuilder();
  set input(_i1.GCreateStickerInputBuilder? input) => _$this._input = input;

  GCreateUserStickerVarsBuilder();

  GCreateUserStickerVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserStickerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserStickerVars;
  }

  @override
  void update(void Function(GCreateUserStickerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserStickerVars build() => _build();

  _$GCreateUserStickerVars _build() {
    _$GCreateUserStickerVars _$result;
    try {
      _$result = _$v ?? new _$GCreateUserStickerVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateUserStickerVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
