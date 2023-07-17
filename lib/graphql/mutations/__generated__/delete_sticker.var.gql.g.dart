// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_sticker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteStickerVars> _$gDeleteStickerVarsSerializer =
    new _$GDeleteStickerVarsSerializer();

class _$GDeleteStickerVarsSerializer
    implements StructuredSerializer<GDeleteStickerVars> {
  @override
  final Iterable<Type> types = const [GDeleteStickerVars, _$GDeleteStickerVars];
  @override
  final String wireName = 'GDeleteStickerVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteStickerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteStickerInput)),
    ];

    return result;
  }

  @override
  GDeleteStickerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteStickerVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDeleteStickerInput))!
              as _i1.GDeleteStickerInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteStickerVars extends GDeleteStickerVars {
  @override
  final _i1.GDeleteStickerInput input;

  factory _$GDeleteStickerVars(
          [void Function(GDeleteStickerVarsBuilder)? updates]) =>
      (new GDeleteStickerVarsBuilder()..update(updates))._build();

  _$GDeleteStickerVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GDeleteStickerVars', 'input');
  }

  @override
  GDeleteStickerVars rebuild(
          void Function(GDeleteStickerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteStickerVarsBuilder toBuilder() =>
      new GDeleteStickerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteStickerVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GDeleteStickerVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteStickerVarsBuilder
    implements Builder<GDeleteStickerVars, GDeleteStickerVarsBuilder> {
  _$GDeleteStickerVars? _$v;

  _i1.GDeleteStickerInputBuilder? _input;
  _i1.GDeleteStickerInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteStickerInputBuilder();
  set input(_i1.GDeleteStickerInputBuilder? input) => _$this._input = input;

  GDeleteStickerVarsBuilder();

  GDeleteStickerVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteStickerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteStickerVars;
  }

  @override
  void update(void Function(GDeleteStickerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteStickerVars build() => _build();

  _$GDeleteStickerVars _build() {
    _$GDeleteStickerVars _$result;
    try {
      _$result = _$v ?? new _$GDeleteStickerVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteStickerVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
