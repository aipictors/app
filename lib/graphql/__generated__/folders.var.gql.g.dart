// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFoldersVars> _$gFoldersVarsSerializer =
    new _$GFoldersVarsSerializer();

class _$GFoldersVarsSerializer implements StructuredSerializer<GFoldersVars> {
  @override
  final Iterable<Type> types = const [GFoldersVars, _$GFoldersVars];
  @override
  final String wireName = 'GFoldersVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFoldersVars object,
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
            specifiedType: const FullType(_i1.GFoldersWhereInput)));
    }
    return result;
  }

  @override
  GFoldersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFoldersVarsBuilder();

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
                  specifiedType: const FullType(_i1.GFoldersWhereInput))!
              as _i1.GFoldersWhereInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GFoldersVars extends GFoldersVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GFoldersWhereInput? where;

  factory _$GFoldersVars([void Function(GFoldersVarsBuilder)? updates]) =>
      (new GFoldersVarsBuilder()..update(updates))._build();

  _$GFoldersVars._({required this.offset, required this.limit, this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, r'GFoldersVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GFoldersVars', 'limit');
  }

  @override
  GFoldersVars rebuild(void Function(GFoldersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFoldersVarsBuilder toBuilder() => new GFoldersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFoldersVars &&
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
    return (newBuiltValueToStringHelper(r'GFoldersVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GFoldersVarsBuilder
    implements Builder<GFoldersVars, GFoldersVarsBuilder> {
  _$GFoldersVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  _i1.GFoldersWhereInputBuilder? _where;
  _i1.GFoldersWhereInputBuilder get where =>
      _$this._where ??= new _i1.GFoldersWhereInputBuilder();
  set where(_i1.GFoldersWhereInputBuilder? where) => _$this._where = where;

  GFoldersVarsBuilder();

  GFoldersVarsBuilder get _$this {
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
  void replace(GFoldersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFoldersVars;
  }

  @override
  void update(void Function(GFoldersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFoldersVars build() => _build();

  _$GFoldersVars _build() {
    _$GFoldersVars _$result;
    try {
      _$result = _$v ??
          new _$GFoldersVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GFoldersVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GFoldersVars', 'limit'),
              where: _where?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        _where?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFoldersVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
