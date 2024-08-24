// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_award_notification_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkAwardNotificationFieldsData>
    _$gWorkAwardNotificationFieldsDataSerializer =
    new _$GWorkAwardNotificationFieldsDataSerializer();
Serializer<GWorkAwardNotificationFieldsData_work>
    _$gWorkAwardNotificationFieldsDataWorkSerializer =
    new _$GWorkAwardNotificationFieldsData_workSerializer();

class _$GWorkAwardNotificationFieldsDataSerializer
    implements StructuredSerializer<GWorkAwardNotificationFieldsData> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardNotificationFieldsData,
    _$GWorkAwardNotificationFieldsData
  ];
  @override
  final String wireName = 'GWorkAwardNotificationFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardNotificationFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.work;
    if (value != null) {
      result
        ..add('work')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkAwardNotificationFieldsData_work)));
    }
    return result;
  }

  @override
  GWorkAwardNotificationFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardNotificationFieldsDataBuilder();

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
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkAwardNotificationFieldsData_work))!
              as GWorkAwardNotificationFieldsData_work);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardNotificationFieldsData_workSerializer
    implements StructuredSerializer<GWorkAwardNotificationFieldsData_work> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardNotificationFieldsData_work,
    _$GWorkAwardNotificationFieldsData_work
  ];
  @override
  final String wireName = 'GWorkAwardNotificationFieldsData_work';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardNotificationFieldsData_work object,
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
  GWorkAwardNotificationFieldsData_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardNotificationFieldsData_workBuilder();

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

class _$GWorkAwardNotificationFieldsData
    extends GWorkAwardNotificationFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String? message;
  @override
  final GWorkAwardNotificationFieldsData_work? work;

  factory _$GWorkAwardNotificationFieldsData(
          [void Function(GWorkAwardNotificationFieldsDataBuilder)? updates]) =>
      (new GWorkAwardNotificationFieldsDataBuilder()..update(updates))._build();

  _$GWorkAwardNotificationFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      this.message,
      this.work})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkAwardNotificationFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardNotificationFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkAwardNotificationFieldsData', 'createdAt');
  }

  @override
  GWorkAwardNotificationFieldsData rebuild(
          void Function(GWorkAwardNotificationFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardNotificationFieldsDataBuilder toBuilder() =>
      new GWorkAwardNotificationFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardNotificationFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        message == other.message &&
        work == other.work;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkAwardNotificationFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('message', message)
          ..add('work', work))
        .toString();
  }
}

class GWorkAwardNotificationFieldsDataBuilder
    implements
        Builder<GWorkAwardNotificationFieldsData,
            GWorkAwardNotificationFieldsDataBuilder> {
  _$GWorkAwardNotificationFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  GWorkAwardNotificationFieldsData_workBuilder? _work;
  GWorkAwardNotificationFieldsData_workBuilder get work =>
      _$this._work ??= new GWorkAwardNotificationFieldsData_workBuilder();
  set work(GWorkAwardNotificationFieldsData_workBuilder? work) =>
      _$this._work = work;

  GWorkAwardNotificationFieldsDataBuilder() {
    GWorkAwardNotificationFieldsData._initializeBuilder(this);
  }

  GWorkAwardNotificationFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _message = $v.message;
      _work = $v.work?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkAwardNotificationFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardNotificationFieldsData;
  }

  @override
  void update(void Function(GWorkAwardNotificationFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardNotificationFieldsData build() => _build();

  _$GWorkAwardNotificationFieldsData _build() {
    _$GWorkAwardNotificationFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardNotificationFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkAwardNotificationFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkAwardNotificationFieldsData', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GWorkAwardNotificationFieldsData', 'createdAt'),
              message: message,
              work: _work?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        _work?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardNotificationFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardNotificationFieldsData_work
    extends GWorkAwardNotificationFieldsData_work {
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

  factory _$GWorkAwardNotificationFieldsData_work(
          [void Function(GWorkAwardNotificationFieldsData_workBuilder)?
              updates]) =>
      (new GWorkAwardNotificationFieldsData_workBuilder()..update(updates))
          ._build();

  _$GWorkAwardNotificationFieldsData_work._(
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
        G__typename, r'GWorkAwardNotificationFieldsData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardNotificationFieldsData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkAwardNotificationFieldsData_work', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GWorkAwardNotificationFieldsData_work', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GWorkAwardNotificationFieldsData_work', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkAwardNotificationFieldsData_work', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GWorkAwardNotificationFieldsData_work', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        imageWidth, r'GWorkAwardNotificationFieldsData_work', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(
        imageHeight, r'GWorkAwardNotificationFieldsData_work', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL,
        r'GWorkAwardNotificationFieldsData_work', 'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth,
        r'GWorkAwardNotificationFieldsData_work', 'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight,
        r'GWorkAwardNotificationFieldsData_work', 'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL,
        r'GWorkAwardNotificationFieldsData_work', 'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth,
        r'GWorkAwardNotificationFieldsData_work', 'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight,
        r'GWorkAwardNotificationFieldsData_work', 'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GWorkAwardNotificationFieldsData_work', 'imageAspectRatio');
  }

  @override
  GWorkAwardNotificationFieldsData_work rebuild(
          void Function(GWorkAwardNotificationFieldsData_workBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardNotificationFieldsData_workBuilder toBuilder() =>
      new GWorkAwardNotificationFieldsData_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardNotificationFieldsData_work &&
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
            r'GWorkAwardNotificationFieldsData_work')
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

class GWorkAwardNotificationFieldsData_workBuilder
    implements
        Builder<GWorkAwardNotificationFieldsData_work,
            GWorkAwardNotificationFieldsData_workBuilder> {
  _$GWorkAwardNotificationFieldsData_work? _$v;

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

  GWorkAwardNotificationFieldsData_workBuilder() {
    GWorkAwardNotificationFieldsData_work._initializeBuilder(this);
  }

  GWorkAwardNotificationFieldsData_workBuilder get _$this {
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
  void replace(GWorkAwardNotificationFieldsData_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardNotificationFieldsData_work;
  }

  @override
  void update(
      void Function(GWorkAwardNotificationFieldsData_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardNotificationFieldsData_work build() => _build();

  _$GWorkAwardNotificationFieldsData_work _build() {
    final _$result = _$v ??
        new _$GWorkAwardNotificationFieldsData_work._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkAwardNotificationFieldsData_work', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkAwardNotificationFieldsData_work', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GWorkAwardNotificationFieldsData_work', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GWorkAwardNotificationFieldsData_work', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GWorkAwardNotificationFieldsData_work', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GWorkAwardNotificationFieldsData_work', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GWorkAwardNotificationFieldsData_work', 'imageURL'),
            imageWidth: BuiltValueNullFieldError.checkNotNull(imageWidth, r'GWorkAwardNotificationFieldsData_work', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GWorkAwardNotificationFieldsData_work', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GWorkAwardNotificationFieldsData_work', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GWorkAwardNotificationFieldsData_work', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GWorkAwardNotificationFieldsData_work', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GWorkAwardNotificationFieldsData_work', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GWorkAwardNotificationFieldsData_work', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GWorkAwardNotificationFieldsData_work', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GWorkAwardNotificationFieldsData_work', 'imageAspectRatio'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
