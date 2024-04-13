// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_theme.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDailyThemeData> _$gDailyThemeDataSerializer =
    new _$GDailyThemeDataSerializer();
Serializer<GDailyThemeData_dailyTheme> _$gDailyThemeDataDailyThemeSerializer =
    new _$GDailyThemeData_dailyThemeSerializer();
Serializer<GDailyThemeData_dailyTheme_works>
    _$gDailyThemeDataDailyThemeWorksSerializer =
    new _$GDailyThemeData_dailyTheme_worksSerializer();
Serializer<GDailyThemeData_dailyTheme_works_thumbnailImage>
    _$gDailyThemeDataDailyThemeWorksThumbnailImageSerializer =
    new _$GDailyThemeData_dailyTheme_works_thumbnailImageSerializer();

class _$GDailyThemeDataSerializer
    implements StructuredSerializer<GDailyThemeData> {
  @override
  final Iterable<Type> types = const [GDailyThemeData, _$GDailyThemeData];
  @override
  final String wireName = 'GDailyThemeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDailyThemeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.dailyTheme;
    if (value != null) {
      result
        ..add('dailyTheme')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDailyThemeData_dailyTheme)));
    }
    return result;
  }

  @override
  GDailyThemeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'dailyTheme':
          result.dailyTheme.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GDailyThemeData_dailyTheme))!
              as GDailyThemeData_dailyTheme);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData_dailyThemeSerializer
    implements StructuredSerializer<GDailyThemeData_dailyTheme> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme,
    _$GDailyThemeData_dailyTheme
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemeData_dailyTheme object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'dateText',
      serializers.serialize(object.dateText,
          specifiedType: const FullType(String)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'month',
      serializers.serialize(object.month, specifiedType: const FullType(int)),
      'day',
      serializers.serialize(object.day, specifiedType: const FullType(int)),
      'worksCount',
      serializers.serialize(object.worksCount,
          specifiedType: const FullType(int)),
      'works',
      serializers.serialize(object.works,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GDailyThemeData_dailyTheme_works)])),
    ];

    return result;
  }

  @override
  GDailyThemeData_dailyTheme deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyThemeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'dateText':
          result.dateText = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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
        case 'worksCount':
          result.worksCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'works':
          result.works.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GDailyThemeData_dailyTheme_works)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData_dailyTheme_worksSerializer
    implements StructuredSerializer<GDailyThemeData_dailyTheme_works> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme_works,
    _$GDailyThemeData_dailyTheme_works
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemeData_dailyTheme_works object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'commentsCount',
      serializers.serialize(object.commentsCount,
          specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'imageAspectRatio',
      serializers.serialize(object.imageAspectRatio,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GDailyThemeData_dailyTheme_works_thumbnailImage)));
    }
    value = object.thumbnailImagePosition;
    if (value != null) {
      result
        ..add('thumbnailImagePosition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GDailyThemeData_dailyTheme_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyTheme_worksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'commentsCount':
          result.commentsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GDailyThemeData_dailyTheme_works_thumbnailImage))!
              as GDailyThemeData_dailyTheme_works_thumbnailImage);
          break;
        case 'thumbnailImagePosition':
          result.thumbnailImagePosition = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'imageAspectRatio':
          result.imageAspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData_dailyTheme_works_thumbnailImageSerializer
    implements
        StructuredSerializer<GDailyThemeData_dailyTheme_works_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme_works_thumbnailImage,
    _$GDailyThemeData_dailyTheme_works_thumbnailImage
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme_works_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GDailyThemeData_dailyTheme_works_thumbnailImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDailyThemeData_dailyTheme_works_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyTheme_works_thumbnailImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData extends GDailyThemeData {
  @override
  final String G__typename;
  @override
  final GDailyThemeData_dailyTheme? dailyTheme;

  factory _$GDailyThemeData([void Function(GDailyThemeDataBuilder)? updates]) =>
      (new GDailyThemeDataBuilder()..update(updates))._build();

  _$GDailyThemeData._({required this.G__typename, this.dailyTheme})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemeData', 'G__typename');
  }

  @override
  GDailyThemeData rebuild(void Function(GDailyThemeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeDataBuilder toBuilder() =>
      new GDailyThemeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData &&
        G__typename == other.G__typename &&
        dailyTheme == other.dailyTheme;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, dailyTheme.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemeData')
          ..add('G__typename', G__typename)
          ..add('dailyTheme', dailyTheme))
        .toString();
  }
}

class GDailyThemeDataBuilder
    implements Builder<GDailyThemeData, GDailyThemeDataBuilder> {
  _$GDailyThemeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDailyThemeData_dailyThemeBuilder? _dailyTheme;
  GDailyThemeData_dailyThemeBuilder get dailyTheme =>
      _$this._dailyTheme ??= new GDailyThemeData_dailyThemeBuilder();
  set dailyTheme(GDailyThemeData_dailyThemeBuilder? dailyTheme) =>
      _$this._dailyTheme = dailyTheme;

  GDailyThemeDataBuilder() {
    GDailyThemeData._initializeBuilder(this);
  }

  GDailyThemeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _dailyTheme = $v.dailyTheme?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData;
  }

  @override
  void update(void Function(GDailyThemeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData build() => _build();

  _$GDailyThemeData _build() {
    _$GDailyThemeData _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemeData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDailyThemeData', 'G__typename'),
              dailyTheme: _dailyTheme?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dailyTheme';
        _dailyTheme?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemeData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme extends GDailyThemeData_dailyTheme {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String dateText;
  @override
  final int year;
  @override
  final int month;
  @override
  final int day;
  @override
  final int worksCount;
  @override
  final BuiltList<GDailyThemeData_dailyTheme_works> works;

  factory _$GDailyThemeData_dailyTheme(
          [void Function(GDailyThemeData_dailyThemeBuilder)? updates]) =>
      (new GDailyThemeData_dailyThemeBuilder()..update(updates))._build();

  _$GDailyThemeData_dailyTheme._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.dateText,
      required this.year,
      required this.month,
      required this.day,
      required this.worksCount,
      required this.works})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemeData_dailyTheme', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GDailyThemeData_dailyTheme', 'title');
    BuiltValueNullFieldError.checkNotNull(
        dateText, r'GDailyThemeData_dailyTheme', 'dateText');
    BuiltValueNullFieldError.checkNotNull(
        year, r'GDailyThemeData_dailyTheme', 'year');
    BuiltValueNullFieldError.checkNotNull(
        month, r'GDailyThemeData_dailyTheme', 'month');
    BuiltValueNullFieldError.checkNotNull(
        day, r'GDailyThemeData_dailyTheme', 'day');
    BuiltValueNullFieldError.checkNotNull(
        worksCount, r'GDailyThemeData_dailyTheme', 'worksCount');
    BuiltValueNullFieldError.checkNotNull(
        works, r'GDailyThemeData_dailyTheme', 'works');
  }

  @override
  GDailyThemeData_dailyTheme rebuild(
          void Function(GDailyThemeData_dailyThemeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyThemeBuilder toBuilder() =>
      new GDailyThemeData_dailyThemeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        dateText == other.dateText &&
        year == other.year &&
        month == other.month &&
        day == other.day &&
        worksCount == other.worksCount &&
        works == other.works;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dateText.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jc(_$hash, day.hashCode);
    _$hash = $jc(_$hash, worksCount.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemeData_dailyTheme')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('dateText', dateText)
          ..add('year', year)
          ..add('month', month)
          ..add('day', day)
          ..add('worksCount', worksCount)
          ..add('works', works))
        .toString();
  }
}

class GDailyThemeData_dailyThemeBuilder
    implements
        Builder<GDailyThemeData_dailyTheme, GDailyThemeData_dailyThemeBuilder> {
  _$GDailyThemeData_dailyTheme? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _dateText;
  String? get dateText => _$this._dateText;
  set dateText(String? dateText) => _$this._dateText = dateText;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  int? _month;
  int? get month => _$this._month;
  set month(int? month) => _$this._month = month;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  int? _worksCount;
  int? get worksCount => _$this._worksCount;
  set worksCount(int? worksCount) => _$this._worksCount = worksCount;

  ListBuilder<GDailyThemeData_dailyTheme_works>? _works;
  ListBuilder<GDailyThemeData_dailyTheme_works> get works =>
      _$this._works ??= new ListBuilder<GDailyThemeData_dailyTheme_works>();
  set works(ListBuilder<GDailyThemeData_dailyTheme_works>? works) =>
      _$this._works = works;

  GDailyThemeData_dailyThemeBuilder() {
    GDailyThemeData_dailyTheme._initializeBuilder(this);
  }

  GDailyThemeData_dailyThemeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _dateText = $v.dateText;
      _year = $v.year;
      _month = $v.month;
      _day = $v.day;
      _worksCount = $v.worksCount;
      _works = $v.works.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData_dailyTheme other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme;
  }

  @override
  void update(void Function(GDailyThemeData_dailyThemeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme build() => _build();

  _$GDailyThemeData_dailyTheme _build() {
    _$GDailyThemeData_dailyTheme _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemeData_dailyTheme._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDailyThemeData_dailyTheme', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GDailyThemeData_dailyTheme', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GDailyThemeData_dailyTheme', 'title'),
              dateText: BuiltValueNullFieldError.checkNotNull(
                  dateText, r'GDailyThemeData_dailyTheme', 'dateText'),
              year: BuiltValueNullFieldError.checkNotNull(
                  year, r'GDailyThemeData_dailyTheme', 'year'),
              month: BuiltValueNullFieldError.checkNotNull(
                  month, r'GDailyThemeData_dailyTheme', 'month'),
              day: BuiltValueNullFieldError.checkNotNull(
                  day, r'GDailyThemeData_dailyTheme', 'day'),
              worksCount: BuiltValueNullFieldError.checkNotNull(
                  worksCount, r'GDailyThemeData_dailyTheme', 'worksCount'),
              works: works.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        works.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemeData_dailyTheme', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme_works
    extends GDailyThemeData_dailyTheme_works {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final int likesCount;
  @override
  final int commentsCount;
  @override
  final int createdAt;
  @override
  final GDailyThemeData_dailyTheme_works_thumbnailImage? thumbnailImage;
  @override
  final double? thumbnailImagePosition;
  @override
  final double imageAspectRatio;

  factory _$GDailyThemeData_dailyTheme_works(
          [void Function(GDailyThemeData_dailyTheme_worksBuilder)? updates]) =>
      (new GDailyThemeData_dailyTheme_worksBuilder()..update(updates))._build();

  _$GDailyThemeData_dailyTheme_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage,
      this.thumbnailImagePosition,
      required this.imageAspectRatio})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemeData_dailyTheme_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GDailyThemeData_dailyTheme_works', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GDailyThemeData_dailyTheme_works', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GDailyThemeData_dailyTheme_works', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GDailyThemeData_dailyTheme_works', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GDailyThemeData_dailyTheme_works', 'imageAspectRatio');
  }

  @override
  GDailyThemeData_dailyTheme_works rebuild(
          void Function(GDailyThemeData_dailyTheme_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyTheme_worksBuilder toBuilder() =>
      new GDailyThemeData_dailyTheme_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        thumbnailImage == other.thumbnailImage &&
        thumbnailImagePosition == other.thumbnailImagePosition &&
        imageAspectRatio == other.imageAspectRatio;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, commentsCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jc(_$hash, thumbnailImagePosition.hashCode);
    _$hash = $jc(_$hash, imageAspectRatio.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemeData_dailyTheme_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('thumbnailImage', thumbnailImage)
          ..add('thumbnailImagePosition', thumbnailImagePosition)
          ..add('imageAspectRatio', imageAspectRatio))
        .toString();
  }
}

class GDailyThemeData_dailyTheme_worksBuilder
    implements
        Builder<GDailyThemeData_dailyTheme_works,
            GDailyThemeData_dailyTheme_worksBuilder> {
  _$GDailyThemeData_dailyTheme_works? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _commentsCount;
  int? get commentsCount => _$this._commentsCount;
  set commentsCount(int? commentsCount) =>
      _$this._commentsCount = commentsCount;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder? _thumbnailImage;
  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GDailyThemeData_dailyTheme_works_thumbnailImageBuilder();
  set thumbnailImage(
          GDailyThemeData_dailyTheme_works_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  double? _thumbnailImagePosition;
  double? get thumbnailImagePosition => _$this._thumbnailImagePosition;
  set thumbnailImagePosition(double? thumbnailImagePosition) =>
      _$this._thumbnailImagePosition = thumbnailImagePosition;

  double? _imageAspectRatio;
  double? get imageAspectRatio => _$this._imageAspectRatio;
  set imageAspectRatio(double? imageAspectRatio) =>
      _$this._imageAspectRatio = imageAspectRatio;

  GDailyThemeData_dailyTheme_worksBuilder() {
    GDailyThemeData_dailyTheme_works._initializeBuilder(this);
  }

  GDailyThemeData_dailyTheme_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _thumbnailImagePosition = $v.thumbnailImagePosition;
      _imageAspectRatio = $v.imageAspectRatio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData_dailyTheme_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme_works;
  }

  @override
  void update(void Function(GDailyThemeData_dailyTheme_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme_works build() => _build();

  _$GDailyThemeData_dailyTheme_works _build() {
    _$GDailyThemeData_dailyTheme_works _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemeData_dailyTheme_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDailyThemeData_dailyTheme_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GDailyThemeData_dailyTheme_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GDailyThemeData_dailyTheme_works', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GDailyThemeData_dailyTheme_works', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GDailyThemeData_dailyTheme_works', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GDailyThemeData_dailyTheme_works', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build(),
              thumbnailImagePosition: thumbnailImagePosition,
              imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                  imageAspectRatio,
                  r'GDailyThemeData_dailyTheme_works',
                  'imageAspectRatio'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemeData_dailyTheme_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme_works_thumbnailImage
    extends GDailyThemeData_dailyTheme_works_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GDailyThemeData_dailyTheme_works_thumbnailImage(
          [void Function(
                  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder)?
              updates]) =>
      (new GDailyThemeData_dailyTheme_works_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GDailyThemeData_dailyTheme_works_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GDailyThemeData_dailyTheme_works_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme_works_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GDailyThemeData_dailyTheme_works_thumbnailImage', 'downloadURL');
  }

  @override
  GDailyThemeData_dailyTheme_works_thumbnailImage rebuild(
          void Function(GDailyThemeData_dailyTheme_works_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder toBuilder() =>
      new GDailyThemeData_dailyTheme_works_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme_works_thumbnailImage &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GDailyThemeData_dailyTheme_works_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GDailyThemeData_dailyTheme_works_thumbnailImageBuilder
    implements
        Builder<GDailyThemeData_dailyTheme_works_thumbnailImage,
            GDailyThemeData_dailyTheme_works_thumbnailImageBuilder> {
  _$GDailyThemeData_dailyTheme_works_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder() {
    GDailyThemeData_dailyTheme_works_thumbnailImage._initializeBuilder(this);
  }

  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData_dailyTheme_works_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme_works_thumbnailImage;
  }

  @override
  void update(
      void Function(GDailyThemeData_dailyTheme_works_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme_works_thumbnailImage build() => _build();

  _$GDailyThemeData_dailyTheme_works_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GDailyThemeData_dailyTheme_works_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GDailyThemeData_dailyTheme_works_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDailyThemeData_dailyTheme_works_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GDailyThemeData_dailyTheme_works_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
