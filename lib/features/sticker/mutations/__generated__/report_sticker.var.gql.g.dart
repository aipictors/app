// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_sticker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportStickerVars> _$gReportStickerVarsSerializer =
    new _$GReportStickerVarsSerializer();

class _$GReportStickerVarsSerializer
    implements StructuredSerializer<GReportStickerVars> {
  @override
  final Iterable<Type> types = const [GReportStickerVars, _$GReportStickerVars];
  @override
  final String wireName = 'GReportStickerVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReportStickerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GReportStickerInput)),
    ];

    return result;
  }

  @override
  GReportStickerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportStickerVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GReportStickerInput))!
              as _i1.GReportStickerInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GReportStickerVars extends GReportStickerVars {
  @override
  final _i1.GReportStickerInput input;

  factory _$GReportStickerVars(
          [void Function(GReportStickerVarsBuilder)? updates]) =>
      (new GReportStickerVarsBuilder()..update(updates))._build();

  _$GReportStickerVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GReportStickerVars', 'input');
  }

  @override
  GReportStickerVars rebuild(
          void Function(GReportStickerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportStickerVarsBuilder toBuilder() =>
      new GReportStickerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportStickerVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GReportStickerVars')
          ..add('input', input))
        .toString();
  }
}

class GReportStickerVarsBuilder
    implements Builder<GReportStickerVars, GReportStickerVarsBuilder> {
  _$GReportStickerVars? _$v;

  _i1.GReportStickerInputBuilder? _input;
  _i1.GReportStickerInputBuilder get input =>
      _$this._input ??= new _i1.GReportStickerInputBuilder();
  set input(_i1.GReportStickerInputBuilder? input) => _$this._input = input;

  GReportStickerVarsBuilder();

  GReportStickerVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportStickerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportStickerVars;
  }

  @override
  void update(void Function(GReportStickerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportStickerVars build() => _build();

  _$GReportStickerVars _build() {
    _$GReportStickerVars _$result;
    try {
      _$result = _$v ?? new _$GReportStickerVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReportStickerVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
