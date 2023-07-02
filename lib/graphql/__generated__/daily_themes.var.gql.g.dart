// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_themes.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDailyThemesVars> _$gDailyThemesVarsSerializer =
    new _$GDailyThemesVarsSerializer();

class _$GDailyThemesVarsSerializer
    implements StructuredSerializer<GDailyThemesVars> {
  @override
  final Iterable<Type> types = const [GDailyThemesVars, _$GDailyThemesVars];
  @override
  final String wireName = 'GDailyThemesVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDailyThemesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
      'where',
      serializers.serialize(object.where,
          specifiedType: const FullType(_i1.GDailyThemesWhereInput)),
    ];

    return result;
  }

  @override
  GDailyThemesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemesVarsBuilder();

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
                  specifiedType: const FullType(_i1.GDailyThemesWhereInput))!
              as _i1.GDailyThemesWhereInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemesVars extends GDailyThemesVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GDailyThemesWhereInput where;

  factory _$GDailyThemesVars(
          [void Function(GDailyThemesVarsBuilder)? updates]) =>
      (new GDailyThemesVarsBuilder()..update(updates))._build();

  _$GDailyThemesVars._(
      {required this.offset, required this.limit, required this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GDailyThemesVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GDailyThemesVars', 'limit');
    BuiltValueNullFieldError.checkNotNull(where, r'GDailyThemesVars', 'where');
  }

  @override
  GDailyThemesVars rebuild(void Function(GDailyThemesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemesVarsBuilder toBuilder() =>
      new GDailyThemesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemesVars &&
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
    return (newBuiltValueToStringHelper(r'GDailyThemesVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GDailyThemesVarsBuilder
    implements Builder<GDailyThemesVars, GDailyThemesVarsBuilder> {
  _$GDailyThemesVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  _i1.GDailyThemesWhereInputBuilder? _where;
  _i1.GDailyThemesWhereInputBuilder get where =>
      _$this._where ??= new _i1.GDailyThemesWhereInputBuilder();
  set where(_i1.GDailyThemesWhereInputBuilder? where) => _$this._where = where;

  GDailyThemesVarsBuilder();

  GDailyThemesVarsBuilder get _$this {
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
  void replace(GDailyThemesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemesVars;
  }

  @override
  void update(void Function(GDailyThemesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemesVars build() => _build();

  _$GDailyThemesVars _build() {
    _$GDailyThemesVars _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemesVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GDailyThemesVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GDailyThemesVars', 'limit'),
              where: where.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        where.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemesVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
