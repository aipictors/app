// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorksVars> _$gWorksVarsSerializer = new _$GWorksVarsSerializer();

class _$GWorksVarsSerializer implements StructuredSerializer<GWorksVars> {
  @override
  final Iterable<Type> types = const [GWorksVars, _$GWorksVars];
  @override
  final String wireName = 'GWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorksVars object,
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
            specifiedType: const FullType(_i1.GWorksWhereInput)));
    }
    return result;
  }

  @override
  GWorksVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorksVarsBuilder();

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
                  specifiedType: const FullType(_i1.GWorksWhereInput))!
              as _i1.GWorksWhereInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorksVars extends GWorksVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GWorksWhereInput? where;

  factory _$GWorksVars([void Function(GWorksVarsBuilder)? updates]) =>
      (new GWorksVarsBuilder()..update(updates))._build();

  _$GWorksVars._({required this.offset, required this.limit, this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, r'GWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GWorksVars', 'limit');
  }

  @override
  GWorksVars rebuild(void Function(GWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorksVarsBuilder toBuilder() => new GWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorksVars &&
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
    return (newBuiltValueToStringHelper(r'GWorksVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GWorksVarsBuilder implements Builder<GWorksVars, GWorksVarsBuilder> {
  _$GWorksVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  _i1.GWorksWhereInputBuilder? _where;
  _i1.GWorksWhereInputBuilder get where =>
      _$this._where ??= new _i1.GWorksWhereInputBuilder();
  set where(_i1.GWorksWhereInputBuilder? where) => _$this._where = where;

  GWorksVarsBuilder();

  GWorksVarsBuilder get _$this {
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
  void replace(GWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorksVars;
  }

  @override
  void update(void Function(GWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorksVars build() => _build();

  _$GWorksVars _build() {
    _$GWorksVars _$result;
    try {
      _$result = _$v ??
          new _$GWorksVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GWorksVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GWorksVars', 'limit'),
              where: _where?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        _where?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorksVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
