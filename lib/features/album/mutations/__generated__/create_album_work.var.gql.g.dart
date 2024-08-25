// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_album_work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAlbumWorkVars> _$gCreateAlbumWorkVarsSerializer =
    new _$GCreateAlbumWorkVarsSerializer();

class _$GCreateAlbumWorkVarsSerializer
    implements StructuredSerializer<GCreateAlbumWorkVars> {
  @override
  final Iterable<Type> types = const [
    GCreateAlbumWorkVars,
    _$GCreateAlbumWorkVars
  ];
  @override
  final String wireName = 'GCreateAlbumWorkVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAlbumWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateAlbumWorkInput)),
    ];

    return result;
  }

  @override
  GCreateAlbumWorkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAlbumWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateAlbumWorkInput))!
              as _i1.GCreateAlbumWorkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAlbumWorkVars extends GCreateAlbumWorkVars {
  @override
  final _i1.GCreateAlbumWorkInput input;

  factory _$GCreateAlbumWorkVars(
          [void Function(GCreateAlbumWorkVarsBuilder)? updates]) =>
      (new GCreateAlbumWorkVarsBuilder()..update(updates))._build();

  _$GCreateAlbumWorkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateAlbumWorkVars', 'input');
  }

  @override
  GCreateAlbumWorkVars rebuild(
          void Function(GCreateAlbumWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAlbumWorkVarsBuilder toBuilder() =>
      new GCreateAlbumWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAlbumWorkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateAlbumWorkVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateAlbumWorkVarsBuilder
    implements Builder<GCreateAlbumWorkVars, GCreateAlbumWorkVarsBuilder> {
  _$GCreateAlbumWorkVars? _$v;

  _i1.GCreateAlbumWorkInputBuilder? _input;
  _i1.GCreateAlbumWorkInputBuilder get input =>
      _$this._input ??= new _i1.GCreateAlbumWorkInputBuilder();
  set input(_i1.GCreateAlbumWorkInputBuilder? input) => _$this._input = input;

  GCreateAlbumWorkVarsBuilder();

  GCreateAlbumWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAlbumWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAlbumWorkVars;
  }

  @override
  void update(void Function(GCreateAlbumWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAlbumWorkVars build() => _build();

  _$GCreateAlbumWorkVars _build() {
    _$GCreateAlbumWorkVars _$result;
    try {
      _$result = _$v ?? new _$GCreateAlbumWorkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateAlbumWorkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
