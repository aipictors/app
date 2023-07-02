// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_awards.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkAwardsVars> _$gWorkAwardsVarsSerializer =
    new _$GWorkAwardsVarsSerializer();

class _$GWorkAwardsVarsSerializer
    implements StructuredSerializer<GWorkAwardsVars> {
  @override
  final Iterable<Type> types = const [GWorkAwardsVars, _$GWorkAwardsVars];
  @override
  final String wireName = 'GWorkAwardsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorkAwardsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
      'where',
      serializers.serialize(object.where,
          specifiedType: const FullType(_i1.GWorkAwardsWhereInput)),
    ];

    return result;
  }

  @override
  GWorkAwardsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsVarsBuilder();

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
                  specifiedType: const FullType(_i1.GWorkAwardsWhereInput))!
              as _i1.GWorkAwardsWhereInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardsVars extends GWorkAwardsVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GWorkAwardsWhereInput where;

  factory _$GWorkAwardsVars([void Function(GWorkAwardsVarsBuilder)? updates]) =>
      (new GWorkAwardsVarsBuilder()..update(updates))._build();

  _$GWorkAwardsVars._(
      {required this.offset, required this.limit, required this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, r'GWorkAwardsVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GWorkAwardsVars', 'limit');
    BuiltValueNullFieldError.checkNotNull(where, r'GWorkAwardsVars', 'where');
  }

  @override
  GWorkAwardsVars rebuild(void Function(GWorkAwardsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsVarsBuilder toBuilder() =>
      new GWorkAwardsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsVars &&
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
    return (newBuiltValueToStringHelper(r'GWorkAwardsVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GWorkAwardsVarsBuilder
    implements Builder<GWorkAwardsVars, GWorkAwardsVarsBuilder> {
  _$GWorkAwardsVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  _i1.GWorkAwardsWhereInputBuilder? _where;
  _i1.GWorkAwardsWhereInputBuilder get where =>
      _$this._where ??= new _i1.GWorkAwardsWhereInputBuilder();
  set where(_i1.GWorkAwardsWhereInputBuilder? where) => _$this._where = where;

  GWorkAwardsVarsBuilder();

  GWorkAwardsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _where = $v.where.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkAwardsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsVars;
  }

  @override
  void update(void Function(GWorkAwardsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsVars build() => _build();

  _$GWorkAwardsVars _build() {
    _$GWorkAwardsVars _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardsVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GWorkAwardsVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GWorkAwardsVars', 'limit'),
              where: where.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        where.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardsVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
