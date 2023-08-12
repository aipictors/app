// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_folder_work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteFolderWorkVars> _$gDeleteFolderWorkVarsSerializer =
    new _$GDeleteFolderWorkVarsSerializer();

class _$GDeleteFolderWorkVarsSerializer
    implements StructuredSerializer<GDeleteFolderWorkVars> {
  @override
  final Iterable<Type> types = const [
    GDeleteFolderWorkVars,
    _$GDeleteFolderWorkVars
  ];
  @override
  final String wireName = 'GDeleteFolderWorkVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteFolderWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteFolderWorkInput)),
    ];

    return result;
  }

  @override
  GDeleteFolderWorkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteFolderWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDeleteFolderWorkInput))!
              as _i1.GDeleteFolderWorkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteFolderWorkVars extends GDeleteFolderWorkVars {
  @override
  final _i1.GDeleteFolderWorkInput input;

  factory _$GDeleteFolderWorkVars(
          [void Function(GDeleteFolderWorkVarsBuilder)? updates]) =>
      (new GDeleteFolderWorkVarsBuilder()..update(updates))._build();

  _$GDeleteFolderWorkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GDeleteFolderWorkVars', 'input');
  }

  @override
  GDeleteFolderWorkVars rebuild(
          void Function(GDeleteFolderWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteFolderWorkVarsBuilder toBuilder() =>
      new GDeleteFolderWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteFolderWorkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GDeleteFolderWorkVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteFolderWorkVarsBuilder
    implements Builder<GDeleteFolderWorkVars, GDeleteFolderWorkVarsBuilder> {
  _$GDeleteFolderWorkVars? _$v;

  _i1.GDeleteFolderWorkInputBuilder? _input;
  _i1.GDeleteFolderWorkInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteFolderWorkInputBuilder();
  set input(_i1.GDeleteFolderWorkInputBuilder? input) => _$this._input = input;

  GDeleteFolderWorkVarsBuilder();

  GDeleteFolderWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteFolderWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteFolderWorkVars;
  }

  @override
  void update(void Function(GDeleteFolderWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteFolderWorkVars build() => _build();

  _$GDeleteFolderWorkVars _build() {
    _$GDeleteFolderWorkVars _$result;
    try {
      _$result = _$v ?? new _$GDeleteFolderWorkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteFolderWorkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
