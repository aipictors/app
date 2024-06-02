// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_hot_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedHotWorksData> _$gFeedHotWorksDataSerializer =
    new _$GFeedHotWorksDataSerializer();
Serializer<GFeedHotWorksData_hotWorks> _$gFeedHotWorksDataHotWorksSerializer =
    new _$GFeedHotWorksData_hotWorksSerializer();
Serializer<GFeedHotWorksData_hotWorks_image>
    _$gFeedHotWorksDataHotWorksImageSerializer =
    new _$GFeedHotWorksData_hotWorks_imageSerializer();
Serializer<GFeedHotWorksData_hotWorks_user>
    _$gFeedHotWorksDataHotWorksUserSerializer =
    new _$GFeedHotWorksData_hotWorks_userSerializer();
Serializer<GFeedHotWorksData_hotWorks_user_iconImage>
    _$gFeedHotWorksDataHotWorksUserIconImageSerializer =
    new _$GFeedHotWorksData_hotWorks_user_iconImageSerializer();

class _$GFeedHotWorksDataSerializer
    implements StructuredSerializer<GFeedHotWorksData> {
  @override
  final Iterable<Type> types = const [GFeedHotWorksData, _$GFeedHotWorksData];
  @override
  final String wireName = 'GFeedHotWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFeedHotWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hotWorks',
      serializers.serialize(object.hotWorks,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GFeedHotWorksData_hotWorks)])),
    ];

    return result;
  }

  @override
  GFeedHotWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedHotWorksDataBuilder();

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
        case 'hotWorks':
          result.hotWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFeedHotWorksData_hotWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedHotWorksData_hotWorksSerializer
    implements StructuredSerializer<GFeedHotWorksData_hotWorks> {
  @override
  final Iterable<Type> types = const [
    GFeedHotWorksData_hotWorks,
    _$GFeedHotWorksData_hotWorks
  ];
  @override
  final String wireName = 'GFeedHotWorksData_hotWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedHotWorksData_hotWorks object,
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
          specifiedType: const FullType(GFeedHotWorksData_hotWorks_user)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFeedHotWorksData_hotWorks_image)));
    }
    return result;
  }

  @override
  GFeedHotWorksData_hotWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedHotWorksData_hotWorksBuilder();

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
                      const FullType(GFeedHotWorksData_hotWorks_image))!
              as GFeedHotWorksData_hotWorks_image);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFeedHotWorksData_hotWorks_user))!
              as GFeedHotWorksData_hotWorks_user);
          break;
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedHotWorksData_hotWorks_imageSerializer
    implements StructuredSerializer<GFeedHotWorksData_hotWorks_image> {
  @override
  final Iterable<Type> types = const [
    GFeedHotWorksData_hotWorks_image,
    _$GFeedHotWorksData_hotWorks_image
  ];
  @override
  final String wireName = 'GFeedHotWorksData_hotWorks_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedHotWorksData_hotWorks_image object,
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
  GFeedHotWorksData_hotWorks_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedHotWorksData_hotWorks_imageBuilder();

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

class _$GFeedHotWorksData_hotWorks_userSerializer
    implements StructuredSerializer<GFeedHotWorksData_hotWorks_user> {
  @override
  final Iterable<Type> types = const [
    GFeedHotWorksData_hotWorks_user,
    _$GFeedHotWorksData_hotWorks_user
  ];
  @override
  final String wireName = 'GFeedHotWorksData_hotWorks_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedHotWorksData_hotWorks_user object,
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
      'isFollower',
      serializers.serialize(object.isFollower,
          specifiedType: const FullType(bool)),
      'isFollowee',
      serializers.serialize(object.isFollowee,
          specifiedType: const FullType(bool)),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GFeedHotWorksData_hotWorks_user_iconImage)));
    }
    return result;
  }

  @override
  GFeedHotWorksData_hotWorks_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedHotWorksData_hotWorks_userBuilder();

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
                      GFeedHotWorksData_hotWorks_user_iconImage))!
              as GFeedHotWorksData_hotWorks_user_iconImage);
          break;
        case 'isFollower':
          result.isFollower = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isFollowee':
          result.isFollowee = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isMuted':
          result.isMuted = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedHotWorksData_hotWorks_user_iconImageSerializer
    implements StructuredSerializer<GFeedHotWorksData_hotWorks_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GFeedHotWorksData_hotWorks_user_iconImage,
    _$GFeedHotWorksData_hotWorks_user_iconImage
  ];
  @override
  final String wireName = 'GFeedHotWorksData_hotWorks_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedHotWorksData_hotWorks_user_iconImage object,
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
  GFeedHotWorksData_hotWorks_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedHotWorksData_hotWorks_user_iconImageBuilder();

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

class _$GFeedHotWorksData extends GFeedHotWorksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFeedHotWorksData_hotWorks> hotWorks;

  factory _$GFeedHotWorksData(
          [void Function(GFeedHotWorksDataBuilder)? updates]) =>
      (new GFeedHotWorksDataBuilder()..update(updates))._build();

  _$GFeedHotWorksData._({required this.G__typename, required this.hotWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedHotWorksData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        hotWorks, r'GFeedHotWorksData', 'hotWorks');
  }

  @override
  GFeedHotWorksData rebuild(void Function(GFeedHotWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedHotWorksDataBuilder toBuilder() =>
      new GFeedHotWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedHotWorksData &&
        G__typename == other.G__typename &&
        hotWorks == other.hotWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hotWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedHotWorksData')
          ..add('G__typename', G__typename)
          ..add('hotWorks', hotWorks))
        .toString();
  }
}

class GFeedHotWorksDataBuilder
    implements Builder<GFeedHotWorksData, GFeedHotWorksDataBuilder> {
  _$GFeedHotWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFeedHotWorksData_hotWorks>? _hotWorks;
  ListBuilder<GFeedHotWorksData_hotWorks> get hotWorks =>
      _$this._hotWorks ??= new ListBuilder<GFeedHotWorksData_hotWorks>();
  set hotWorks(ListBuilder<GFeedHotWorksData_hotWorks>? hotWorks) =>
      _$this._hotWorks = hotWorks;

  GFeedHotWorksDataBuilder() {
    GFeedHotWorksData._initializeBuilder(this);
  }

  GFeedHotWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hotWorks = $v.hotWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedHotWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedHotWorksData;
  }

  @override
  void update(void Function(GFeedHotWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedHotWorksData build() => _build();

  _$GFeedHotWorksData _build() {
    _$GFeedHotWorksData _$result;
    try {
      _$result = _$v ??
          new _$GFeedHotWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedHotWorksData', 'G__typename'),
              hotWorks: hotWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hotWorks';
        hotWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedHotWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedHotWorksData_hotWorks extends GFeedHotWorksData_hotWorks {
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
  final GFeedHotWorksData_hotWorks_image? image;
  @override
  final GFeedHotWorksData_hotWorks_user user;
  @override
  final bool isLiked;

  factory _$GFeedHotWorksData_hotWorks(
          [void Function(GFeedHotWorksData_hotWorksBuilder)? updates]) =>
      (new GFeedHotWorksData_hotWorksBuilder()..update(updates))._build();

  _$GFeedHotWorksData_hotWorks._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageAspectRatio,
      this.image,
      required this.user,
      required this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedHotWorksData_hotWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedHotWorksData_hotWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFeedHotWorksData_hotWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GFeedHotWorksData_hotWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GFeedHotWorksData_hotWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFeedHotWorksData_hotWorks', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageAspectRatio, r'GFeedHotWorksData_hotWorks', 'imageAspectRatio');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GFeedHotWorksData_hotWorks', 'user');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GFeedHotWorksData_hotWorks', 'isLiked');
  }

  @override
  GFeedHotWorksData_hotWorks rebuild(
          void Function(GFeedHotWorksData_hotWorksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedHotWorksData_hotWorksBuilder toBuilder() =>
      new GFeedHotWorksData_hotWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedHotWorksData_hotWorks &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        imageAspectRatio == other.imageAspectRatio &&
        image == other.image &&
        user == other.user &&
        isLiked == other.isLiked;
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
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedHotWorksData_hotWorks')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('imageAspectRatio', imageAspectRatio)
          ..add('image', image)
          ..add('user', user)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class GFeedHotWorksData_hotWorksBuilder
    implements
        Builder<GFeedHotWorksData_hotWorks, GFeedHotWorksData_hotWorksBuilder> {
  _$GFeedHotWorksData_hotWorks? _$v;

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

  GFeedHotWorksData_hotWorks_imageBuilder? _image;
  GFeedHotWorksData_hotWorks_imageBuilder get image =>
      _$this._image ??= new GFeedHotWorksData_hotWorks_imageBuilder();
  set image(GFeedHotWorksData_hotWorks_imageBuilder? image) =>
      _$this._image = image;

  GFeedHotWorksData_hotWorks_userBuilder? _user;
  GFeedHotWorksData_hotWorks_userBuilder get user =>
      _$this._user ??= new GFeedHotWorksData_hotWorks_userBuilder();
  set user(GFeedHotWorksData_hotWorks_userBuilder? user) => _$this._user = user;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  GFeedHotWorksData_hotWorksBuilder() {
    GFeedHotWorksData_hotWorks._initializeBuilder(this);
  }

  GFeedHotWorksData_hotWorksBuilder get _$this {
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
      _isLiked = $v.isLiked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedHotWorksData_hotWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedHotWorksData_hotWorks;
  }

  @override
  void update(void Function(GFeedHotWorksData_hotWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedHotWorksData_hotWorks build() => _build();

  _$GFeedHotWorksData_hotWorks _build() {
    _$GFeedHotWorksData_hotWorks _$result;
    try {
      _$result = _$v ??
          new _$GFeedHotWorksData_hotWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedHotWorksData_hotWorks', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedHotWorksData_hotWorks', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFeedHotWorksData_hotWorks', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GFeedHotWorksData_hotWorks', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GFeedHotWorksData_hotWorks', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GFeedHotWorksData_hotWorks', 'createdAt'),
              imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                  imageAspectRatio,
                  r'GFeedHotWorksData_hotWorks',
                  'imageAspectRatio'),
              image: _image?.build(),
              user: user.build(),
              isLiked: BuiltValueNullFieldError.checkNotNull(isLiked, r'GFeedHotWorksData_hotWorks', 'isLiked'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedHotWorksData_hotWorks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedHotWorksData_hotWorks_image
    extends GFeedHotWorksData_hotWorks_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFeedHotWorksData_hotWorks_image(
          [void Function(GFeedHotWorksData_hotWorks_imageBuilder)? updates]) =>
      (new GFeedHotWorksData_hotWorks_imageBuilder()..update(updates))._build();

  _$GFeedHotWorksData_hotWorks_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedHotWorksData_hotWorks_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedHotWorksData_hotWorks_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GFeedHotWorksData_hotWorks_image', 'downloadURL');
  }

  @override
  GFeedHotWorksData_hotWorks_image rebuild(
          void Function(GFeedHotWorksData_hotWorks_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedHotWorksData_hotWorks_imageBuilder toBuilder() =>
      new GFeedHotWorksData_hotWorks_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedHotWorksData_hotWorks_image &&
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
    return (newBuiltValueToStringHelper(r'GFeedHotWorksData_hotWorks_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFeedHotWorksData_hotWorks_imageBuilder
    implements
        Builder<GFeedHotWorksData_hotWorks_image,
            GFeedHotWorksData_hotWorks_imageBuilder> {
  _$GFeedHotWorksData_hotWorks_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFeedHotWorksData_hotWorks_imageBuilder() {
    GFeedHotWorksData_hotWorks_image._initializeBuilder(this);
  }

  GFeedHotWorksData_hotWorks_imageBuilder get _$this {
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
  void replace(GFeedHotWorksData_hotWorks_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedHotWorksData_hotWorks_image;
  }

  @override
  void update(void Function(GFeedHotWorksData_hotWorks_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedHotWorksData_hotWorks_image build() => _build();

  _$GFeedHotWorksData_hotWorks_image _build() {
    final _$result = _$v ??
        new _$GFeedHotWorksData_hotWorks_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFeedHotWorksData_hotWorks_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedHotWorksData_hotWorks_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFeedHotWorksData_hotWorks_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFeedHotWorksData_hotWorks_user
    extends GFeedHotWorksData_hotWorks_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GFeedHotWorksData_hotWorks_user_iconImage? iconImage;
  @override
  final bool isFollower;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GFeedHotWorksData_hotWorks_user(
          [void Function(GFeedHotWorksData_hotWorks_userBuilder)? updates]) =>
      (new GFeedHotWorksData_hotWorks_userBuilder()..update(updates))._build();

  _$GFeedHotWorksData_hotWorks_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage,
      required this.isFollower,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedHotWorksData_hotWorks_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedHotWorksData_hotWorks_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFeedHotWorksData_hotWorks_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFeedHotWorksData_hotWorks_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        isFollower, r'GFeedHotWorksData_hotWorks_user', 'isFollower');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GFeedHotWorksData_hotWorks_user', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GFeedHotWorksData_hotWorks_user', 'isMuted');
  }

  @override
  GFeedHotWorksData_hotWorks_user rebuild(
          void Function(GFeedHotWorksData_hotWorks_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedHotWorksData_hotWorks_userBuilder toBuilder() =>
      new GFeedHotWorksData_hotWorks_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedHotWorksData_hotWorks_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        iconImage == other.iconImage &&
        isFollower == other.isFollower &&
        isFollowee == other.isFollowee &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jc(_$hash, isFollower.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedHotWorksData_hotWorks_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage)
          ..add('isFollower', isFollower)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GFeedHotWorksData_hotWorks_userBuilder
    implements
        Builder<GFeedHotWorksData_hotWorks_user,
            GFeedHotWorksData_hotWorks_userBuilder> {
  _$GFeedHotWorksData_hotWorks_user? _$v;

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

  GFeedHotWorksData_hotWorks_user_iconImageBuilder? _iconImage;
  GFeedHotWorksData_hotWorks_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GFeedHotWorksData_hotWorks_user_iconImageBuilder();
  set iconImage(GFeedHotWorksData_hotWorks_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  bool? _isFollower;
  bool? get isFollower => _$this._isFollower;
  set isFollower(bool? isFollower) => _$this._isFollower = isFollower;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GFeedHotWorksData_hotWorks_userBuilder() {
    GFeedHotWorksData_hotWorks_user._initializeBuilder(this);
  }

  GFeedHotWorksData_hotWorks_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _name = $v.name;
      _iconImage = $v.iconImage?.toBuilder();
      _isFollower = $v.isFollower;
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedHotWorksData_hotWorks_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedHotWorksData_hotWorks_user;
  }

  @override
  void update(void Function(GFeedHotWorksData_hotWorks_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedHotWorksData_hotWorks_user build() => _build();

  _$GFeedHotWorksData_hotWorks_user _build() {
    _$GFeedHotWorksData_hotWorks_user _$result;
    try {
      _$result = _$v ??
          new _$GFeedHotWorksData_hotWorks_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GFeedHotWorksData_hotWorks_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedHotWorksData_hotWorks_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GFeedHotWorksData_hotWorks_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GFeedHotWorksData_hotWorks_user', 'name'),
              iconImage: _iconImage?.build(),
              isFollower: BuiltValueNullFieldError.checkNotNull(
                  isFollower, r'GFeedHotWorksData_hotWorks_user', 'isFollower'),
              isFollowee: BuiltValueNullFieldError.checkNotNull(
                  isFollowee, r'GFeedHotWorksData_hotWorks_user', 'isFollowee'),
              isMuted: BuiltValueNullFieldError.checkNotNull(
                  isMuted, r'GFeedHotWorksData_hotWorks_user', 'isMuted'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedHotWorksData_hotWorks_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedHotWorksData_hotWorks_user_iconImage
    extends GFeedHotWorksData_hotWorks_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFeedHotWorksData_hotWorks_user_iconImage(
          [void Function(GFeedHotWorksData_hotWorks_user_iconImageBuilder)?
              updates]) =>
      (new GFeedHotWorksData_hotWorks_user_iconImageBuilder()..update(updates))
          ._build();

  _$GFeedHotWorksData_hotWorks_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFeedHotWorksData_hotWorks_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedHotWorksData_hotWorks_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GFeedHotWorksData_hotWorks_user_iconImage', 'downloadURL');
  }

  @override
  GFeedHotWorksData_hotWorks_user_iconImage rebuild(
          void Function(GFeedHotWorksData_hotWorks_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedHotWorksData_hotWorks_user_iconImageBuilder toBuilder() =>
      new GFeedHotWorksData_hotWorks_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedHotWorksData_hotWorks_user_iconImage &&
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
            r'GFeedHotWorksData_hotWorks_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFeedHotWorksData_hotWorks_user_iconImageBuilder
    implements
        Builder<GFeedHotWorksData_hotWorks_user_iconImage,
            GFeedHotWorksData_hotWorks_user_iconImageBuilder> {
  _$GFeedHotWorksData_hotWorks_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFeedHotWorksData_hotWorks_user_iconImageBuilder() {
    GFeedHotWorksData_hotWorks_user_iconImage._initializeBuilder(this);
  }

  GFeedHotWorksData_hotWorks_user_iconImageBuilder get _$this {
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
  void replace(GFeedHotWorksData_hotWorks_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedHotWorksData_hotWorks_user_iconImage;
  }

  @override
  void update(
      void Function(GFeedHotWorksData_hotWorks_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedHotWorksData_hotWorks_user_iconImage build() => _build();

  _$GFeedHotWorksData_hotWorks_user_iconImage _build() {
    final _$result = _$v ??
        new _$GFeedHotWorksData_hotWorks_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFeedHotWorksData_hotWorks_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedHotWorksData_hotWorks_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFeedHotWorksData_hotWorks_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
