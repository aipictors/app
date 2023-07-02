// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_theme.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDailyThemeVars> _$gDailyThemeVarsSerializer =
    new _$GDailyThemeVarsSerializer();

class _$GDailyThemeVarsSerializer
    implements StructuredSerializer<GDailyThemeVars> {
  @override
  final Iterable<Type> types = const [GDailyThemeVars, _$GDailyThemeVars];
  @override
  final String wireName = 'GDailyThemeVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDailyThemeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GDailyThemeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeVarsBuilder();

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
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeVars extends GDailyThemeVars {
  @override
  final String id;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GDailyThemeVars([void Function(GDailyThemeVarsBuilder)? updates]) =>
      (new GDailyThemeVarsBuilder()..update(updates))._build();

  _$GDailyThemeVars._(
      {required this.id, required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GDailyThemeVars', 'id');
    BuiltValueNullFieldError.checkNotNull(offset, r'GDailyThemeVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GDailyThemeVars', 'limit');
  }

  @override
  GDailyThemeVars rebuild(void Function(GDailyThemeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeVarsBuilder toBuilder() =>
      new GDailyThemeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeVars &&
        id == other.id &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemeVars')
          ..add('id', id)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GDailyThemeVarsBuilder
    implements Builder<GDailyThemeVars, GDailyThemeVarsBuilder> {
  _$GDailyThemeVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GDailyThemeVarsBuilder();

  GDailyThemeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeVars;
  }

  @override
  void update(void Function(GDailyThemeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeVars build() => _build();

  _$GDailyThemeVars _build() {
    final _$result = _$v ??
        new _$GDailyThemeVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDailyThemeVars', 'id'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GDailyThemeVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GDailyThemeVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
