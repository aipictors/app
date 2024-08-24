// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_sticker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateStickerVars> _$gCreateStickerVarsSerializer =
    new _$GCreateStickerVarsSerializer();

class _$GCreateStickerVarsSerializer
    implements StructuredSerializer<GCreateStickerVars> {
  @override
  final Iterable<Type> types = const [GCreateStickerVars, _$GCreateStickerVars];
  @override
  final String wireName = 'GCreateStickerVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateStickerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateStickerInput)),
    ];

    return result;
  }

  @override
  GCreateStickerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateStickerVarsBuilder();

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

class _$GCreateStickerVars extends GCreateStickerVars {
  @override
  final _i1.GCreateStickerInput input;

  factory _$GCreateStickerVars(
          [void Function(GCreateStickerVarsBuilder)? updates]) =>
      (new GCreateStickerVarsBuilder()..update(updates))._build();

  _$GCreateStickerVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateStickerVars', 'input');
  }

  @override
  GCreateStickerVars rebuild(
          void Function(GCreateStickerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateStickerVarsBuilder toBuilder() =>
      new GCreateStickerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateStickerVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateStickerVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateStickerVarsBuilder
    implements Builder<GCreateStickerVars, GCreateStickerVarsBuilder> {
  _$GCreateStickerVars? _$v;

  _i1.GCreateStickerInputBuilder? _input;
  _i1.GCreateStickerInputBuilder get input =>
      _$this._input ??= new _i1.GCreateStickerInputBuilder();
  set input(_i1.GCreateStickerInputBuilder? input) => _$this._input = input;

  GCreateStickerVarsBuilder();

  GCreateStickerVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateStickerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateStickerVars;
  }

  @override
  void update(void Function(GCreateStickerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateStickerVars build() => _build();

  _$GCreateStickerVars _build() {
    _$GCreateStickerVars _$result;
    try {
      _$result = _$v ?? new _$GCreateStickerVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateStickerVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
