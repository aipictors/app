// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTagsVars> _$gTagsVarsSerializer = new _$GTagsVarsSerializer();

class _$GTagsVarsSerializer implements StructuredSerializer<GTagsVars> {
  @override
  final Iterable<Type> types = const [GTagsVars, _$GTagsVars];
  @override
  final String wireName = 'GTagsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagsVars object,
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
            specifiedType: const FullType(_i1.GTagsWhereInput)));
    }
    return result;
  }

  @override
  GTagsVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagsVarsBuilder();

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
                  specifiedType: const FullType(_i1.GTagsWhereInput))!
              as _i1.GTagsWhereInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GTagsVars extends GTagsVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GTagsWhereInput? where;

  factory _$GTagsVars([void Function(GTagsVarsBuilder)? updates]) =>
      (new GTagsVarsBuilder()..update(updates))._build();

  _$GTagsVars._({required this.offset, required this.limit, this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, r'GTagsVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GTagsVars', 'limit');
  }

  @override
  GTagsVars rebuild(void Function(GTagsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagsVarsBuilder toBuilder() => new GTagsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagsVars &&
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
    return (newBuiltValueToStringHelper(r'GTagsVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GTagsVarsBuilder implements Builder<GTagsVars, GTagsVarsBuilder> {
  _$GTagsVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  _i1.GTagsWhereInputBuilder? _where;
  _i1.GTagsWhereInputBuilder get where =>
      _$this._where ??= new _i1.GTagsWhereInputBuilder();
  set where(_i1.GTagsWhereInputBuilder? where) => _$this._where = where;

  GTagsVarsBuilder();

  GTagsVarsBuilder get _$this {
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
  void replace(GTagsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagsVars;
  }

  @override
  void update(void Function(GTagsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagsVars build() => _build();

  _$GTagsVars _build() {
    _$GTagsVars _$result;
    try {
      _$result = _$v ??
          new _$GTagsVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GTagsVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GTagsVars', 'limit'),
              where: _where?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        _where?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTagsVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
