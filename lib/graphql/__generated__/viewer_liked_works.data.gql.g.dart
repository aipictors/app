// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_liked_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerLikedWorksData> _$gViewerLikedWorksDataSerializer =
    new _$GViewerLikedWorksDataSerializer();
Serializer<GViewerLikedWorksData_viewer>
    _$gViewerLikedWorksDataViewerSerializer =
    new _$GViewerLikedWorksData_viewerSerializer();
Serializer<GViewerLikedWorksData_viewer_likedWorks>
    _$gViewerLikedWorksDataViewerLikedWorksSerializer =
    new _$GViewerLikedWorksData_viewer_likedWorksSerializer();

class _$GViewerLikedWorksDataSerializer
    implements StructuredSerializer<GViewerLikedWorksData> {
  @override
  final Iterable<Type> types = const [
    GViewerLikedWorksData,
    _$GViewerLikedWorksData
  ];
  @override
  final String wireName = 'GViewerLikedWorksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerLikedWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GViewerLikedWorksData_viewer)));
    }
    return result;
  }

  @override
  GViewerLikedWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerLikedWorksDataBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GViewerLikedWorksData_viewer))!
              as GViewerLikedWorksData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerLikedWorksData_viewerSerializer
    implements StructuredSerializer<GViewerLikedWorksData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerLikedWorksData_viewer,
    _$GViewerLikedWorksData_viewer
  ];
  @override
  final String wireName = 'GViewerLikedWorksData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerLikedWorksData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'likedWorks',
      serializers.serialize(object.likedWorks,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GViewerLikedWorksData_viewer_likedWorks)])),
    ];

    return result;
  }

  @override
  GViewerLikedWorksData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerLikedWorksData_viewerBuilder();

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
        case 'likedWorks':
          result.likedWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerLikedWorksData_viewer_likedWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerLikedWorksData_viewer_likedWorksSerializer
    implements StructuredSerializer<GViewerLikedWorksData_viewer_likedWorks> {
  @override
  final Iterable<Type> types = const [
    GViewerLikedWorksData_viewer_likedWorks,
    _$GViewerLikedWorksData_viewer_likedWorks
  ];
  @override
  final String wireName = 'GViewerLikedWorksData_viewer_likedWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerLikedWorksData_viewer_likedWorks object,
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
  GViewerLikedWorksData_viewer_likedWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerLikedWorksData_viewer_likedWorksBuilder();

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

class _$GViewerLikedWorksData extends GViewerLikedWorksData {
  @override
  final String G__typename;
  @override
  final GViewerLikedWorksData_viewer? viewer;

  factory _$GViewerLikedWorksData(
          [void Function(GViewerLikedWorksDataBuilder)? updates]) =>
      (new GViewerLikedWorksDataBuilder()..update(updates))._build();

  _$GViewerLikedWorksData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerLikedWorksData', 'G__typename');
  }

  @override
  GViewerLikedWorksData rebuild(
          void Function(GViewerLikedWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerLikedWorksDataBuilder toBuilder() =>
      new GViewerLikedWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerLikedWorksData &&
        G__typename == other.G__typename &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerLikedWorksData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerLikedWorksDataBuilder
    implements Builder<GViewerLikedWorksData, GViewerLikedWorksDataBuilder> {
  _$GViewerLikedWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerLikedWorksData_viewerBuilder? _viewer;
  GViewerLikedWorksData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerLikedWorksData_viewerBuilder();
  set viewer(GViewerLikedWorksData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerLikedWorksDataBuilder() {
    GViewerLikedWorksData._initializeBuilder(this);
  }

  GViewerLikedWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerLikedWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerLikedWorksData;
  }

  @override
  void update(void Function(GViewerLikedWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerLikedWorksData build() => _build();

  _$GViewerLikedWorksData _build() {
    _$GViewerLikedWorksData _$result;
    try {
      _$result = _$v ??
          new _$GViewerLikedWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerLikedWorksData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerLikedWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerLikedWorksData_viewer extends GViewerLikedWorksData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerLikedWorksData_viewer_likedWorks> likedWorks;

  factory _$GViewerLikedWorksData_viewer(
          [void Function(GViewerLikedWorksData_viewerBuilder)? updates]) =>
      (new GViewerLikedWorksData_viewerBuilder()..update(updates))._build();

  _$GViewerLikedWorksData_viewer._(
      {required this.G__typename, required this.likedWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerLikedWorksData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        likedWorks, r'GViewerLikedWorksData_viewer', 'likedWorks');
  }

  @override
  GViewerLikedWorksData_viewer rebuild(
          void Function(GViewerLikedWorksData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerLikedWorksData_viewerBuilder toBuilder() =>
      new GViewerLikedWorksData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerLikedWorksData_viewer &&
        G__typename == other.G__typename &&
        likedWorks == other.likedWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, likedWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerLikedWorksData_viewer')
          ..add('G__typename', G__typename)
          ..add('likedWorks', likedWorks))
        .toString();
  }
}

class GViewerLikedWorksData_viewerBuilder
    implements
        Builder<GViewerLikedWorksData_viewer,
            GViewerLikedWorksData_viewerBuilder> {
  _$GViewerLikedWorksData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerLikedWorksData_viewer_likedWorks>? _likedWorks;
  ListBuilder<GViewerLikedWorksData_viewer_likedWorks> get likedWorks =>
      _$this._likedWorks ??=
          new ListBuilder<GViewerLikedWorksData_viewer_likedWorks>();
  set likedWorks(
          ListBuilder<GViewerLikedWorksData_viewer_likedWorks>? likedWorks) =>
      _$this._likedWorks = likedWorks;

  GViewerLikedWorksData_viewerBuilder() {
    GViewerLikedWorksData_viewer._initializeBuilder(this);
  }

  GViewerLikedWorksData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _likedWorks = $v.likedWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerLikedWorksData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerLikedWorksData_viewer;
  }

  @override
  void update(void Function(GViewerLikedWorksData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerLikedWorksData_viewer build() => _build();

  _$GViewerLikedWorksData_viewer _build() {
    _$GViewerLikedWorksData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerLikedWorksData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerLikedWorksData_viewer', 'G__typename'),
              likedWorks: likedWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedWorks';
        likedWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerLikedWorksData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerLikedWorksData_viewer_likedWorks
    extends GViewerLikedWorksData_viewer_likedWorks {
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

  factory _$GViewerLikedWorksData_viewer_likedWorks(
          [void Function(GViewerLikedWorksData_viewer_likedWorksBuilder)?
              updates]) =>
      (new GViewerLikedWorksData_viewer_likedWorksBuilder()..update(updates))
          ._build();

  _$GViewerLikedWorksData_viewer_likedWorks._(
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
        G__typename, r'GViewerLikedWorksData_viewer_likedWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerLikedWorksData_viewer_likedWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GViewerLikedWorksData_viewer_likedWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GViewerLikedWorksData_viewer_likedWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GViewerLikedWorksData_viewer_likedWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GViewerLikedWorksData_viewer_likedWorks', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GViewerLikedWorksData_viewer_likedWorks', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        imageWidth, r'GViewerLikedWorksData_viewer_likedWorks', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(
        imageHeight, r'GViewerLikedWorksData_viewer_likedWorks', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL,
        r'GViewerLikedWorksData_viewer_likedWorks', 'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth,
        r'GViewerLikedWorksData_viewer_likedWorks', 'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(
        largeThumbnailImageHeight,
        r'GViewerLikedWorksData_viewer_likedWorks',
        'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL,
        r'GViewerLikedWorksData_viewer_likedWorks', 'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth,
        r'GViewerLikedWorksData_viewer_likedWorks', 'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(
        smallThumbnailImageHeight,
        r'GViewerLikedWorksData_viewer_likedWorks',
        'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GViewerLikedWorksData_viewer_likedWorks', 'imageAspectRatio');
  }

  @override
  GViewerLikedWorksData_viewer_likedWorks rebuild(
          void Function(GViewerLikedWorksData_viewer_likedWorksBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerLikedWorksData_viewer_likedWorksBuilder toBuilder() =>
      new GViewerLikedWorksData_viewer_likedWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerLikedWorksData_viewer_likedWorks &&
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
            r'GViewerLikedWorksData_viewer_likedWorks')
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

class GViewerLikedWorksData_viewer_likedWorksBuilder
    implements
        Builder<GViewerLikedWorksData_viewer_likedWorks,
            GViewerLikedWorksData_viewer_likedWorksBuilder> {
  _$GViewerLikedWorksData_viewer_likedWorks? _$v;

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

  GViewerLikedWorksData_viewer_likedWorksBuilder() {
    GViewerLikedWorksData_viewer_likedWorks._initializeBuilder(this);
  }

  GViewerLikedWorksData_viewer_likedWorksBuilder get _$this {
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
  void replace(GViewerLikedWorksData_viewer_likedWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerLikedWorksData_viewer_likedWorks;
  }

  @override
  void update(
      void Function(GViewerLikedWorksData_viewer_likedWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerLikedWorksData_viewer_likedWorks build() => _build();

  _$GViewerLikedWorksData_viewer_likedWorks _build() {
    final _$result = _$v ??
        new _$GViewerLikedWorksData_viewer_likedWorks._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GViewerLikedWorksData_viewer_likedWorks', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerLikedWorksData_viewer_likedWorks', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GViewerLikedWorksData_viewer_likedWorks', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GViewerLikedWorksData_viewer_likedWorks', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GViewerLikedWorksData_viewer_likedWorks', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GViewerLikedWorksData_viewer_likedWorks', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GViewerLikedWorksData_viewer_likedWorks', 'imageURL'),
            imageWidth: BuiltValueNullFieldError.checkNotNull(imageWidth, r'GViewerLikedWorksData_viewer_likedWorks', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GViewerLikedWorksData_viewer_likedWorks', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GViewerLikedWorksData_viewer_likedWorks', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GViewerLikedWorksData_viewer_likedWorks', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GViewerLikedWorksData_viewer_likedWorks', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GViewerLikedWorksData_viewer_likedWorks', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GViewerLikedWorksData_viewer_likedWorks', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GViewerLikedWorksData_viewer_likedWorks', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GViewerLikedWorksData_viewer_likedWorks', 'imageAspectRatio'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
