// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_folder.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteFolderVars> _$gDeleteFolderVarsSerializer =
    new _$GDeleteFolderVarsSerializer();

class _$GDeleteFolderVarsSerializer
    implements StructuredSerializer<GDeleteFolderVars> {
  @override
  final Iterable<Type> types = const [GDeleteFolderVars, _$GDeleteFolderVars];
  @override
  final String wireName = 'GDeleteFolderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDeleteFolderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteFolderInput)),
    ];

    return result;
  }

  @override
  GDeleteFolderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteFolderVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDeleteFolderInput))!
              as _i1.GDeleteFolderInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteFolderVars extends GDeleteFolderVars {
  @override
  final _i1.GDeleteFolderInput input;

  factory _$GDeleteFolderVars(
          [void Function(GDeleteFolderVarsBuilder)? updates]) =>
      (new GDeleteFolderVarsBuilder()..update(updates))._build();

  _$GDeleteFolderVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GDeleteFolderVars', 'input');
  }

  @override
  GDeleteFolderVars rebuild(void Function(GDeleteFolderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteFolderVarsBuilder toBuilder() =>
      new GDeleteFolderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteFolderVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GDeleteFolderVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteFolderVarsBuilder
    implements Builder<GDeleteFolderVars, GDeleteFolderVarsBuilder> {
  _$GDeleteFolderVars? _$v;

  _i1.GDeleteFolderInputBuilder? _input;
  _i1.GDeleteFolderInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteFolderInputBuilder();
  set input(_i1.GDeleteFolderInputBuilder? input) => _$this._input = input;

  GDeleteFolderVarsBuilder();

  GDeleteFolderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteFolderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteFolderVars;
  }

  @override
  void update(void Function(GDeleteFolderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteFolderVars build() => _build();

  _$GDeleteFolderVars _build() {
    _$GDeleteFolderVars _$result;
    try {
      _$result = _$v ?? new _$GDeleteFolderVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteFolderVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
