// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_comment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportCommentVars> _$gReportCommentVarsSerializer =
    new _$GReportCommentVarsSerializer();

class _$GReportCommentVarsSerializer
    implements StructuredSerializer<GReportCommentVars> {
  @override
  final Iterable<Type> types = const [GReportCommentVars, _$GReportCommentVars];
  @override
  final String wireName = 'GReportCommentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReportCommentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GReportCommentInput)),
    ];

    return result;
  }

  @override
  GReportCommentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportCommentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GReportCommentInput))!
              as _i1.GReportCommentInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GReportCommentVars extends GReportCommentVars {
  @override
  final _i1.GReportCommentInput input;

  factory _$GReportCommentVars(
          [void Function(GReportCommentVarsBuilder)? updates]) =>
      (new GReportCommentVarsBuilder()..update(updates))._build();

  _$GReportCommentVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GReportCommentVars', 'input');
  }

  @override
  GReportCommentVars rebuild(
          void Function(GReportCommentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportCommentVarsBuilder toBuilder() =>
      new GReportCommentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportCommentVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GReportCommentVars')
          ..add('input', input))
        .toString();
  }
}

class GReportCommentVarsBuilder
    implements Builder<GReportCommentVars, GReportCommentVarsBuilder> {
  _$GReportCommentVars? _$v;

  _i1.GReportCommentInputBuilder? _input;
  _i1.GReportCommentInputBuilder get input =>
      _$this._input ??= new _i1.GReportCommentInputBuilder();
  set input(_i1.GReportCommentInputBuilder? input) => _$this._input = input;

  GReportCommentVarsBuilder();

  GReportCommentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportCommentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportCommentVars;
  }

  @override
  void update(void Function(GReportCommentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportCommentVars build() => _build();

  _$GReportCommentVars _build() {
    _$GReportCommentVars _$result;
    try {
      _$result = _$v ?? new _$GReportCommentVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReportCommentVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
