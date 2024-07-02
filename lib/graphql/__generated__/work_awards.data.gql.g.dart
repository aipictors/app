// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_awards.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkAwardsData> _$gWorkAwardsDataSerializer =
    new _$GWorkAwardsDataSerializer();
Serializer<GWorkAwardsData_workAwards> _$gWorkAwardsDataWorkAwardsSerializer =
    new _$GWorkAwardsData_workAwardsSerializer();
Serializer<GWorkAwardsData_workAwards_work>
    _$gWorkAwardsDataWorkAwardsWorkSerializer =
    new _$GWorkAwardsData_workAwards_workSerializer();

class _$GWorkAwardsDataSerializer
    implements StructuredSerializer<GWorkAwardsData> {
  @override
  final Iterable<Type> types = const [GWorkAwardsData, _$GWorkAwardsData];
  @override
  final String wireName = 'GWorkAwardsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorkAwardsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'workAwards',
      serializers.serialize(object.workAwards,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GWorkAwardsData_workAwards)])),
    ];

    return result;
  }

  @override
  GWorkAwardsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsDataBuilder();

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
        case 'workAwards':
          result.workAwards.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GWorkAwardsData_workAwards)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardsData_workAwardsSerializer
    implements StructuredSerializer<GWorkAwardsData_workAwards> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardsData_workAwards,
    _$GWorkAwardsData_workAwards
  ];
  @override
  final String wireName = 'GWorkAwardsData_workAwards';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardsData_workAwards object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
      'dateText',
      serializers.serialize(object.dateText,
          specifiedType: const FullType(String)),
      'work',
      serializers.serialize(object.work,
          specifiedType: const FullType(GWorkAwardsData_workAwards_work)),
    ];

    return result;
  }

  @override
  GWorkAwardsData_workAwards deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsData_workAwardsBuilder();

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
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'dateText':
          result.dateText = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkAwardsData_workAwards_work))!
              as GWorkAwardsData_workAwards_work);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardsData_workAwards_workSerializer
    implements StructuredSerializer<GWorkAwardsData_workAwards_work> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardsData_workAwards_work,
    _$GWorkAwardsData_workAwards_work
  ];
  @override
  final String wireName = 'GWorkAwardsData_workAwards_work';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardsData_workAwards_work object,
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
  GWorkAwardsData_workAwards_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsData_workAwards_workBuilder();

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

class _$GWorkAwardsData extends GWorkAwardsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GWorkAwardsData_workAwards> workAwards;

  factory _$GWorkAwardsData([void Function(GWorkAwardsDataBuilder)? updates]) =>
      (new GWorkAwardsDataBuilder()..update(updates))._build();

  _$GWorkAwardsData._({required this.G__typename, required this.workAwards})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkAwardsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        workAwards, r'GWorkAwardsData', 'workAwards');
  }

  @override
  GWorkAwardsData rebuild(void Function(GWorkAwardsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsDataBuilder toBuilder() =>
      new GWorkAwardsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsData &&
        G__typename == other.G__typename &&
        workAwards == other.workAwards;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, workAwards.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkAwardsData')
          ..add('G__typename', G__typename)
          ..add('workAwards', workAwards))
        .toString();
  }
}

class GWorkAwardsDataBuilder
    implements Builder<GWorkAwardsData, GWorkAwardsDataBuilder> {
  _$GWorkAwardsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GWorkAwardsData_workAwards>? _workAwards;
  ListBuilder<GWorkAwardsData_workAwards> get workAwards =>
      _$this._workAwards ??= new ListBuilder<GWorkAwardsData_workAwards>();
  set workAwards(ListBuilder<GWorkAwardsData_workAwards>? workAwards) =>
      _$this._workAwards = workAwards;

  GWorkAwardsDataBuilder() {
    GWorkAwardsData._initializeBuilder(this);
  }

  GWorkAwardsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _workAwards = $v.workAwards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkAwardsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsData;
  }

  @override
  void update(void Function(GWorkAwardsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsData build() => _build();

  _$GWorkAwardsData _build() {
    _$GWorkAwardsData _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkAwardsData', 'G__typename'),
              workAwards: workAwards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'workAwards';
        workAwards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardsData_workAwards extends GWorkAwardsData_workAwards {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int index;
  @override
  final String dateText;
  @override
  final GWorkAwardsData_workAwards_work work;

  factory _$GWorkAwardsData_workAwards(
          [void Function(GWorkAwardsData_workAwardsBuilder)? updates]) =>
      (new GWorkAwardsData_workAwardsBuilder()..update(updates))._build();

  _$GWorkAwardsData_workAwards._(
      {required this.G__typename,
      required this.id,
      required this.index,
      required this.dateText,
      required this.work})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkAwardsData_workAwards', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardsData_workAwards', 'id');
    BuiltValueNullFieldError.checkNotNull(
        index, r'GWorkAwardsData_workAwards', 'index');
    BuiltValueNullFieldError.checkNotNull(
        dateText, r'GWorkAwardsData_workAwards', 'dateText');
    BuiltValueNullFieldError.checkNotNull(
        work, r'GWorkAwardsData_workAwards', 'work');
  }

  @override
  GWorkAwardsData_workAwards rebuild(
          void Function(GWorkAwardsData_workAwardsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsData_workAwardsBuilder toBuilder() =>
      new GWorkAwardsData_workAwardsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsData_workAwards &&
        G__typename == other.G__typename &&
        id == other.id &&
        index == other.index &&
        dateText == other.dateText &&
        work == other.work;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jc(_$hash, dateText.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkAwardsData_workAwards')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('index', index)
          ..add('dateText', dateText)
          ..add('work', work))
        .toString();
  }
}

class GWorkAwardsData_workAwardsBuilder
    implements
        Builder<GWorkAwardsData_workAwards, GWorkAwardsData_workAwardsBuilder> {
  _$GWorkAwardsData_workAwards? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _dateText;
  String? get dateText => _$this._dateText;
  set dateText(String? dateText) => _$this._dateText = dateText;

  GWorkAwardsData_workAwards_workBuilder? _work;
  GWorkAwardsData_workAwards_workBuilder get work =>
      _$this._work ??= new GWorkAwardsData_workAwards_workBuilder();
  set work(GWorkAwardsData_workAwards_workBuilder? work) => _$this._work = work;

  GWorkAwardsData_workAwardsBuilder() {
    GWorkAwardsData_workAwards._initializeBuilder(this);
  }

  GWorkAwardsData_workAwardsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _index = $v.index;
      _dateText = $v.dateText;
      _work = $v.work.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkAwardsData_workAwards other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsData_workAwards;
  }

  @override
  void update(void Function(GWorkAwardsData_workAwardsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsData_workAwards build() => _build();

  _$GWorkAwardsData_workAwards _build() {
    _$GWorkAwardsData_workAwards _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardsData_workAwards._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkAwardsData_workAwards', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkAwardsData_workAwards', 'id'),
              index: BuiltValueNullFieldError.checkNotNull(
                  index, r'GWorkAwardsData_workAwards', 'index'),
              dateText: BuiltValueNullFieldError.checkNotNull(
                  dateText, r'GWorkAwardsData_workAwards', 'dateText'),
              work: work.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        work.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardsData_workAwards', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardsData_workAwards_work
    extends GWorkAwardsData_workAwards_work {
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

  factory _$GWorkAwardsData_workAwards_work(
          [void Function(GWorkAwardsData_workAwards_workBuilder)? updates]) =>
      (new GWorkAwardsData_workAwards_workBuilder()..update(updates))._build();

  _$GWorkAwardsData_workAwards_work._(
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
        G__typename, r'GWorkAwardsData_workAwards_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardsData_workAwards_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkAwardsData_workAwards_work', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GWorkAwardsData_workAwards_work', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GWorkAwardsData_workAwards_work', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkAwardsData_workAwards_work', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GWorkAwardsData_workAwards_work', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        imageWidth, r'GWorkAwardsData_workAwards_work', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(
        imageHeight, r'GWorkAwardsData_workAwards_work', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL,
        r'GWorkAwardsData_workAwards_work', 'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth,
        r'GWorkAwardsData_workAwards_work', 'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight,
        r'GWorkAwardsData_workAwards_work', 'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL,
        r'GWorkAwardsData_workAwards_work', 'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth,
        r'GWorkAwardsData_workAwards_work', 'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight,
        r'GWorkAwardsData_workAwards_work', 'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GWorkAwardsData_workAwards_work', 'imageAspectRatio');
  }

  @override
  GWorkAwardsData_workAwards_work rebuild(
          void Function(GWorkAwardsData_workAwards_workBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsData_workAwards_workBuilder toBuilder() =>
      new GWorkAwardsData_workAwards_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsData_workAwards_work &&
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
    return (newBuiltValueToStringHelper(r'GWorkAwardsData_workAwards_work')
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

class GWorkAwardsData_workAwards_workBuilder
    implements
        Builder<GWorkAwardsData_workAwards_work,
            GWorkAwardsData_workAwards_workBuilder> {
  _$GWorkAwardsData_workAwards_work? _$v;

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

  GWorkAwardsData_workAwards_workBuilder() {
    GWorkAwardsData_workAwards_work._initializeBuilder(this);
  }

  GWorkAwardsData_workAwards_workBuilder get _$this {
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
  void replace(GWorkAwardsData_workAwards_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsData_workAwards_work;
  }

  @override
  void update(void Function(GWorkAwardsData_workAwards_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsData_workAwards_work build() => _build();

  _$GWorkAwardsData_workAwards_work _build() {
    final _$result = _$v ??
        new _$GWorkAwardsData_workAwards_work._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkAwardsData_workAwards_work', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkAwardsData_workAwards_work', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GWorkAwardsData_workAwards_work', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GWorkAwardsData_workAwards_work', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GWorkAwardsData_workAwards_work', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GWorkAwardsData_workAwards_work', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GWorkAwardsData_workAwards_work', 'imageURL'),
            imageWidth:
                BuiltValueNullFieldError.checkNotNull(imageWidth, r'GWorkAwardsData_workAwards_work', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GWorkAwardsData_workAwards_work', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GWorkAwardsData_workAwards_work', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GWorkAwardsData_workAwards_work', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GWorkAwardsData_workAwards_work', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GWorkAwardsData_workAwards_work', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GWorkAwardsData_workAwards_work', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GWorkAwardsData_workAwards_work', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GWorkAwardsData_workAwards_work', 'imageAspectRatio'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
