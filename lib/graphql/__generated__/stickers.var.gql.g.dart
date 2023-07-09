// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stickers.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStickersVars> _$gStickersVarsSerializer =
    new _$GStickersVarsSerializer();

class _$GStickersVarsSerializer implements StructuredSerializer<GStickersVars> {
  @override
  final Iterable<Type> types = const [GStickersVars, _$GStickersVars];
  @override
  final String wireName = 'GStickersVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStickersVars object,
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
            specifiedType: const FullType(_i1.GStickersWhereInput)));
    }
    return result;
  }

  @override
  GStickersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickersVarsBuilder();

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
                  specifiedType: const FullType(_i1.GStickersWhereInput))!
              as _i1.GStickersWhereInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GStickersVars extends GStickersVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GStickersWhereInput? where;

  factory _$GStickersVars([void Function(GStickersVarsBuilder)? updates]) =>
      (new GStickersVarsBuilder()..update(updates))._build();

  _$GStickersVars._({required this.offset, required this.limit, this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, r'GStickersVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GStickersVars', 'limit');
  }

  @override
  GStickersVars rebuild(void Function(GStickersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickersVarsBuilder toBuilder() => new GStickersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickersVars &&
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
    return (newBuiltValueToStringHelper(r'GStickersVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GStickersVarsBuilder
    implements Builder<GStickersVars, GStickersVarsBuilder> {
  _$GStickersVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  _i1.GStickersWhereInputBuilder? _where;
  _i1.GStickersWhereInputBuilder get where =>
      _$this._where ??= new _i1.GStickersWhereInputBuilder();
  set where(_i1.GStickersWhereInputBuilder? where) => _$this._where = where;

  GStickersVarsBuilder();

  GStickersVarsBuilder get _$this {
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
  void replace(GStickersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickersVars;
  }

  @override
  void update(void Function(GStickersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickersVars build() => _build();

  _$GStickersVars _build() {
    _$GStickersVars _$result;
    try {
      _$result = _$v ??
          new _$GStickersVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GStickersVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GStickersVars', 'limit'),
              where: _where?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        _where?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickersVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
