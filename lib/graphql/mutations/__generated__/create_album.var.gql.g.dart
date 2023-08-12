// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_album.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAlbumVars> _$gCreateAlbumVarsSerializer =
    new _$GCreateAlbumVarsSerializer();

class _$GCreateAlbumVarsSerializer
    implements StructuredSerializer<GCreateAlbumVars> {
  @override
  final Iterable<Type> types = const [GCreateAlbumVars, _$GCreateAlbumVars];
  @override
  final String wireName = 'GCreateAlbumVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateAlbumVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateFolderInput)),
    ];

    return result;
  }

  @override
  GCreateAlbumVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAlbumVarsBuilder();

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

class _$GCreateAlbumVars extends GCreateAlbumVars {
  @override
  final _i1.GCreateFolderInput input;

  factory _$GCreateAlbumVars(
          [void Function(GCreateAlbumVarsBuilder)? updates]) =>
      (new GCreateAlbumVarsBuilder()..update(updates))._build();

  _$GCreateAlbumVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GCreateAlbumVars', 'input');
  }

  @override
  GCreateAlbumVars rebuild(void Function(GCreateAlbumVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAlbumVarsBuilder toBuilder() =>
      new GCreateAlbumVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAlbumVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateAlbumVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateAlbumVarsBuilder
    implements Builder<GCreateAlbumVars, GCreateAlbumVarsBuilder> {
  _$GCreateAlbumVars? _$v;

  _i1.GCreateFolderInputBuilder? _input;
  _i1.GCreateFolderInputBuilder get input =>
      _$this._input ??= new _i1.GCreateFolderInputBuilder();
  set input(_i1.GCreateFolderInputBuilder? input) => _$this._input = input;

  GCreateAlbumVarsBuilder();

  GCreateAlbumVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAlbumVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAlbumVars;
  }

  @override
  void update(void Function(GCreateAlbumVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAlbumVars build() => _build();

  _$GCreateAlbumVars _build() {
    _$GCreateAlbumVars _$result;
    try {
      _$result = _$v ?? new _$GCreateAlbumVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateAlbumVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
