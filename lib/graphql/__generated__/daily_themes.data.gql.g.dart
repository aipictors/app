// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_themes.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDailyThemesData> _$gDailyThemesDataSerializer =
    new _$GDailyThemesDataSerializer();
Serializer<GDailyThemesData_dailyThemes>
    _$gDailyThemesDataDailyThemesSerializer =
    new _$GDailyThemesData_dailyThemesSerializer();
Serializer<GDailyThemesData_dailyThemes_firstWork>
    _$gDailyThemesDataDailyThemesFirstWorkSerializer =
    new _$GDailyThemesData_dailyThemes_firstWorkSerializer();

class _$GDailyThemesDataSerializer
    implements StructuredSerializer<GDailyThemesData> {
  @override
  final Iterable<Type> types = const [GDailyThemesData, _$GDailyThemesData];
  @override
  final String wireName = 'GDailyThemesData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDailyThemesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'dailyThemes',
      serializers.serialize(object.dailyThemes,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GDailyThemesData_dailyThemes)])),
    ];

    return result;
  }

  @override
  GDailyThemesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemesDataBuilder();

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
        case 'dailyThemes':
          result.dailyThemes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GDailyThemesData_dailyThemes)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemesData_dailyThemesSerializer
    implements StructuredSerializer<GDailyThemesData_dailyThemes> {
  @override
  final Iterable<Type> types = const [
    GDailyThemesData_dailyThemes,
    _$GDailyThemesData_dailyThemes
  ];
  @override
  final String wireName = 'GDailyThemesData_dailyThemes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemesData_dailyThemes object,
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
    ];
    Object? value;
    value = object.firstWork;
    if (value != null) {
      result
        ..add('firstWork')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GDailyThemesData_dailyThemes_firstWork)));
    }
    return result;
  }

  @override
  GDailyThemesData_dailyThemes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemesData_dailyThemesBuilder();

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
        case 'firstWork':
          result.firstWork.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDailyThemesData_dailyThemes_firstWork))!
              as GDailyThemesData_dailyThemes_firstWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemesData_dailyThemes_firstWorkSerializer
    implements StructuredSerializer<GDailyThemesData_dailyThemes_firstWork> {
  @override
  final Iterable<Type> types = const [
    GDailyThemesData_dailyThemes_firstWork,
    _$GDailyThemesData_dailyThemes_firstWork
  ];
  @override
  final String wireName = 'GDailyThemesData_dailyThemes_firstWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemesData_dailyThemes_firstWork object,
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
      'imageURL',
      serializers.serialize(object.imageURL,
          specifiedType: const FullType(String)),
      'imageWidth',
      serializers.serialize(object.imageWidth,
          specifiedType: const FullType(int)),
      'imageHeight',
      serializers.serialize(object.imageHeight,
          specifiedType: const FullType(int)),
      'largeThumbnailImageURL',
      serializers.serialize(object.largeThumbnailImageURL,
          specifiedType: const FullType(String)),
      'largeThumbnailImageWidth',
      serializers.serialize(object.largeThumbnailImageWidth,
          specifiedType: const FullType(int)),
      'largeThumbnailImageHeight',
      serializers.serialize(object.largeThumbnailImageHeight,
          specifiedType: const FullType(int)),
      'smallThumbnailImageURL',
      serializers.serialize(object.smallThumbnailImageURL,
          specifiedType: const FullType(String)),
      'smallThumbnailImageWidth',
      serializers.serialize(object.smallThumbnailImageWidth,
          specifiedType: const FullType(int)),
      'smallThumbnailImageHeight',
      serializers.serialize(object.smallThumbnailImageHeight,
          specifiedType: const FullType(int)),
      'imageAspectRatio',
      serializers.serialize(object.imageAspectRatio,
          specifiedType: const FullType(double)),
    ];
    Object? value;
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
  GDailyThemesData_dailyThemes_firstWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemesData_dailyThemes_firstWorkBuilder();

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
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'imageWidth':
          result.imageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'imageHeight':
          result.imageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'largeThumbnailImageURL':
          result.largeThumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'largeThumbnailImageWidth':
          result.largeThumbnailImageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'largeThumbnailImageHeight':
          result.largeThumbnailImageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'smallThumbnailImageURL':
          result.smallThumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'smallThumbnailImageWidth':
          result.smallThumbnailImageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'smallThumbnailImageHeight':
          result.smallThumbnailImageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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

class _$GDailyThemesData extends GDailyThemesData {
  @override
  final String G__typename;
  @override
  final BuiltList<GDailyThemesData_dailyThemes> dailyThemes;

  factory _$GDailyThemesData(
          [void Function(GDailyThemesDataBuilder)? updates]) =>
      (new GDailyThemesDataBuilder()..update(updates))._build();

  _$GDailyThemesData._({required this.G__typename, required this.dailyThemes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemesData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        dailyThemes, r'GDailyThemesData', 'dailyThemes');
  }

  @override
  GDailyThemesData rebuild(void Function(GDailyThemesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemesDataBuilder toBuilder() =>
      new GDailyThemesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemesData &&
        G__typename == other.G__typename &&
        dailyThemes == other.dailyThemes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, dailyThemes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemesData')
          ..add('G__typename', G__typename)
          ..add('dailyThemes', dailyThemes))
        .toString();
  }
}

class GDailyThemesDataBuilder
    implements Builder<GDailyThemesData, GDailyThemesDataBuilder> {
  _$GDailyThemesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GDailyThemesData_dailyThemes>? _dailyThemes;
  ListBuilder<GDailyThemesData_dailyThemes> get dailyThemes =>
      _$this._dailyThemes ??= new ListBuilder<GDailyThemesData_dailyThemes>();
  set dailyThemes(ListBuilder<GDailyThemesData_dailyThemes>? dailyThemes) =>
      _$this._dailyThemes = dailyThemes;

  GDailyThemesDataBuilder() {
    GDailyThemesData._initializeBuilder(this);
  }

  GDailyThemesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _dailyThemes = $v.dailyThemes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemesData;
  }

  @override
  void update(void Function(GDailyThemesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemesData build() => _build();

  _$GDailyThemesData _build() {
    _$GDailyThemesData _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDailyThemesData', 'G__typename'),
              dailyThemes: dailyThemes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dailyThemes';
        dailyThemes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemesData_dailyThemes extends GDailyThemesData_dailyThemes {
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
  final GDailyThemesData_dailyThemes_firstWork? firstWork;

  factory _$GDailyThemesData_dailyThemes(
          [void Function(GDailyThemesData_dailyThemesBuilder)? updates]) =>
      (new GDailyThemesData_dailyThemesBuilder()..update(updates))._build();

  _$GDailyThemesData_dailyThemes._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.dateText,
      required this.year,
      required this.month,
      required this.day,
      required this.worksCount,
      this.firstWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemesData_dailyThemes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemesData_dailyThemes', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GDailyThemesData_dailyThemes', 'title');
    BuiltValueNullFieldError.checkNotNull(
        dateText, r'GDailyThemesData_dailyThemes', 'dateText');
    BuiltValueNullFieldError.checkNotNull(
        year, r'GDailyThemesData_dailyThemes', 'year');
    BuiltValueNullFieldError.checkNotNull(
        month, r'GDailyThemesData_dailyThemes', 'month');
    BuiltValueNullFieldError.checkNotNull(
        day, r'GDailyThemesData_dailyThemes', 'day');
    BuiltValueNullFieldError.checkNotNull(
        worksCount, r'GDailyThemesData_dailyThemes', 'worksCount');
  }

  @override
  GDailyThemesData_dailyThemes rebuild(
          void Function(GDailyThemesData_dailyThemesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemesData_dailyThemesBuilder toBuilder() =>
      new GDailyThemesData_dailyThemesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemesData_dailyThemes &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        dateText == other.dateText &&
        year == other.year &&
        month == other.month &&
        day == other.day &&
        worksCount == other.worksCount &&
        firstWork == other.firstWork;
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
    _$hash = $jc(_$hash, firstWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemesData_dailyThemes')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('dateText', dateText)
          ..add('year', year)
          ..add('month', month)
          ..add('day', day)
          ..add('worksCount', worksCount)
          ..add('firstWork', firstWork))
        .toString();
  }
}

class GDailyThemesData_dailyThemesBuilder
    implements
        Builder<GDailyThemesData_dailyThemes,
            GDailyThemesData_dailyThemesBuilder> {
  _$GDailyThemesData_dailyThemes? _$v;

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

  GDailyThemesData_dailyThemes_firstWorkBuilder? _firstWork;
  GDailyThemesData_dailyThemes_firstWorkBuilder get firstWork =>
      _$this._firstWork ??= new GDailyThemesData_dailyThemes_firstWorkBuilder();
  set firstWork(GDailyThemesData_dailyThemes_firstWorkBuilder? firstWork) =>
      _$this._firstWork = firstWork;

  GDailyThemesData_dailyThemesBuilder() {
    GDailyThemesData_dailyThemes._initializeBuilder(this);
  }

  GDailyThemesData_dailyThemesBuilder get _$this {
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
      _firstWork = $v.firstWork?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemesData_dailyThemes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemesData_dailyThemes;
  }

  @override
  void update(void Function(GDailyThemesData_dailyThemesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemesData_dailyThemes build() => _build();

  _$GDailyThemesData_dailyThemes _build() {
    _$GDailyThemesData_dailyThemes _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemesData_dailyThemes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDailyThemesData_dailyThemes', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GDailyThemesData_dailyThemes', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GDailyThemesData_dailyThemes', 'title'),
              dateText: BuiltValueNullFieldError.checkNotNull(
                  dateText, r'GDailyThemesData_dailyThemes', 'dateText'),
              year: BuiltValueNullFieldError.checkNotNull(
                  year, r'GDailyThemesData_dailyThemes', 'year'),
              month: BuiltValueNullFieldError.checkNotNull(
                  month, r'GDailyThemesData_dailyThemes', 'month'),
              day: BuiltValueNullFieldError.checkNotNull(
                  day, r'GDailyThemesData_dailyThemes', 'day'),
              worksCount: BuiltValueNullFieldError.checkNotNull(
                  worksCount, r'GDailyThemesData_dailyThemes', 'worksCount'),
              firstWork: _firstWork?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'firstWork';
        _firstWork?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemesData_dailyThemes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemesData_dailyThemes_firstWork
    extends GDailyThemesData_dailyThemes_firstWork {
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
  final String imageURL;
  @override
  final int imageWidth;
  @override
  final int imageHeight;
  @override
  final String largeThumbnailImageURL;
  @override
  final int largeThumbnailImageWidth;
  @override
  final int largeThumbnailImageHeight;
  @override
  final String smallThumbnailImageURL;
  @override
  final int smallThumbnailImageWidth;
  @override
  final int smallThumbnailImageHeight;
  @override
  final double? thumbnailImagePosition;
  @override
  final double imageAspectRatio;

  factory _$GDailyThemesData_dailyThemes_firstWork(
          [void Function(GDailyThemesData_dailyThemes_firstWorkBuilder)?
              updates]) =>
      (new GDailyThemesData_dailyThemes_firstWorkBuilder()..update(updates))
          ._build();

  _$GDailyThemesData_dailyThemes_firstWork._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageURL,
      required this.imageWidth,
      required this.imageHeight,
      required this.largeThumbnailImageURL,
      required this.largeThumbnailImageWidth,
      required this.largeThumbnailImageHeight,
      required this.smallThumbnailImageURL,
      required this.smallThumbnailImageWidth,
      required this.smallThumbnailImageHeight,
      this.thumbnailImagePosition,
      required this.imageAspectRatio})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemesData_dailyThemes_firstWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemesData_dailyThemes_firstWork', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GDailyThemesData_dailyThemes_firstWork', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GDailyThemesData_dailyThemes_firstWork', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GDailyThemesData_dailyThemes_firstWork', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GDailyThemesData_dailyThemes_firstWork', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GDailyThemesData_dailyThemes_firstWork', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        imageWidth, r'GDailyThemesData_dailyThemes_firstWork', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(
        imageHeight, r'GDailyThemesData_dailyThemes_firstWork', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL,
        r'GDailyThemesData_dailyThemes_firstWork', 'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth,
        r'GDailyThemesData_dailyThemes_firstWork', 'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight,
        r'GDailyThemesData_dailyThemes_firstWork', 'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL,
        r'GDailyThemesData_dailyThemes_firstWork', 'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth,
        r'GDailyThemesData_dailyThemes_firstWork', 'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight,
        r'GDailyThemesData_dailyThemes_firstWork', 'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GDailyThemesData_dailyThemes_firstWork', 'imageAspectRatio');
  }

  @override
  GDailyThemesData_dailyThemes_firstWork rebuild(
          void Function(GDailyThemesData_dailyThemes_firstWorkBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemesData_dailyThemes_firstWorkBuilder toBuilder() =>
      new GDailyThemesData_dailyThemes_firstWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemesData_dailyThemes_firstWork &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        imageURL == other.imageURL &&
        imageWidth == other.imageWidth &&
        imageHeight == other.imageHeight &&
        largeThumbnailImageURL == other.largeThumbnailImageURL &&
        largeThumbnailImageWidth == other.largeThumbnailImageWidth &&
        largeThumbnailImageHeight == other.largeThumbnailImageHeight &&
        smallThumbnailImageURL == other.smallThumbnailImageURL &&
        smallThumbnailImageWidth == other.smallThumbnailImageWidth &&
        smallThumbnailImageHeight == other.smallThumbnailImageHeight &&
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
    _$hash = $jc(_$hash, imageURL.hashCode);
    _$hash = $jc(_$hash, imageWidth.hashCode);
    _$hash = $jc(_$hash, imageHeight.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageWidth.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageHeight.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageWidth.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageHeight.hashCode);
    _$hash = $jc(_$hash, thumbnailImagePosition.hashCode);
    _$hash = $jc(_$hash, imageAspectRatio.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GDailyThemesData_dailyThemes_firstWork')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('imageURL', imageURL)
          ..add('imageWidth', imageWidth)
          ..add('imageHeight', imageHeight)
          ..add('largeThumbnailImageURL', largeThumbnailImageURL)
          ..add('largeThumbnailImageWidth', largeThumbnailImageWidth)
          ..add('largeThumbnailImageHeight', largeThumbnailImageHeight)
          ..add('smallThumbnailImageURL', smallThumbnailImageURL)
          ..add('smallThumbnailImageWidth', smallThumbnailImageWidth)
          ..add('smallThumbnailImageHeight', smallThumbnailImageHeight)
          ..add('thumbnailImagePosition', thumbnailImagePosition)
          ..add('imageAspectRatio', imageAspectRatio))
        .toString();
  }
}

class GDailyThemesData_dailyThemes_firstWorkBuilder
    implements
        Builder<GDailyThemesData_dailyThemes_firstWork,
            GDailyThemesData_dailyThemes_firstWorkBuilder> {
  _$GDailyThemesData_dailyThemes_firstWork? _$v;

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

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

  int? _imageWidth;
  int? get imageWidth => _$this._imageWidth;
  set imageWidth(int? imageWidth) => _$this._imageWidth = imageWidth;

  int? _imageHeight;
  int? get imageHeight => _$this._imageHeight;
  set imageHeight(int? imageHeight) => _$this._imageHeight = imageHeight;

  String? _largeThumbnailImageURL;
  String? get largeThumbnailImageURL => _$this._largeThumbnailImageURL;
  set largeThumbnailImageURL(String? largeThumbnailImageURL) =>
      _$this._largeThumbnailImageURL = largeThumbnailImageURL;

  int? _largeThumbnailImageWidth;
  int? get largeThumbnailImageWidth => _$this._largeThumbnailImageWidth;
  set largeThumbnailImageWidth(int? largeThumbnailImageWidth) =>
      _$this._largeThumbnailImageWidth = largeThumbnailImageWidth;

  int? _largeThumbnailImageHeight;
  int? get largeThumbnailImageHeight => _$this._largeThumbnailImageHeight;
  set largeThumbnailImageHeight(int? largeThumbnailImageHeight) =>
      _$this._largeThumbnailImageHeight = largeThumbnailImageHeight;

  String? _smallThumbnailImageURL;
  String? get smallThumbnailImageURL => _$this._smallThumbnailImageURL;
  set smallThumbnailImageURL(String? smallThumbnailImageURL) =>
      _$this._smallThumbnailImageURL = smallThumbnailImageURL;

  int? _smallThumbnailImageWidth;
  int? get smallThumbnailImageWidth => _$this._smallThumbnailImageWidth;
  set smallThumbnailImageWidth(int? smallThumbnailImageWidth) =>
      _$this._smallThumbnailImageWidth = smallThumbnailImageWidth;

  int? _smallThumbnailImageHeight;
  int? get smallThumbnailImageHeight => _$this._smallThumbnailImageHeight;
  set smallThumbnailImageHeight(int? smallThumbnailImageHeight) =>
      _$this._smallThumbnailImageHeight = smallThumbnailImageHeight;

  double? _thumbnailImagePosition;
  double? get thumbnailImagePosition => _$this._thumbnailImagePosition;
  set thumbnailImagePosition(double? thumbnailImagePosition) =>
      _$this._thumbnailImagePosition = thumbnailImagePosition;

  double? _imageAspectRatio;
  double? get imageAspectRatio => _$this._imageAspectRatio;
  set imageAspectRatio(double? imageAspectRatio) =>
      _$this._imageAspectRatio = imageAspectRatio;

  GDailyThemesData_dailyThemes_firstWorkBuilder() {
    GDailyThemesData_dailyThemes_firstWork._initializeBuilder(this);
  }

  GDailyThemesData_dailyThemes_firstWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _imageURL = $v.imageURL;
      _imageWidth = $v.imageWidth;
      _imageHeight = $v.imageHeight;
      _largeThumbnailImageURL = $v.largeThumbnailImageURL;
      _largeThumbnailImageWidth = $v.largeThumbnailImageWidth;
      _largeThumbnailImageHeight = $v.largeThumbnailImageHeight;
      _smallThumbnailImageURL = $v.smallThumbnailImageURL;
      _smallThumbnailImageWidth = $v.smallThumbnailImageWidth;
      _smallThumbnailImageHeight = $v.smallThumbnailImageHeight;
      _thumbnailImagePosition = $v.thumbnailImagePosition;
      _imageAspectRatio = $v.imageAspectRatio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemesData_dailyThemes_firstWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemesData_dailyThemes_firstWork;
  }

  @override
  void update(
      void Function(GDailyThemesData_dailyThemes_firstWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemesData_dailyThemes_firstWork build() => _build();

  _$GDailyThemesData_dailyThemes_firstWork _build() {
    final _$result = _$v ??
        new _$GDailyThemesData_dailyThemes_firstWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GDailyThemesData_dailyThemes_firstWork', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDailyThemesData_dailyThemes_firstWork', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GDailyThemesData_dailyThemes_firstWork', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GDailyThemesData_dailyThemes_firstWork', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GDailyThemesData_dailyThemes_firstWork', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GDailyThemesData_dailyThemes_firstWork', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GDailyThemesData_dailyThemes_firstWork', 'imageURL'),
            imageWidth: BuiltValueNullFieldError.checkNotNull(imageWidth, r'GDailyThemesData_dailyThemes_firstWork', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GDailyThemesData_dailyThemes_firstWork', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GDailyThemesData_dailyThemes_firstWork', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GDailyThemesData_dailyThemes_firstWork', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GDailyThemesData_dailyThemes_firstWork', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GDailyThemesData_dailyThemes_firstWork', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GDailyThemesData_dailyThemes_firstWork', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GDailyThemesData_dailyThemes_firstWork', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GDailyThemesData_dailyThemes_firstWork', 'imageAspectRatio'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
