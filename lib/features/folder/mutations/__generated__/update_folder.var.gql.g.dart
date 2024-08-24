// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_folder.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateFolderVars> _$gUpdateFolderVarsSerializer =
    new _$GUpdateFolderVarsSerializer();

class _$GUpdateFolderVarsSerializer
    implements StructuredSerializer<GUpdateFolderVars> {
  @override
  final Iterable<Type> types = const [GUpdateFolderVars, _$GUpdateFolderVars];
  @override
  final String wireName = 'GUpdateFolderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUpdateFolderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GUpdateFolderInput)),
    ];

    return result;
  }

  @override
  GUpdateFolderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateFolderVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUpdateFolderInput))!
              as _i1.GUpdateFolderInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateFolderVars extends GUpdateFolderVars {
  @override
  final _i1.GUpdateFolderInput input;

  factory _$GUpdateFolderVars(
          [void Function(GUpdateFolderVarsBuilder)? updates]) =>
      (new GUpdateFolderVarsBuilder()..update(updates))._build();

  _$GUpdateFolderVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GUpdateFolderVars', 'input');
  }

  @override
  GUpdateFolderVars rebuild(void Function(GUpdateFolderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateFolderVarsBuilder toBuilder() =>
      new GUpdateFolderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateFolderVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GUpdateFolderVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateFolderVarsBuilder
    implements Builder<GUpdateFolderVars, GUpdateFolderVarsBuilder> {
  _$GUpdateFolderVars? _$v;

  _i1.GUpdateFolderInputBuilder? _input;
  _i1.GUpdateFolderInputBuilder get input =>
      _$this._input ??= new _i1.GUpdateFolderInputBuilder();
  set input(_i1.GUpdateFolderInputBuilder? input) => _$this._input = input;

  GUpdateFolderVarsBuilder();

  GUpdateFolderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateFolderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateFolderVars;
  }

  @override
  void update(void Function(GUpdateFolderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateFolderVars build() => _build();

  _$GUpdateFolderVars _build() {
    _$GUpdateFolderVars _$result;
    try {
      _$result = _$v ?? new _$GUpdateFolderVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateFolderVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
