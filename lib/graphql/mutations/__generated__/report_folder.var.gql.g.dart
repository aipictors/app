// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_folder.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportFolderVars> _$gReportFolderVarsSerializer =
    new _$GReportFolderVarsSerializer();

class _$GReportFolderVarsSerializer
    implements StructuredSerializer<GReportFolderVars> {
  @override
  final Iterable<Type> types = const [GReportFolderVars, _$GReportFolderVars];
  @override
  final String wireName = 'GReportFolderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReportFolderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GReportFolderInput)),
    ];

    return result;
  }

  @override
  GReportFolderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportFolderVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GReportFolderInput))!
              as _i1.GReportFolderInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GReportFolderVars extends GReportFolderVars {
  @override
  final _i1.GReportFolderInput input;

  factory _$GReportFolderVars(
          [void Function(GReportFolderVarsBuilder)? updates]) =>
      (new GReportFolderVarsBuilder()..update(updates))._build();

  _$GReportFolderVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GReportFolderVars', 'input');
  }

  @override
  GReportFolderVars rebuild(void Function(GReportFolderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportFolderVarsBuilder toBuilder() =>
      new GReportFolderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportFolderVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GReportFolderVars')
          ..add('input', input))
        .toString();
  }
}

class GReportFolderVarsBuilder
    implements Builder<GReportFolderVars, GReportFolderVarsBuilder> {
  _$GReportFolderVars? _$v;

  _i1.GReportFolderInputBuilder? _input;
  _i1.GReportFolderInputBuilder get input =>
      _$this._input ??= new _i1.GReportFolderInputBuilder();
  set input(_i1.GReportFolderInputBuilder? input) => _$this._input = input;

  GReportFolderVarsBuilder();

  GReportFolderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportFolderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportFolderVars;
  }

  @override
  void update(void Function(GReportFolderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportFolderVars build() => _build();

  _$GReportFolderVars _build() {
    _$GReportFolderVars _$result;
    try {
      _$result = _$v ?? new _$GReportFolderVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReportFolderVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
