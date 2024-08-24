// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_tags.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHotTagsData> _$gHotTagsDataSerializer =
    new _$GHotTagsDataSerializer();
Serializer<GHotTagsData_hotTags> _$gHotTagsDataHotTagsSerializer =
    new _$GHotTagsData_hotTagsSerializer();
Serializer<GHotTagsData_hotTags_firstWork>
    _$gHotTagsDataHotTagsFirstWorkSerializer =
    new _$GHotTagsData_hotTags_firstWorkSerializer();

class _$GHotTagsDataSerializer implements StructuredSerializer<GHotTagsData> {
  @override
  final Iterable<Type> types = const [GHotTagsData, _$GHotTagsData];
  @override
  final String wireName = 'GHotTagsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHotTagsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hotTags',
      serializers.serialize(object.hotTags,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GHotTagsData_hotTags)])),
    ];

    return result;
  }

  @override
  GHotTagsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsDataBuilder();

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
        case 'hotTags':
          result.hotTags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GHotTagsData_hotTags)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHotTagsData_hotTagsSerializer
    implements StructuredSerializer<GHotTagsData_hotTags> {
  @override
  final Iterable<Type> types = const [
    GHotTagsData_hotTags,
    _$GHotTagsData_hotTags
  ];
  @override
  final String wireName = 'GHotTagsData_hotTags';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHotTagsData_hotTags object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.firstWork;
    if (value != null) {
      result
        ..add('firstWork')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GHotTagsData_hotTags_firstWork)));
    }
    return result;
  }

  @override
  GHotTagsData_hotTags deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsData_hotTagsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstWork':
          result.firstWork.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GHotTagsData_hotTags_firstWork))!
              as GHotTagsData_hotTags_firstWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GHotTagsData_hotTags_firstWorkSerializer
    implements StructuredSerializer<GHotTagsData_hotTags_firstWork> {
  @override
  final Iterable<Type> types = const [
    GHotTagsData_hotTags_firstWork,
    _$GHotTagsData_hotTags_firstWork
  ];
  @override
  final String wireName = 'GHotTagsData_hotTags_firstWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHotTagsData_hotTags_firstWork object,
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
  GHotTagsData_hotTags_firstWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsData_hotTags_firstWorkBuilder();

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

class _$GHotTagsData extends GHotTagsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GHotTagsData_hotTags> hotTags;

  factory _$GHotTagsData([void Function(GHotTagsDataBuilder)? updates]) =>
      (new GHotTagsDataBuilder()..update(updates))._build();

  _$GHotTagsData._({required this.G__typename, required this.hotTags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotTagsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(hotTags, r'GHotTagsData', 'hotTags');
  }

  @override
  GHotTagsData rebuild(void Function(GHotTagsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsDataBuilder toBuilder() => new GHotTagsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData &&
        G__typename == other.G__typename &&
        hotTags == other.hotTags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hotTags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHotTagsData')
          ..add('G__typename', G__typename)
          ..add('hotTags', hotTags))
        .toString();
  }
}

class GHotTagsDataBuilder
    implements Builder<GHotTagsData, GHotTagsDataBuilder> {
  _$GHotTagsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GHotTagsData_hotTags>? _hotTags;
  ListBuilder<GHotTagsData_hotTags> get hotTags =>
      _$this._hotTags ??= new ListBuilder<GHotTagsData_hotTags>();
  set hotTags(ListBuilder<GHotTagsData_hotTags>? hotTags) =>
      _$this._hotTags = hotTags;

  GHotTagsDataBuilder() {
    GHotTagsData._initializeBuilder(this);
  }

  GHotTagsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hotTags = $v.hotTags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHotTagsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData;
  }

  @override
  void update(void Function(GHotTagsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData build() => _build();

  _$GHotTagsData _build() {
    _$GHotTagsData _$result;
    try {
      _$result = _$v ??
          new _$GHotTagsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHotTagsData', 'G__typename'),
              hotTags: hotTags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hotTags';
        hotTags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHotTagsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHotTagsData_hotTags extends GHotTagsData_hotTags {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GHotTagsData_hotTags_firstWork? firstWork;

  factory _$GHotTagsData_hotTags(
          [void Function(GHotTagsData_hotTagsBuilder)? updates]) =>
      (new GHotTagsData_hotTagsBuilder()..update(updates))._build();

  _$GHotTagsData_hotTags._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.firstWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotTagsData_hotTags', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHotTagsData_hotTags', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHotTagsData_hotTags', 'name');
  }

  @override
  GHotTagsData_hotTags rebuild(
          void Function(GHotTagsData_hotTagsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsData_hotTagsBuilder toBuilder() =>
      new GHotTagsData_hotTagsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData_hotTags &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        firstWork == other.firstWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, firstWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHotTagsData_hotTags')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('firstWork', firstWork))
        .toString();
  }
}

class GHotTagsData_hotTagsBuilder
    implements Builder<GHotTagsData_hotTags, GHotTagsData_hotTagsBuilder> {
  _$GHotTagsData_hotTags? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHotTagsData_hotTags_firstWorkBuilder? _firstWork;
  GHotTagsData_hotTags_firstWorkBuilder get firstWork =>
      _$this._firstWork ??= new GHotTagsData_hotTags_firstWorkBuilder();
  set firstWork(GHotTagsData_hotTags_firstWorkBuilder? firstWork) =>
      _$this._firstWork = firstWork;

  GHotTagsData_hotTagsBuilder() {
    GHotTagsData_hotTags._initializeBuilder(this);
  }

  GHotTagsData_hotTagsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _firstWork = $v.firstWork?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHotTagsData_hotTags other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData_hotTags;
  }

  @override
  void update(void Function(GHotTagsData_hotTagsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData_hotTags build() => _build();

  _$GHotTagsData_hotTags _build() {
    _$GHotTagsData_hotTags _$result;
    try {
      _$result = _$v ??
          new _$GHotTagsData_hotTags._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHotTagsData_hotTags', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHotTagsData_hotTags', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GHotTagsData_hotTags', 'name'),
              firstWork: _firstWork?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'firstWork';
        _firstWork?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHotTagsData_hotTags', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHotTagsData_hotTags_firstWork extends GHotTagsData_hotTags_firstWork {
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

  factory _$GHotTagsData_hotTags_firstWork(
          [void Function(GHotTagsData_hotTags_firstWorkBuilder)? updates]) =>
      (new GHotTagsData_hotTags_firstWorkBuilder()..update(updates))._build();

  _$GHotTagsData_hotTags_firstWork._(
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
        G__typename, r'GHotTagsData_hotTags_firstWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHotTagsData_hotTags_firstWork', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GHotTagsData_hotTags_firstWork', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GHotTagsData_hotTags_firstWork', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GHotTagsData_hotTags_firstWork', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GHotTagsData_hotTags_firstWork', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GHotTagsData_hotTags_firstWork', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        imageWidth, r'GHotTagsData_hotTags_firstWork', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(
        imageHeight, r'GHotTagsData_hotTags_firstWork', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL,
        r'GHotTagsData_hotTags_firstWork', 'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth,
        r'GHotTagsData_hotTags_firstWork', 'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight,
        r'GHotTagsData_hotTags_firstWork', 'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL,
        r'GHotTagsData_hotTags_firstWork', 'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth,
        r'GHotTagsData_hotTags_firstWork', 'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight,
        r'GHotTagsData_hotTags_firstWork', 'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GHotTagsData_hotTags_firstWork', 'imageAspectRatio');
  }

  @override
  GHotTagsData_hotTags_firstWork rebuild(
          void Function(GHotTagsData_hotTags_firstWorkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsData_hotTags_firstWorkBuilder toBuilder() =>
      new GHotTagsData_hotTags_firstWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData_hotTags_firstWork &&
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
    return (newBuiltValueToStringHelper(r'GHotTagsData_hotTags_firstWork')
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

class GHotTagsData_hotTags_firstWorkBuilder
    implements
        Builder<GHotTagsData_hotTags_firstWork,
            GHotTagsData_hotTags_firstWorkBuilder> {
  _$GHotTagsData_hotTags_firstWork? _$v;

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

  GHotTagsData_hotTags_firstWorkBuilder() {
    GHotTagsData_hotTags_firstWork._initializeBuilder(this);
  }

  GHotTagsData_hotTags_firstWorkBuilder get _$this {
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
  void replace(GHotTagsData_hotTags_firstWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData_hotTags_firstWork;
  }

  @override
  void update(void Function(GHotTagsData_hotTags_firstWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData_hotTags_firstWork build() => _build();

  _$GHotTagsData_hotTags_firstWork _build() {
    final _$result = _$v ??
        new _$GHotTagsData_hotTags_firstWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHotTagsData_hotTags_firstWork', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHotTagsData_hotTags_firstWork', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GHotTagsData_hotTags_firstWork', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GHotTagsData_hotTags_firstWork', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GHotTagsData_hotTags_firstWork', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GHotTagsData_hotTags_firstWork', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GHotTagsData_hotTags_firstWork', 'imageURL'),
            imageWidth:
                BuiltValueNullFieldError.checkNotNull(imageWidth, r'GHotTagsData_hotTags_firstWork', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GHotTagsData_hotTags_firstWork', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GHotTagsData_hotTags_firstWork', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GHotTagsData_hotTags_firstWork', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GHotTagsData_hotTags_firstWork', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GHotTagsData_hotTags_firstWork', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GHotTagsData_hotTags_firstWork', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GHotTagsData_hotTags_firstWork', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GHotTagsData_hotTags_firstWork', 'imageAspectRatio'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
