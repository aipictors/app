// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_latest_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedLatestWorksVars> _$gFeedLatestWorksVarsSerializer =
    new _$GFeedLatestWorksVarsSerializer();

class _$GFeedLatestWorksVarsSerializer
    implements StructuredSerializer<GFeedLatestWorksVars> {
  @override
  final Iterable<Type> types = const [
    GFeedLatestWorksVars,
    _$GFeedLatestWorksVars
  ];
  @override
  final String wireName = 'GFeedLatestWorksVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedLatestWorksVars object,
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
  GFeedLatestWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedLatestWorksVarsBuilder();

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

class _$GFeedLatestWorksVars extends GFeedLatestWorksVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GWorksWhereInput? where;

  factory _$GFeedLatestWorksVars(
          [void Function(GFeedLatestWorksVarsBuilder)? updates]) =>
      (new GFeedLatestWorksVarsBuilder()..update(updates))._build();

  _$GFeedLatestWorksVars._(
      {required this.offset, required this.limit, this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GFeedLatestWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GFeedLatestWorksVars', 'limit');
  }

  @override
  GFeedLatestWorksVars rebuild(
          void Function(GFeedLatestWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedLatestWorksVarsBuilder toBuilder() =>
      new GFeedLatestWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedLatestWorksVars &&
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
    return (newBuiltValueToStringHelper(r'GFeedLatestWorksVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GFeedLatestWorksVarsBuilder
    implements Builder<GFeedLatestWorksVars, GFeedLatestWorksVarsBuilder> {
  _$GFeedLatestWorksVars? _$v;

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

  GFeedLatestWorksVarsBuilder();

  GFeedLatestWorksVarsBuilder get _$this {
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
  void replace(GFeedLatestWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedLatestWorksVars;
  }

  @override
  void update(void Function(GFeedLatestWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedLatestWorksVars build() => _build();

  _$GFeedLatestWorksVars _build() {
    _$GFeedLatestWorksVars _$result;
    try {
      _$result = _$v ??
          new _$GFeedLatestWorksVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GFeedLatestWorksVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GFeedLatestWorksVars', 'limit'),
              where: _where?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        _where?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedLatestWorksVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
