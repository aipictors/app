// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_sticker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateStickerVars> _$gUpdateStickerVarsSerializer =
    new _$GUpdateStickerVarsSerializer();

class _$GUpdateStickerVarsSerializer
    implements StructuredSerializer<GUpdateStickerVars> {
  @override
  final Iterable<Type> types = const [GUpdateStickerVars, _$GUpdateStickerVars];
  @override
  final String wireName = 'GUpdateStickerVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateStickerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GUpdateStickerInput)),
    ];

    return result;
  }

  @override
  GUpdateStickerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateStickerVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUpdateStickerInput))!
              as _i1.GUpdateStickerInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateStickerVars extends GUpdateStickerVars {
  @override
  final _i1.GUpdateStickerInput input;

  factory _$GUpdateStickerVars(
          [void Function(GUpdateStickerVarsBuilder)? updates]) =>
      (new GUpdateStickerVarsBuilder()..update(updates))._build();

  _$GUpdateStickerVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GUpdateStickerVars', 'input');
  }

  @override
  GUpdateStickerVars rebuild(
          void Function(GUpdateStickerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateStickerVarsBuilder toBuilder() =>
      new GUpdateStickerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateStickerVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GUpdateStickerVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateStickerVarsBuilder
    implements Builder<GUpdateStickerVars, GUpdateStickerVarsBuilder> {
  _$GUpdateStickerVars? _$v;

  _i1.GUpdateStickerInputBuilder? _input;
  _i1.GUpdateStickerInputBuilder get input =>
      _$this._input ??= new _i1.GUpdateStickerInputBuilder();
  set input(_i1.GUpdateStickerInputBuilder? input) => _$this._input = input;

  GUpdateStickerVarsBuilder();

  GUpdateStickerVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateStickerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateStickerVars;
  }

  @override
  void update(void Function(GUpdateStickerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateStickerVars build() => _build();

  _$GUpdateStickerVars _build() {
    _$GUpdateStickerVars _$result;
    try {
      _$result = _$v ?? new _$GUpdateStickerVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateStickerVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
