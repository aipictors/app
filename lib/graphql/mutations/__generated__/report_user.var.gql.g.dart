// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_user.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportUserVars> _$gReportUserVarsSerializer =
    new _$GReportUserVarsSerializer();

class _$GReportUserVarsSerializer
    implements StructuredSerializer<GReportUserVars> {
  @override
  final Iterable<Type> types = const [GReportUserVars, _$GReportUserVars];
  @override
  final String wireName = 'GReportUserVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReportUserVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GReportUserInput)),
    ];

    return result;
  }

  @override
  GReportUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportUserVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GReportUserInput))!
              as _i1.GReportUserInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GReportUserVars extends GReportUserVars {
  @override
  final _i1.GReportUserInput input;

  factory _$GReportUserVars([void Function(GReportUserVarsBuilder)? updates]) =>
      (new GReportUserVarsBuilder()..update(updates))._build();

  _$GReportUserVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GReportUserVars', 'input');
  }

  @override
  GReportUserVars rebuild(void Function(GReportUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportUserVarsBuilder toBuilder() =>
      new GReportUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportUserVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GReportUserVars')
          ..add('input', input))
        .toString();
  }
}

class GReportUserVarsBuilder
    implements Builder<GReportUserVars, GReportUserVarsBuilder> {
  _$GReportUserVars? _$v;

  _i1.GReportUserInputBuilder? _input;
  _i1.GReportUserInputBuilder get input =>
      _$this._input ??= new _i1.GReportUserInputBuilder();
  set input(_i1.GReportUserInputBuilder? input) => _$this._input = input;

  GReportUserVarsBuilder();

  GReportUserVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportUserVars;
  }

  @override
  void update(void Function(GReportUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportUserVars build() => _build();

  _$GReportUserVars _build() {
    _$GReportUserVars _$result;
    try {
      _$result = _$v ?? new _$GReportUserVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReportUserVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
