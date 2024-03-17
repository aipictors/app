// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_sticker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteUserStickerVars> _$gDeleteUserStickerVarsSerializer =
    new _$GDeleteUserStickerVarsSerializer();

class _$GDeleteUserStickerVarsSerializer
    implements StructuredSerializer<GDeleteUserStickerVars> {
  @override
  final Iterable<Type> types = const [
    GDeleteUserStickerVars,
    _$GDeleteUserStickerVars
  ];
  @override
  final String wireName = 'GDeleteUserStickerVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteUserStickerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteUserStickerInput)),
    ];

    return result;
  }

  @override
  GDeleteUserStickerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteUserStickerVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDeleteUserStickerInput))!
              as _i1.GDeleteUserStickerInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteUserStickerVars extends GDeleteUserStickerVars {
  @override
  final _i1.GDeleteUserStickerInput input;

  factory _$GDeleteUserStickerVars(
          [void Function(GDeleteUserStickerVarsBuilder)? updates]) =>
      (new GDeleteUserStickerVarsBuilder()..update(updates))._build();

  _$GDeleteUserStickerVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GDeleteUserStickerVars', 'input');
  }

  @override
  GDeleteUserStickerVars rebuild(
          void Function(GDeleteUserStickerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteUserStickerVarsBuilder toBuilder() =>
      new GDeleteUserStickerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteUserStickerVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GDeleteUserStickerVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteUserStickerVarsBuilder
    implements Builder<GDeleteUserStickerVars, GDeleteUserStickerVarsBuilder> {
  _$GDeleteUserStickerVars? _$v;

  _i1.GDeleteUserStickerInputBuilder? _input;
  _i1.GDeleteUserStickerInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteUserStickerInputBuilder();
  set input(_i1.GDeleteUserStickerInputBuilder? input) => _$this._input = input;

  GDeleteUserStickerVarsBuilder();

  GDeleteUserStickerVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteUserStickerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteUserStickerVars;
  }

  @override
  void update(void Function(GDeleteUserStickerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteUserStickerVars build() => _build();

  _$GDeleteUserStickerVars _build() {
    _$GDeleteUserStickerVars _$result;
    try {
      _$result = _$v ?? new _$GDeleteUserStickerVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteUserStickerVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
