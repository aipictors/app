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
Serializer<GDailyThemesData_dailyThemes_firstWork_image>
    _$gDailyThemesDataDailyThemesFirstWorkImageSerializer =
    new _$GDailyThemesData_dailyThemes_firstWork_imageSerializer();
Serializer<GDailyThemesData_dailyThemes_firstWork_thumbnailImage>
    _$gDailyThemesDataDailyThemesFirstWorkThumbnailImageSerializer =
    new _$GDailyThemesData_dailyThemes_firstWork_thumbnailImageSerializer();

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
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GDailyThemesData_dailyThemes_firstWork_image)));
    }
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GDailyThemesData_dailyThemes_firstWork_thumbnailImage)));
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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GDailyThemesData_dailyThemes_firstWork_image))!
              as GDailyThemesData_dailyThemes_firstWork_image);
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GDailyThemesData_dailyThemes_firstWork_thumbnailImage))!
              as GDailyThemesData_dailyThemes_firstWork_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemesData_dailyThemes_firstWork_imageSerializer
    implements
        StructuredSerializer<GDailyThemesData_dailyThemes_firstWork_image> {
  @override
  final Iterable<Type> types = const [
    GDailyThemesData_dailyThemes_firstWork_image,
    _$GDailyThemesData_dailyThemes_firstWork_image
  ];
  @override
  final String wireName = 'GDailyThemesData_dailyThemes_firstWork_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GDailyThemesData_dailyThemes_firstWork_image object,
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
  GDailyThemesData_dailyThemes_firstWork_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemesData_dailyThemes_firstWork_imageBuilder();

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

class _$GDailyThemesData_dailyThemes_firstWork_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GDailyThemesData_dailyThemes_firstWork_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GDailyThemesData_dailyThemes_firstWork_thumbnailImage,
    _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage
  ];
  @override
  final String wireName =
      'GDailyThemesData_dailyThemes_firstWork_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GDailyThemesData_dailyThemes_firstWork_thumbnailImage object,
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
  GDailyThemesData_dailyThemes_firstWork_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder();

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
  final GDailyThemesData_dailyThemes_firstWork_image? image;
  @override
  final GDailyThemesData_dailyThemes_firstWork_thumbnailImage? thumbnailImage;

  factory _$GDailyThemesData_dailyThemes_firstWork(
          [void Function(GDailyThemesData_dailyThemes_firstWorkBuilder)?
              updates]) =>
      (new GDailyThemesData_dailyThemes_firstWorkBuilder()..update(updates))
          ._build();

  _$GDailyThemesData_dailyThemes_firstWork._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemesData_dailyThemes_firstWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemesData_dailyThemes_firstWork', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GDailyThemesData_dailyThemes_firstWork', 'title');
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
        image == other.image &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
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
          ..add('image', image)
          ..add('thumbnailImage', thumbnailImage))
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

  GDailyThemesData_dailyThemes_firstWork_imageBuilder? _image;
  GDailyThemesData_dailyThemes_firstWork_imageBuilder get image =>
      _$this._image ??=
          new GDailyThemesData_dailyThemes_firstWork_imageBuilder();
  set image(GDailyThemesData_dailyThemes_firstWork_imageBuilder? image) =>
      _$this._image = image;

  GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder? _thumbnailImage;
  GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder();
  set thumbnailImage(
          GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GDailyThemesData_dailyThemes_firstWorkBuilder() {
    GDailyThemesData_dailyThemes_firstWork._initializeBuilder(this);
  }

  GDailyThemesData_dailyThemes_firstWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _image = $v.image?.toBuilder();
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
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
    _$GDailyThemesData_dailyThemes_firstWork _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemesData_dailyThemes_firstWork._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GDailyThemesData_dailyThemes_firstWork', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GDailyThemesData_dailyThemes_firstWork', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GDailyThemesData_dailyThemes_firstWork', 'title'),
              image: _image?.build(),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemesData_dailyThemes_firstWork',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemesData_dailyThemes_firstWork_image
    extends GDailyThemesData_dailyThemes_firstWork_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GDailyThemesData_dailyThemes_firstWork_image(
          [void Function(GDailyThemesData_dailyThemes_firstWork_imageBuilder)?
              updates]) =>
      (new GDailyThemesData_dailyThemes_firstWork_imageBuilder()
            ..update(updates))
          ._build();

  _$GDailyThemesData_dailyThemes_firstWork_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GDailyThemesData_dailyThemes_firstWork_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemesData_dailyThemes_firstWork_image', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GDailyThemesData_dailyThemes_firstWork_image', 'downloadURL');
  }

  @override
  GDailyThemesData_dailyThemes_firstWork_image rebuild(
          void Function(GDailyThemesData_dailyThemes_firstWork_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemesData_dailyThemes_firstWork_imageBuilder toBuilder() =>
      new GDailyThemesData_dailyThemes_firstWork_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemesData_dailyThemes_firstWork_image &&
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
            r'GDailyThemesData_dailyThemes_firstWork_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GDailyThemesData_dailyThemes_firstWork_imageBuilder
    implements
        Builder<GDailyThemesData_dailyThemes_firstWork_image,
            GDailyThemesData_dailyThemes_firstWork_imageBuilder> {
  _$GDailyThemesData_dailyThemes_firstWork_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GDailyThemesData_dailyThemes_firstWork_imageBuilder() {
    GDailyThemesData_dailyThemes_firstWork_image._initializeBuilder(this);
  }

  GDailyThemesData_dailyThemes_firstWork_imageBuilder get _$this {
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
  void replace(GDailyThemesData_dailyThemes_firstWork_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemesData_dailyThemes_firstWork_image;
  }

  @override
  void update(
      void Function(GDailyThemesData_dailyThemes_firstWork_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemesData_dailyThemes_firstWork_image build() => _build();

  _$GDailyThemesData_dailyThemes_firstWork_image _build() {
    final _$result = _$v ??
        new _$GDailyThemesData_dailyThemes_firstWork_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDailyThemesData_dailyThemes_firstWork_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDailyThemesData_dailyThemes_firstWork_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GDailyThemesData_dailyThemes_firstWork_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage
    extends GDailyThemesData_dailyThemes_firstWork_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage(
          [void Function(
                  GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder)?
              updates]) =>
      (new GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GDailyThemesData_dailyThemes_firstWork_thumbnailImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemesData_dailyThemes_firstWork_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GDailyThemesData_dailyThemes_firstWork_thumbnailImage',
        'downloadURL');
  }

  @override
  GDailyThemesData_dailyThemes_firstWork_thumbnailImage rebuild(
          void Function(
                  GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder toBuilder() =>
      new GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemesData_dailyThemes_firstWork_thumbnailImage &&
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
            r'GDailyThemesData_dailyThemes_firstWork_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder
    implements
        Builder<GDailyThemesData_dailyThemes_firstWork_thumbnailImage,
            GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder> {
  _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder() {
    GDailyThemesData_dailyThemes_firstWork_thumbnailImage._initializeBuilder(
        this);
  }

  GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder get _$this {
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
  void replace(GDailyThemesData_dailyThemes_firstWork_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage;
  }

  @override
  void update(
      void Function(
              GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemesData_dailyThemes_firstWork_thumbnailImage build() => _build();

  _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GDailyThemesData_dailyThemes_firstWork_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GDailyThemesData_dailyThemes_firstWork_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GDailyThemesData_dailyThemes_firstWork_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
