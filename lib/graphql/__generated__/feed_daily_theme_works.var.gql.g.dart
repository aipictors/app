// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_daily_theme_works.var.gql.dart';

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
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'month',
      serializers.serialize(object.month, specifiedType: const FullType(int)),
      'day',
      serializers.serialize(object.day, specifiedType: const FullType(int)),
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
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'month':
          result.month = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
  final int year;
  @override
  final int month;
  @override
  final int day;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GDailyThemeVars([void Function(GDailyThemeVarsBuilder)? updates]) =>
      (new GDailyThemeVarsBuilder()..update(updates))._build();

  _$GDailyThemeVars._(
      {required this.year,
      required this.month,
      required this.day,
      required this.offset,
      required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(year, r'GDailyThemeVars', 'year');
    BuiltValueNullFieldError.checkNotNull(month, r'GDailyThemeVars', 'month');
    BuiltValueNullFieldError.checkNotNull(day, r'GDailyThemeVars', 'day');
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
        year == other.year &&
        month == other.month &&
        day == other.day &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jc(_$hash, day.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemeVars')
          ..add('year', year)
          ..add('month', month)
          ..add('day', day)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GDailyThemeVarsBuilder
    implements Builder<GDailyThemeVars, GDailyThemeVarsBuilder> {
  _$GDailyThemeVars? _$v;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  int? _month;
  int? get month => _$this._month;
  set month(int? month) => _$this._month = month;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

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
      _year = $v.year;
      _month = $v.month;
      _day = $v.day;
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
            year: BuiltValueNullFieldError.checkNotNull(
                year, r'GDailyThemeVars', 'year'),
            month: BuiltValueNullFieldError.checkNotNull(
                month, r'GDailyThemeVars', 'month'),
            day: BuiltValueNullFieldError.checkNotNull(
                day, r'GDailyThemeVars', 'day'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GDailyThemeVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GDailyThemeVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
