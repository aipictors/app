// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAlbumVars> _$gAlbumVarsSerializer = new _$GAlbumVarsSerializer();

class _$GAlbumVarsSerializer implements StructuredSerializer<GAlbumVars> {
  @override
  final Iterable<Type> types = const [GAlbumVars, _$GAlbumVars];
  @override
  final String wireName = 'GAlbumVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAlbumVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAlbumVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumVars extends GAlbumVars {
  @override
  final String id;

  factory _$GAlbumVars([void Function(GAlbumVarsBuilder)? updates]) =>
      (new GAlbumVarsBuilder()..update(updates))._build();

  _$GAlbumVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GAlbumVars', 'id');
  }

  @override
  GAlbumVars rebuild(void Function(GAlbumVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumVarsBuilder toBuilder() => new GAlbumVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumVars')..add('id', id))
        .toString();
  }
}

class GAlbumVarsBuilder implements Builder<GAlbumVars, GAlbumVarsBuilder> {
  _$GAlbumVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GAlbumVarsBuilder();

  GAlbumVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumVars;
  }

  @override
  void update(void Function(GAlbumVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumVars build() => _build();

  _$GAlbumVars _build() {
    final _$result = _$v ??
        new _$GAlbumVars._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'GAlbumVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
