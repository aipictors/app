// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAlbumsVars> _$gAlbumsVarsSerializer = new _$GAlbumsVarsSerializer();

class _$GAlbumsVarsSerializer implements StructuredSerializer<GAlbumsVars> {
  @override
  final Iterable<Type> types = const [GAlbumsVars, _$GAlbumsVars];
  @override
  final String wireName = 'GAlbumsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAlbumsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.where;
    if (value != null) {
      result
        ..add('where')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GAlbumsWhereInput)));
    }
    return result;
  }

  @override
  GAlbumsVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'where':
          result.where.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GAlbumsWhereInput))!
              as _i1.GAlbumsWhereInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumsVars extends GAlbumsVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GAlbumsWhereInput? where;

  factory _$GAlbumsVars([void Function(GAlbumsVarsBuilder)? updates]) =>
      (new GAlbumsVarsBuilder()..update(updates))._build();

  _$GAlbumsVars._({required this.offset, required this.limit, this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, r'GAlbumsVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GAlbumsVars', 'limit');
  }

  @override
  GAlbumsVars rebuild(void Function(GAlbumsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumsVarsBuilder toBuilder() => new GAlbumsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumsVars &&
        offset == other.offset &&
        limit == other.limit &&
        where == other.where;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, where.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumsVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GAlbumsVarsBuilder implements Builder<GAlbumsVars, GAlbumsVarsBuilder> {
  _$GAlbumsVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  _i1.GAlbumsWhereInputBuilder? _where;
  _i1.GAlbumsWhereInputBuilder get where =>
      _$this._where ??= new _i1.GAlbumsWhereInputBuilder();
  set where(_i1.GAlbumsWhereInputBuilder? where) => _$this._where = where;

  GAlbumsVarsBuilder();

  GAlbumsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _where = $v.where?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumsVars;
  }

  @override
  void update(void Function(GAlbumsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumsVars build() => _build();

  _$GAlbumsVars _build() {
    _$GAlbumsVars _$result;
    try {
      _$result = _$v ??
          new _$GAlbumsVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GAlbumsVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GAlbumsVars', 'limit'),
              where: _where?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        _where?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumsVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
