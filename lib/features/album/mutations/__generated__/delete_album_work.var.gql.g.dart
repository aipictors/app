// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_album_work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteAlbumWorkVars> _$gDeleteAlbumWorkVarsSerializer =
    new _$GDeleteAlbumWorkVarsSerializer();

class _$GDeleteAlbumWorkVarsSerializer
    implements StructuredSerializer<GDeleteAlbumWorkVars> {
  @override
  final Iterable<Type> types = const [
    GDeleteAlbumWorkVars,
    _$GDeleteAlbumWorkVars
  ];
  @override
  final String wireName = 'GDeleteAlbumWorkVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteAlbumWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteAlbumWorkInput)),
    ];

    return result;
  }

  @override
  GDeleteAlbumWorkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteAlbumWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDeleteAlbumWorkInput))!
              as _i1.GDeleteAlbumWorkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteAlbumWorkVars extends GDeleteAlbumWorkVars {
  @override
  final _i1.GDeleteAlbumWorkInput input;

  factory _$GDeleteAlbumWorkVars(
          [void Function(GDeleteAlbumWorkVarsBuilder)? updates]) =>
      (new GDeleteAlbumWorkVarsBuilder()..update(updates))._build();

  _$GDeleteAlbumWorkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GDeleteAlbumWorkVars', 'input');
  }

  @override
  GDeleteAlbumWorkVars rebuild(
          void Function(GDeleteAlbumWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteAlbumWorkVarsBuilder toBuilder() =>
      new GDeleteAlbumWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteAlbumWorkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GDeleteAlbumWorkVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteAlbumWorkVarsBuilder
    implements Builder<GDeleteAlbumWorkVars, GDeleteAlbumWorkVarsBuilder> {
  _$GDeleteAlbumWorkVars? _$v;

  _i1.GDeleteAlbumWorkInputBuilder? _input;
  _i1.GDeleteAlbumWorkInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteAlbumWorkInputBuilder();
  set input(_i1.GDeleteAlbumWorkInputBuilder? input) => _$this._input = input;

  GDeleteAlbumWorkVarsBuilder();

  GDeleteAlbumWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteAlbumWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteAlbumWorkVars;
  }

  @override
  void update(void Function(GDeleteAlbumWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteAlbumWorkVars build() => _build();

  _$GDeleteAlbumWorkVars _build() {
    _$GDeleteAlbumWorkVars _$result;
    try {
      _$result = _$v ?? new _$GDeleteAlbumWorkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteAlbumWorkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
