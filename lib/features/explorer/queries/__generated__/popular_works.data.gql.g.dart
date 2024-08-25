// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPopularWorksData> _$gPopularWorksDataSerializer =
    new _$GPopularWorksDataSerializer();
Serializer<GPopularWorksData_popularWorks>
    _$gPopularWorksDataPopularWorksSerializer =
    new _$GPopularWorksData_popularWorksSerializer();

class _$GPopularWorksDataSerializer
    implements StructuredSerializer<GPopularWorksData> {
  @override
  final Iterable<Type> types = const [GPopularWorksData, _$GPopularWorksData];
  @override
  final String wireName = 'GPopularWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPopularWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'popularWorks',
      serializers.serialize(object.popularWorks,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPopularWorksData_popularWorks)])),
    ];

    return result;
  }

  @override
  GPopularWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPopularWorksDataBuilder();

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
        case 'popularWorks':
          result.popularWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPopularWorksData_popularWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPopularWorksData_popularWorksSerializer
    implements StructuredSerializer<GPopularWorksData_popularWorks> {
  @override
  final Iterable<Type> types = const [
    GPopularWorksData_popularWorks,
    _$GPopularWorksData_popularWorks
  ];
  @override
  final String wireName = 'GPopularWorksData_popularWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPopularWorksData_popularWorks object,
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
  GPopularWorksData_popularWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPopularWorksData_popularWorksBuilder();

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

class _$GPopularWorksData extends GPopularWorksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GPopularWorksData_popularWorks> popularWorks;

  factory _$GPopularWorksData(
          [void Function(GPopularWorksDataBuilder)? updates]) =>
      (new GPopularWorksDataBuilder()..update(updates))._build();

  _$GPopularWorksData._({required this.G__typename, required this.popularWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPopularWorksData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        popularWorks, r'GPopularWorksData', 'popularWorks');
  }

  @override
  GPopularWorksData rebuild(void Function(GPopularWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPopularWorksDataBuilder toBuilder() =>
      new GPopularWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPopularWorksData &&
        G__typename == other.G__typename &&
        popularWorks == other.popularWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, popularWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPopularWorksData')
          ..add('G__typename', G__typename)
          ..add('popularWorks', popularWorks))
        .toString();
  }
}

class GPopularWorksDataBuilder
    implements Builder<GPopularWorksData, GPopularWorksDataBuilder> {
  _$GPopularWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPopularWorksData_popularWorks>? _popularWorks;
  ListBuilder<GPopularWorksData_popularWorks> get popularWorks =>
      _$this._popularWorks ??=
          new ListBuilder<GPopularWorksData_popularWorks>();
  set popularWorks(ListBuilder<GPopularWorksData_popularWorks>? popularWorks) =>
      _$this._popularWorks = popularWorks;

  GPopularWorksDataBuilder() {
    GPopularWorksData._initializeBuilder(this);
  }

  GPopularWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _popularWorks = $v.popularWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPopularWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPopularWorksData;
  }

  @override
  void update(void Function(GPopularWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPopularWorksData build() => _build();

  _$GPopularWorksData _build() {
    _$GPopularWorksData _$result;
    try {
      _$result = _$v ??
          new _$GPopularWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPopularWorksData', 'G__typename'),
              popularWorks: popularWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'popularWorks';
        popularWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPopularWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPopularWorksData_popularWorks extends GPopularWorksData_popularWorks {
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

  factory _$GPopularWorksData_popularWorks(
          [void Function(GPopularWorksData_popularWorksBuilder)? updates]) =>
      (new GPopularWorksData_popularWorksBuilder()..update(updates))._build();

  _$GPopularWorksData_popularWorks._(
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
        G__typename, r'GPopularWorksData_popularWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPopularWorksData_popularWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPopularWorksData_popularWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GPopularWorksData_popularWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GPopularWorksData_popularWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GPopularWorksData_popularWorks', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GPopularWorksData_popularWorks', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        imageWidth, r'GPopularWorksData_popularWorks', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(
        imageHeight, r'GPopularWorksData_popularWorks', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL,
        r'GPopularWorksData_popularWorks', 'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth,
        r'GPopularWorksData_popularWorks', 'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight,
        r'GPopularWorksData_popularWorks', 'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL,
        r'GPopularWorksData_popularWorks', 'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth,
        r'GPopularWorksData_popularWorks', 'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight,
        r'GPopularWorksData_popularWorks', 'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GPopularWorksData_popularWorks', 'imageAspectRatio');
  }

  @override
  GPopularWorksData_popularWorks rebuild(
          void Function(GPopularWorksData_popularWorksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPopularWorksData_popularWorksBuilder toBuilder() =>
      new GPopularWorksData_popularWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPopularWorksData_popularWorks &&
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
    return (newBuiltValueToStringHelper(r'GPopularWorksData_popularWorks')
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

class GPopularWorksData_popularWorksBuilder
    implements
        Builder<GPopularWorksData_popularWorks,
            GPopularWorksData_popularWorksBuilder> {
  _$GPopularWorksData_popularWorks? _$v;

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

  GPopularWorksData_popularWorksBuilder() {
    GPopularWorksData_popularWorks._initializeBuilder(this);
  }

  GPopularWorksData_popularWorksBuilder get _$this {
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
  void replace(GPopularWorksData_popularWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPopularWorksData_popularWorks;
  }

  @override
  void update(void Function(GPopularWorksData_popularWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPopularWorksData_popularWorks build() => _build();

  _$GPopularWorksData_popularWorks _build() {
    final _$result = _$v ??
        new _$GPopularWorksData_popularWorks._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPopularWorksData_popularWorks', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPopularWorksData_popularWorks', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GPopularWorksData_popularWorks', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GPopularWorksData_popularWorks', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GPopularWorksData_popularWorks', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GPopularWorksData_popularWorks', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GPopularWorksData_popularWorks', 'imageURL'),
            imageWidth:
                BuiltValueNullFieldError.checkNotNull(imageWidth, r'GPopularWorksData_popularWorks', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GPopularWorksData_popularWorks', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GPopularWorksData_popularWorks', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GPopularWorksData_popularWorks', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GPopularWorksData_popularWorks', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GPopularWorksData_popularWorks', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GPopularWorksData_popularWorks', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GPopularWorksData_popularWorks', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GPopularWorksData_popularWorks', 'imageAspectRatio'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
