// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedWorksVars> _$gFeedWorksVarsSerializer =
    new _$GFeedWorksVarsSerializer();

class _$GFeedWorksVarsSerializer
    implements StructuredSerializer<GFeedWorksVars> {
  @override
  final Iterable<Type> types = const [GFeedWorksVars, _$GFeedWorksVars];
  @override
  final String wireName = 'GFeedWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFeedWorksVars object,
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
  GFeedWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedWorksVarsBuilder();

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

class _$GFeedWorksVars extends GFeedWorksVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GWorksWhereInput? where;

  factory _$GFeedWorksVars([void Function(GFeedWorksVarsBuilder)? updates]) =>
      (new GFeedWorksVarsBuilder()..update(updates))._build();

  _$GFeedWorksVars._({required this.offset, required this.limit, this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, r'GFeedWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GFeedWorksVars', 'limit');
  }

  @override
  GFeedWorksVars rebuild(void Function(GFeedWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedWorksVarsBuilder toBuilder() =>
      new GFeedWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedWorksVars &&
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
    return (newBuiltValueToStringHelper(r'GFeedWorksVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GFeedWorksVarsBuilder
    implements Builder<GFeedWorksVars, GFeedWorksVarsBuilder> {
  _$GFeedWorksVars? _$v;

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

  GFeedWorksVarsBuilder();

  GFeedWorksVarsBuilder get _$this {
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
  void replace(GFeedWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedWorksVars;
  }

  @override
  void update(void Function(GFeedWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedWorksVars build() => _build();

  _$GFeedWorksVars _build() {
    _$GFeedWorksVars _$result;
    try {
      _$result = _$v ??
          new _$GFeedWorksVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GFeedWorksVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GFeedWorksVars', 'limit'),
              where: _where?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        _where?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedWorksVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
