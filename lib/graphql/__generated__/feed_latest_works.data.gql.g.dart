// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_latest_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedLatestWorksData> _$gFeedLatestWorksDataSerializer =
    new _$GFeedLatestWorksDataSerializer();
Serializer<GFeedLatestWorksData_works> _$gFeedLatestWorksDataWorksSerializer =
    new _$GFeedLatestWorksData_worksSerializer();
Serializer<GFeedLatestWorksData_works_image>
    _$gFeedLatestWorksDataWorksImageSerializer =
    new _$GFeedLatestWorksData_works_imageSerializer();
Serializer<GFeedLatestWorksData_works_user>
    _$gFeedLatestWorksDataWorksUserSerializer =
    new _$GFeedLatestWorksData_works_userSerializer();
Serializer<GFeedLatestWorksData_works_user_iconImage>
    _$gFeedLatestWorksDataWorksUserIconImageSerializer =
    new _$GFeedLatestWorksData_works_user_iconImageSerializer();
Serializer<GFeedLatestWorksData_works_viewer>
    _$gFeedLatestWorksDataWorksViewerSerializer =
    new _$GFeedLatestWorksData_works_viewerSerializer();

class _$GFeedLatestWorksDataSerializer
    implements StructuredSerializer<GFeedLatestWorksData> {
  @override
  final Iterable<Type> types = const [
    GFeedLatestWorksData,
    _$GFeedLatestWorksData
  ];
  @override
  final String wireName = 'GFeedLatestWorksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedLatestWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.works;
    if (value != null) {
      result
        ..add('works')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFeedLatestWorksData_works)])));
    }
    return result;
  }

  @override
  GFeedLatestWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedLatestWorksDataBuilder();

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
        case 'works':
          result.works.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFeedLatestWorksData_works)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedLatestWorksData_worksSerializer
    implements StructuredSerializer<GFeedLatestWorksData_works> {
  @override
  final Iterable<Type> types = const [
    GFeedLatestWorksData_works,
    _$GFeedLatestWorksData_works
  ];
  @override
  final String wireName = 'GFeedLatestWorksData_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedLatestWorksData_works object,
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
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GFeedLatestWorksData_works_user)),
      'viewer',
      serializers.serialize(object.viewer,
          specifiedType: const FullType(GFeedLatestWorksData_works_viewer)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFeedLatestWorksData_works_image)));
    }
    return result;
  }

  @override
  GFeedLatestWorksData_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedLatestWorksData_worksBuilder();

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
        case 'imageAspectRatio':
          result.imageAspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFeedLatestWorksData_works_image))!
              as GFeedLatestWorksData_works_image);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFeedLatestWorksData_works_user))!
              as GFeedLatestWorksData_works_user);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFeedLatestWorksData_works_viewer))!
              as GFeedLatestWorksData_works_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedLatestWorksData_works_imageSerializer
    implements StructuredSerializer<GFeedLatestWorksData_works_image> {
  @override
  final Iterable<Type> types = const [
    GFeedLatestWorksData_works_image,
    _$GFeedLatestWorksData_works_image
  ];
  @override
  final String wireName = 'GFeedLatestWorksData_works_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedLatestWorksData_works_image object,
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
  GFeedLatestWorksData_works_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedLatestWorksData_works_imageBuilder();

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

class _$GFeedLatestWorksData_works_userSerializer
    implements StructuredSerializer<GFeedLatestWorksData_works_user> {
  @override
  final Iterable<Type> types = const [
    GFeedLatestWorksData_works_user,
    _$GFeedLatestWorksData_works_user
  ];
  @override
  final String wireName = 'GFeedLatestWorksData_works_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedLatestWorksData_works_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GFeedLatestWorksData_works_user_iconImage)));
    }
    return result;
  }

  @override
  GFeedLatestWorksData_works_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedLatestWorksData_works_userBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFeedLatestWorksData_works_user_iconImage))!
              as GFeedLatestWorksData_works_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedLatestWorksData_works_user_iconImageSerializer
    implements StructuredSerializer<GFeedLatestWorksData_works_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GFeedLatestWorksData_works_user_iconImage,
    _$GFeedLatestWorksData_works_user_iconImage
  ];
  @override
  final String wireName = 'GFeedLatestWorksData_works_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedLatestWorksData_works_user_iconImage object,
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
  GFeedLatestWorksData_works_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedLatestWorksData_works_user_iconImageBuilder();

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

class _$GFeedLatestWorksData_works_viewerSerializer
    implements StructuredSerializer<GFeedLatestWorksData_works_viewer> {
  @override
  final Iterable<Type> types = const [
    GFeedLatestWorksData_works_viewer,
    _$GFeedLatestWorksData_works_viewer
  ];
  @override
  final String wireName = 'GFeedLatestWorksData_works_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedLatestWorksData_works_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
      'isBookmarked',
      serializers.serialize(object.isBookmarked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GFeedLatestWorksData_works_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedLatestWorksData_works_viewerBuilder();

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
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isBookmarked':
          result.isBookmarked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedLatestWorksData extends GFeedLatestWorksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFeedLatestWorksData_works>? works;

  factory _$GFeedLatestWorksData(
          [void Function(GFeedLatestWorksDataBuilder)? updates]) =>
      (new GFeedLatestWorksDataBuilder()..update(updates))._build();

  _$GFeedLatestWorksData._({required this.G__typename, this.works})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedLatestWorksData', 'G__typename');
  }

  @override
  GFeedLatestWorksData rebuild(
          void Function(GFeedLatestWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedLatestWorksDataBuilder toBuilder() =>
      new GFeedLatestWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedLatestWorksData &&
        G__typename == other.G__typename &&
        works == other.works;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedLatestWorksData')
          ..add('G__typename', G__typename)
          ..add('works', works))
        .toString();
  }
}

class GFeedLatestWorksDataBuilder
    implements Builder<GFeedLatestWorksData, GFeedLatestWorksDataBuilder> {
  _$GFeedLatestWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFeedLatestWorksData_works>? _works;
  ListBuilder<GFeedLatestWorksData_works> get works =>
      _$this._works ??= new ListBuilder<GFeedLatestWorksData_works>();
  set works(ListBuilder<GFeedLatestWorksData_works>? works) =>
      _$this._works = works;

  GFeedLatestWorksDataBuilder() {
    GFeedLatestWorksData._initializeBuilder(this);
  }

  GFeedLatestWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _works = $v.works?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedLatestWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedLatestWorksData;
  }

  @override
  void update(void Function(GFeedLatestWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedLatestWorksData build() => _build();

  _$GFeedLatestWorksData _build() {
    _$GFeedLatestWorksData _$result;
    try {
      _$result = _$v ??
          new _$GFeedLatestWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedLatestWorksData', 'G__typename'),
              works: _works?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        _works?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedLatestWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedLatestWorksData_works extends GFeedLatestWorksData_works {
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
  final double imageAspectRatio;
  @override
  final GFeedLatestWorksData_works_image? image;
  @override
  final GFeedLatestWorksData_works_user user;
  @override
  final GFeedLatestWorksData_works_viewer viewer;

  factory _$GFeedLatestWorksData_works(
          [void Function(GFeedLatestWorksData_worksBuilder)? updates]) =>
      (new GFeedLatestWorksData_worksBuilder()..update(updates))._build();

  _$GFeedLatestWorksData_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageAspectRatio,
      this.image,
      required this.user,
      required this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedLatestWorksData_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedLatestWorksData_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFeedLatestWorksData_works', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GFeedLatestWorksData_works', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GFeedLatestWorksData_works', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFeedLatestWorksData_works', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageAspectRatio, r'GFeedLatestWorksData_works', 'imageAspectRatio');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GFeedLatestWorksData_works', 'user');
    BuiltValueNullFieldError.checkNotNull(
        viewer, r'GFeedLatestWorksData_works', 'viewer');
  }

  @override
  GFeedLatestWorksData_works rebuild(
          void Function(GFeedLatestWorksData_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedLatestWorksData_worksBuilder toBuilder() =>
      new GFeedLatestWorksData_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedLatestWorksData_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        imageAspectRatio == other.imageAspectRatio &&
        image == other.image &&
        user == other.user &&
        viewer == other.viewer;
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
    _$hash = $jc(_$hash, imageAspectRatio.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedLatestWorksData_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('imageAspectRatio', imageAspectRatio)
          ..add('image', image)
          ..add('user', user)
          ..add('viewer', viewer))
        .toString();
  }
}

class GFeedLatestWorksData_worksBuilder
    implements
        Builder<GFeedLatestWorksData_works, GFeedLatestWorksData_worksBuilder> {
  _$GFeedLatestWorksData_works? _$v;

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

  double? _imageAspectRatio;
  double? get imageAspectRatio => _$this._imageAspectRatio;
  set imageAspectRatio(double? imageAspectRatio) =>
      _$this._imageAspectRatio = imageAspectRatio;

  GFeedLatestWorksData_works_imageBuilder? _image;
  GFeedLatestWorksData_works_imageBuilder get image =>
      _$this._image ??= new GFeedLatestWorksData_works_imageBuilder();
  set image(GFeedLatestWorksData_works_imageBuilder? image) =>
      _$this._image = image;

  GFeedLatestWorksData_works_userBuilder? _user;
  GFeedLatestWorksData_works_userBuilder get user =>
      _$this._user ??= new GFeedLatestWorksData_works_userBuilder();
  set user(GFeedLatestWorksData_works_userBuilder? user) => _$this._user = user;

  GFeedLatestWorksData_works_viewerBuilder? _viewer;
  GFeedLatestWorksData_works_viewerBuilder get viewer =>
      _$this._viewer ??= new GFeedLatestWorksData_works_viewerBuilder();
  set viewer(GFeedLatestWorksData_works_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GFeedLatestWorksData_worksBuilder() {
    GFeedLatestWorksData_works._initializeBuilder(this);
  }

  GFeedLatestWorksData_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _imageAspectRatio = $v.imageAspectRatio;
      _image = $v.image?.toBuilder();
      _user = $v.user.toBuilder();
      _viewer = $v.viewer.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedLatestWorksData_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedLatestWorksData_works;
  }

  @override
  void update(void Function(GFeedLatestWorksData_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedLatestWorksData_works build() => _build();

  _$GFeedLatestWorksData_works _build() {
    _$GFeedLatestWorksData_works _$result;
    try {
      _$result = _$v ??
          new _$GFeedLatestWorksData_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedLatestWorksData_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedLatestWorksData_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFeedLatestWorksData_works', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GFeedLatestWorksData_works', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GFeedLatestWorksData_works', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GFeedLatestWorksData_works', 'createdAt'),
              imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                  imageAspectRatio,
                  r'GFeedLatestWorksData_works',
                  'imageAspectRatio'),
              image: _image?.build(),
              user: user.build(),
              viewer: viewer.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'user';
        user.build();
        _$failedField = 'viewer';
        viewer.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedLatestWorksData_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedLatestWorksData_works_image
    extends GFeedLatestWorksData_works_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFeedLatestWorksData_works_image(
          [void Function(GFeedLatestWorksData_works_imageBuilder)? updates]) =>
      (new GFeedLatestWorksData_works_imageBuilder()..update(updates))._build();

  _$GFeedLatestWorksData_works_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedLatestWorksData_works_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedLatestWorksData_works_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GFeedLatestWorksData_works_image', 'downloadURL');
  }

  @override
  GFeedLatestWorksData_works_image rebuild(
          void Function(GFeedLatestWorksData_works_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedLatestWorksData_works_imageBuilder toBuilder() =>
      new GFeedLatestWorksData_works_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedLatestWorksData_works_image &&
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
    return (newBuiltValueToStringHelper(r'GFeedLatestWorksData_works_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFeedLatestWorksData_works_imageBuilder
    implements
        Builder<GFeedLatestWorksData_works_image,
            GFeedLatestWorksData_works_imageBuilder> {
  _$GFeedLatestWorksData_works_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFeedLatestWorksData_works_imageBuilder() {
    GFeedLatestWorksData_works_image._initializeBuilder(this);
  }

  GFeedLatestWorksData_works_imageBuilder get _$this {
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
  void replace(GFeedLatestWorksData_works_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedLatestWorksData_works_image;
  }

  @override
  void update(void Function(GFeedLatestWorksData_works_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedLatestWorksData_works_image build() => _build();

  _$GFeedLatestWorksData_works_image _build() {
    final _$result = _$v ??
        new _$GFeedLatestWorksData_works_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFeedLatestWorksData_works_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedLatestWorksData_works_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFeedLatestWorksData_works_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFeedLatestWorksData_works_user
    extends GFeedLatestWorksData_works_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GFeedLatestWorksData_works_user_iconImage? iconImage;

  factory _$GFeedLatestWorksData_works_user(
          [void Function(GFeedLatestWorksData_works_userBuilder)? updates]) =>
      (new GFeedLatestWorksData_works_userBuilder()..update(updates))._build();

  _$GFeedLatestWorksData_works_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedLatestWorksData_works_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedLatestWorksData_works_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFeedLatestWorksData_works_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFeedLatestWorksData_works_user', 'name');
  }

  @override
  GFeedLatestWorksData_works_user rebuild(
          void Function(GFeedLatestWorksData_works_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedLatestWorksData_works_userBuilder toBuilder() =>
      new GFeedLatestWorksData_works_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedLatestWorksData_works_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedLatestWorksData_works_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GFeedLatestWorksData_works_userBuilder
    implements
        Builder<GFeedLatestWorksData_works_user,
            GFeedLatestWorksData_works_userBuilder> {
  _$GFeedLatestWorksData_works_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFeedLatestWorksData_works_user_iconImageBuilder? _iconImage;
  GFeedLatestWorksData_works_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GFeedLatestWorksData_works_user_iconImageBuilder();
  set iconImage(GFeedLatestWorksData_works_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GFeedLatestWorksData_works_userBuilder() {
    GFeedLatestWorksData_works_user._initializeBuilder(this);
  }

  GFeedLatestWorksData_works_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _name = $v.name;
      _iconImage = $v.iconImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedLatestWorksData_works_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedLatestWorksData_works_user;
  }

  @override
  void update(void Function(GFeedLatestWorksData_works_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedLatestWorksData_works_user build() => _build();

  _$GFeedLatestWorksData_works_user _build() {
    _$GFeedLatestWorksData_works_user _$result;
    try {
      _$result = _$v ??
          new _$GFeedLatestWorksData_works_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GFeedLatestWorksData_works_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedLatestWorksData_works_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GFeedLatestWorksData_works_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GFeedLatestWorksData_works_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedLatestWorksData_works_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedLatestWorksData_works_user_iconImage
    extends GFeedLatestWorksData_works_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFeedLatestWorksData_works_user_iconImage(
          [void Function(GFeedLatestWorksData_works_user_iconImageBuilder)?
              updates]) =>
      (new GFeedLatestWorksData_works_user_iconImageBuilder()..update(updates))
          ._build();

  _$GFeedLatestWorksData_works_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFeedLatestWorksData_works_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedLatestWorksData_works_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GFeedLatestWorksData_works_user_iconImage', 'downloadURL');
  }

  @override
  GFeedLatestWorksData_works_user_iconImage rebuild(
          void Function(GFeedLatestWorksData_works_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedLatestWorksData_works_user_iconImageBuilder toBuilder() =>
      new GFeedLatestWorksData_works_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedLatestWorksData_works_user_iconImage &&
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
            r'GFeedLatestWorksData_works_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFeedLatestWorksData_works_user_iconImageBuilder
    implements
        Builder<GFeedLatestWorksData_works_user_iconImage,
            GFeedLatestWorksData_works_user_iconImageBuilder> {
  _$GFeedLatestWorksData_works_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFeedLatestWorksData_works_user_iconImageBuilder() {
    GFeedLatestWorksData_works_user_iconImage._initializeBuilder(this);
  }

  GFeedLatestWorksData_works_user_iconImageBuilder get _$this {
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
  void replace(GFeedLatestWorksData_works_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedLatestWorksData_works_user_iconImage;
  }

  @override
  void update(
      void Function(GFeedLatestWorksData_works_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedLatestWorksData_works_user_iconImage build() => _build();

  _$GFeedLatestWorksData_works_user_iconImage _build() {
    final _$result = _$v ??
        new _$GFeedLatestWorksData_works_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFeedLatestWorksData_works_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedLatestWorksData_works_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFeedLatestWorksData_works_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFeedLatestWorksData_works_viewer
    extends GFeedLatestWorksData_works_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;
  @override
  final bool isBookmarked;

  factory _$GFeedLatestWorksData_works_viewer(
          [void Function(GFeedLatestWorksData_works_viewerBuilder)? updates]) =>
      (new GFeedLatestWorksData_works_viewerBuilder()..update(updates))
          ._build();

  _$GFeedLatestWorksData_works_viewer._(
      {required this.G__typename,
      required this.id,
      required this.isLiked,
      required this.isBookmarked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedLatestWorksData_works_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedLatestWorksData_works_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GFeedLatestWorksData_works_viewer', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(
        isBookmarked, r'GFeedLatestWorksData_works_viewer', 'isBookmarked');
  }

  @override
  GFeedLatestWorksData_works_viewer rebuild(
          void Function(GFeedLatestWorksData_works_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedLatestWorksData_works_viewerBuilder toBuilder() =>
      new GFeedLatestWorksData_works_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedLatestWorksData_works_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isLiked == other.isLiked &&
        isBookmarked == other.isBookmarked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jc(_$hash, isBookmarked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedLatestWorksData_works_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked)
          ..add('isBookmarked', isBookmarked))
        .toString();
  }
}

class GFeedLatestWorksData_works_viewerBuilder
    implements
        Builder<GFeedLatestWorksData_works_viewer,
            GFeedLatestWorksData_works_viewerBuilder> {
  _$GFeedLatestWorksData_works_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  bool? _isBookmarked;
  bool? get isBookmarked => _$this._isBookmarked;
  set isBookmarked(bool? isBookmarked) => _$this._isBookmarked = isBookmarked;

  GFeedLatestWorksData_works_viewerBuilder() {
    GFeedLatestWorksData_works_viewer._initializeBuilder(this);
  }

  GFeedLatestWorksData_works_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isLiked = $v.isLiked;
      _isBookmarked = $v.isBookmarked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedLatestWorksData_works_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedLatestWorksData_works_viewer;
  }

  @override
  void update(
      void Function(GFeedLatestWorksData_works_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedLatestWorksData_works_viewer build() => _build();

  _$GFeedLatestWorksData_works_viewer _build() {
    final _$result = _$v ??
        new _$GFeedLatestWorksData_works_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFeedLatestWorksData_works_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedLatestWorksData_works_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GFeedLatestWorksData_works_viewer', 'isLiked'),
            isBookmarked: BuiltValueNullFieldError.checkNotNull(isBookmarked,
                r'GFeedLatestWorksData_works_viewer', 'isBookmarked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
