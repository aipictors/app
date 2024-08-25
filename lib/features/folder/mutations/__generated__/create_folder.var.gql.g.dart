// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateFolderVars> _$gCreateFolderVarsSerializer =
    new _$GCreateFolderVarsSerializer();

class _$GCreateFolderVarsSerializer
    implements StructuredSerializer<GCreateFolderVars> {
  @override
  final Iterable<Type> types = const [GCreateFolderVars, _$GCreateFolderVars];
  @override
  final String wireName = 'GCreateFolderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateFolderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateFolderInput)),
    ];

    return result;
  }

  @override
  GCreateFolderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateFolderVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateFolderInput))!
              as _i1.GCreateFolderInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateFolderVars extends GCreateFolderVars {
  @override
  final _i1.GCreateFolderInput input;

  factory _$GCreateFolderVars(
          [void Function(GCreateFolderVarsBuilder)? updates]) =>
      (new GCreateFolderVarsBuilder()..update(updates))._build();

  _$GCreateFolderVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GCreateFolderVars', 'input');
  }

  @override
  GCreateFolderVars rebuild(void Function(GCreateFolderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateFolderVarsBuilder toBuilder() =>
      new GCreateFolderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateFolderVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateFolderVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateFolderVarsBuilder
    implements Builder<GCreateFolderVars, GCreateFolderVarsBuilder> {
  _$GCreateFolderVars? _$v;

  _i1.GCreateFolderInputBuilder? _input;
  _i1.GCreateFolderInputBuilder get input =>
      _$this._input ??= new _i1.GCreateFolderInputBuilder();
  set input(_i1.GCreateFolderInputBuilder? input) => _$this._input = input;

  GCreateFolderVarsBuilder();

  GCreateFolderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateFolderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateFolderVars;
  }

  @override
  void update(void Function(GCreateFolderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateFolderVars build() => _build();

  _$GCreateFolderVars _build() {
    _$GCreateFolderVars _$result;
    try {
      _$result = _$v ?? new _$GCreateFolderVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateFolderVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
