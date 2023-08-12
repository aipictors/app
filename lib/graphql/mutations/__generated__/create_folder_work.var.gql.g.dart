// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateFolderWorkVars> _$gCreateFolderWorkVarsSerializer =
    new _$GCreateFolderWorkVarsSerializer();

class _$GCreateFolderWorkVarsSerializer
    implements StructuredSerializer<GCreateFolderWorkVars> {
  @override
  final Iterable<Type> types = const [
    GCreateFolderWorkVars,
    _$GCreateFolderWorkVars
  ];
  @override
  final String wireName = 'GCreateFolderWorkVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateFolderWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateFolderWorkInput)),
    ];

    return result;
  }

  @override
  GCreateFolderWorkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateFolderWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateFolderWorkInput))!
              as _i1.GCreateFolderWorkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateFolderWorkVars extends GCreateFolderWorkVars {
  @override
  final _i1.GCreateFolderWorkInput input;

  factory _$GCreateFolderWorkVars(
          [void Function(GCreateFolderWorkVarsBuilder)? updates]) =>
      (new GCreateFolderWorkVarsBuilder()..update(updates))._build();

  _$GCreateFolderWorkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateFolderWorkVars', 'input');
  }

  @override
  GCreateFolderWorkVars rebuild(
          void Function(GCreateFolderWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateFolderWorkVarsBuilder toBuilder() =>
      new GCreateFolderWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateFolderWorkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateFolderWorkVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateFolderWorkVarsBuilder
    implements Builder<GCreateFolderWorkVars, GCreateFolderWorkVarsBuilder> {
  _$GCreateFolderWorkVars? _$v;

  _i1.GCreateFolderWorkInputBuilder? _input;
  _i1.GCreateFolderWorkInputBuilder get input =>
      _$this._input ??= new _i1.GCreateFolderWorkInputBuilder();
  set input(_i1.GCreateFolderWorkInputBuilder? input) => _$this._input = input;

  GCreateFolderWorkVarsBuilder();

  GCreateFolderWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateFolderWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateFolderWorkVars;
  }

  @override
  void update(void Function(GCreateFolderWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateFolderWorkVars build() => _build();

  _$GCreateFolderWorkVars _build() {
    _$GCreateFolderWorkVars _$result;
    try {
      _$result = _$v ?? new _$GCreateFolderWorkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateFolderWorkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
