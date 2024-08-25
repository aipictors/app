// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_album.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteAlbumVars> _$gDeleteAlbumVarsSerializer =
    new _$GDeleteAlbumVarsSerializer();

class _$GDeleteAlbumVarsSerializer
    implements StructuredSerializer<GDeleteAlbumVars> {
  @override
  final Iterable<Type> types = const [GDeleteAlbumVars, _$GDeleteAlbumVars];
  @override
  final String wireName = 'GDeleteAlbumVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDeleteAlbumVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteAlbumInput)),
    ];

    return result;
  }

  @override
  GDeleteAlbumVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteAlbumVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDeleteAlbumInput))!
              as _i1.GDeleteAlbumInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteAlbumVars extends GDeleteAlbumVars {
  @override
  final _i1.GDeleteAlbumInput input;

  factory _$GDeleteAlbumVars(
          [void Function(GDeleteAlbumVarsBuilder)? updates]) =>
      (new GDeleteAlbumVarsBuilder()..update(updates))._build();

  _$GDeleteAlbumVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(input, r'GDeleteAlbumVars', 'input');
  }

  @override
  GDeleteAlbumVars rebuild(void Function(GDeleteAlbumVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteAlbumVarsBuilder toBuilder() =>
      new GDeleteAlbumVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteAlbumVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GDeleteAlbumVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteAlbumVarsBuilder
    implements Builder<GDeleteAlbumVars, GDeleteAlbumVarsBuilder> {
  _$GDeleteAlbumVars? _$v;

  _i1.GDeleteAlbumInputBuilder? _input;
  _i1.GDeleteAlbumInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteAlbumInputBuilder();
  set input(_i1.GDeleteAlbumInputBuilder? input) => _$this._input = input;

  GDeleteAlbumVarsBuilder();

  GDeleteAlbumVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteAlbumVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteAlbumVars;
  }

  @override
  void update(void Function(GDeleteAlbumVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteAlbumVars build() => _build();

  _$GDeleteAlbumVars _build() {
    _$GDeleteAlbumVars _$result;
    try {
      _$result = _$v ?? new _$GDeleteAlbumVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteAlbumVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
