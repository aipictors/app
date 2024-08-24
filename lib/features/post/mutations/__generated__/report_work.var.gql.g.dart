// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportWorkVars> _$gReportWorkVarsSerializer =
    new _$GReportWorkVarsSerializer();

class _$GReportWorkVarsSerializer
    implements StructuredSerializer<GReportWorkVars> {
  @override
  final Iterable<Type> types = const [GReportWorkVars, _$GReportWorkVars];
  @override
  final String wireName = 'GReportWorkVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReportWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GReportWorkInput)),
    ];

    return result;
  }

  @override
  GReportWorkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GReportWorkInput))!
              as _i1.GReportWorkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GReportWorkVars extends GReportWorkVars {
  @override
  final _i1.GReportWorkInput input;

  factory _$GReportWorkVars([void Function(GReportWorkVarsBuilder)? updates]) =>
      (new GReportWorkVarsBuilder()..update(updates))._build();

  _$GReportWorkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GReportWorkVars', 'input');
  }

  @override
  GReportWorkVars rebuild(void Function(GReportWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportWorkVarsBuilder toBuilder() =>
      new GReportWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportWorkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GReportWorkVars')
          ..add('input', input))
        .toString();
  }
}

class GReportWorkVarsBuilder
    implements Builder<GReportWorkVars, GReportWorkVarsBuilder> {
  _$GReportWorkVars? _$v;

  _i1.GReportWorkInputBuilder? _input;
  _i1.GReportWorkInputBuilder get input =>
      _$this._input ??= new _i1.GReportWorkInputBuilder();
  set input(_i1.GReportWorkInputBuilder? input) => _$this._input = input;

  GReportWorkVarsBuilder();

  GReportWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportWorkVars;
  }

  @override
  void update(void Function(GReportWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportWorkVars build() => _build();

  _$GReportWorkVars _build() {
    _$GReportWorkVars _$result;
    try {
      _$result = _$v ?? new _$GReportWorkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReportWorkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
