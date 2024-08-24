// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_album.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportAlbumVars> _$gReportAlbumVarsSerializer =
    new _$GReportAlbumVarsSerializer();

class _$GReportAlbumVarsSerializer
    implements StructuredSerializer<GReportAlbumVars> {
  @override
  final Iterable<Type> types = const [GReportAlbumVars, _$GReportAlbumVars];
  @override
  final String wireName = 'GReportAlbumVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReportAlbumVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GReportAlbumInput)),
    ];

    return result;
  }

  @override
  GReportAlbumVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportAlbumVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GReportAlbumInput))!
              as _i1.GReportAlbumInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GReportAlbumVars extends GReportAlbumVars {
  @override
  final _i1.GReportAlbumInput input;

  factory _$GReportAlbumVars(
          [void Function(GReportAlbumVarsBuilder)? updates]) =>
      (new GReportAlbumVarsBuilder()..update(updates))._build();

  _$GReportAlbumVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GReportAlbumVars', 'input');
  }

  @override
  GReportAlbumVars rebuild(void Function(GReportAlbumVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportAlbumVarsBuilder toBuilder() =>
      new GReportAlbumVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportAlbumVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GReportAlbumVars')
          ..add('input', input))
        .toString();
  }
}

class GReportAlbumVarsBuilder
    implements Builder<GReportAlbumVars, GReportAlbumVarsBuilder> {
  _$GReportAlbumVars? _$v;

  _i1.GReportAlbumInputBuilder? _input;
  _i1.GReportAlbumInputBuilder get input =>
      _$this._input ??= new _i1.GReportAlbumInputBuilder();
  set input(_i1.GReportAlbumInputBuilder? input) => _$this._input = input;

  GReportAlbumVarsBuilder();

  GReportAlbumVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportAlbumVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportAlbumVars;
  }

  @override
  void update(void Function(GReportAlbumVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportAlbumVars build() => _build();

  _$GReportAlbumVars _build() {
    _$GReportAlbumVars _$result;
    try {
      _$result = _$v ?? new _$GReportAlbumVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReportAlbumVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
