// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_popular_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedPopularWorksData> _$gFeedPopularWorksDataSerializer =
    new _$GFeedPopularWorksDataSerializer();
Serializer<GFeedPopularWorksData_popularWorks>
    _$gFeedPopularWorksDataPopularWorksSerializer =
    new _$GFeedPopularWorksData_popularWorksSerializer();
Serializer<GFeedPopularWorksData_popularWorks_user>
    _$gFeedPopularWorksDataPopularWorksUserSerializer =
    new _$GFeedPopularWorksData_popularWorks_userSerializer();

class _$GFeedPopularWorksDataSerializer
    implements StructuredSerializer<GFeedPopularWorksData> {
  @override
  final Iterable<Type> types = const [
    GFeedPopularWorksData,
    _$GFeedPopularWorksData
  ];
  @override
  final String wireName = 'GFeedPopularWorksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedPopularWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'popularWorks',
      serializers.serialize(object.popularWorks,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GFeedPopularWorksData_popularWorks)])),
    ];

    return result;
  }

  @override
  GFeedPopularWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedPopularWorksDataBuilder();

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
                const FullType(GFeedPopularWorksData_popularWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedPopularWorksData_popularWorksSerializer
    implements StructuredSerializer<GFeedPopularWorksData_popularWorks> {
  @override
  final Iterable<Type> types = const [
    GFeedPopularWorksData_popularWorks,
    _$GFeedPopularWorksData_popularWorks
  ];
  @override
  final String wireName = 'GFeedPopularWorksData_popularWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedPopularWorksData_popularWorks object,
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
      'imageURL',
      serializers.serialize(object.imageURL,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType:
              const FullType(GFeedPopularWorksData_popularWorks_user)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GFeedPopularWorksData_popularWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedPopularWorksData_popularWorksBuilder();

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
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFeedPopularWorksData_popularWorks_user))!
              as GFeedPopularWorksData_popularWorks_user);
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

class _$GFeedPopularWorksData_popularWorks_userSerializer
    implements StructuredSerializer<GFeedPopularWorksData_popularWorks_user> {
  @override
  final Iterable<Type> types = const [
    GFeedPopularWorksData_popularWorks_user,
    _$GFeedPopularWorksData_popularWorks_user
  ];
  @override
  final String wireName = 'GFeedPopularWorksData_popularWorks_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedPopularWorksData_popularWorks_user object,
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
    value = object.iconUrl;
    if (value != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFeedPopularWorksData_popularWorks_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedPopularWorksData_popularWorks_userBuilder();

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
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$GFeedPopularWorksData extends GFeedPopularWorksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFeedPopularWorksData_popularWorks> popularWorks;

  factory _$GFeedPopularWorksData(
          [void Function(GFeedPopularWorksDataBuilder)? updates]) =>
      (new GFeedPopularWorksDataBuilder()..update(updates))._build();

  _$GFeedPopularWorksData._(
      {required this.G__typename, required this.popularWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedPopularWorksData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        popularWorks, r'GFeedPopularWorksData', 'popularWorks');
  }

  @override
  GFeedPopularWorksData rebuild(
          void Function(GFeedPopularWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedPopularWorksDataBuilder toBuilder() =>
      new GFeedPopularWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedPopularWorksData &&
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
    return (newBuiltValueToStringHelper(r'GFeedPopularWorksData')
          ..add('G__typename', G__typename)
          ..add('popularWorks', popularWorks))
        .toString();
  }
}

class GFeedPopularWorksDataBuilder
    implements Builder<GFeedPopularWorksData, GFeedPopularWorksDataBuilder> {
  _$GFeedPopularWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFeedPopularWorksData_popularWorks>? _popularWorks;
  ListBuilder<GFeedPopularWorksData_popularWorks> get popularWorks =>
      _$this._popularWorks ??=
          new ListBuilder<GFeedPopularWorksData_popularWorks>();
  set popularWorks(
          ListBuilder<GFeedPopularWorksData_popularWorks>? popularWorks) =>
      _$this._popularWorks = popularWorks;

  GFeedPopularWorksDataBuilder() {
    GFeedPopularWorksData._initializeBuilder(this);
  }

  GFeedPopularWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _popularWorks = $v.popularWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedPopularWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedPopularWorksData;
  }

  @override
  void update(void Function(GFeedPopularWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedPopularWorksData build() => _build();

  _$GFeedPopularWorksData _build() {
    _$GFeedPopularWorksData _$result;
    try {
      _$result = _$v ??
          new _$GFeedPopularWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedPopularWorksData', 'G__typename'),
              popularWorks: popularWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'popularWorks';
        popularWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedPopularWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedPopularWorksData_popularWorks
    extends GFeedPopularWorksData_popularWorks {
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
  final String imageURL;
  @override
  final GFeedPopularWorksData_popularWorks_user user;
  @override
  final bool isLiked;

  factory _$GFeedPopularWorksData_popularWorks(
          [void Function(GFeedPopularWorksData_popularWorksBuilder)?
              updates]) =>
      (new GFeedPopularWorksData_popularWorksBuilder()..update(updates))
          ._build();

  _$GFeedPopularWorksData_popularWorks._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageAspectRatio,
      required this.imageURL,
      required this.user,
      required this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedPopularWorksData_popularWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedPopularWorksData_popularWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFeedPopularWorksData_popularWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GFeedPopularWorksData_popularWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GFeedPopularWorksData_popularWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFeedPopularWorksData_popularWorks', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GFeedPopularWorksData_popularWorks', 'imageAspectRatio');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GFeedPopularWorksData_popularWorks', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GFeedPopularWorksData_popularWorks', 'user');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GFeedPopularWorksData_popularWorks', 'isLiked');
  }

  @override
  GFeedPopularWorksData_popularWorks rebuild(
          void Function(GFeedPopularWorksData_popularWorksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedPopularWorksData_popularWorksBuilder toBuilder() =>
      new GFeedPopularWorksData_popularWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedPopularWorksData_popularWorks &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        imageAspectRatio == other.imageAspectRatio &&
        imageURL == other.imageURL &&
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
    _$hash = $jc(_$hash, imageURL.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedPopularWorksData_popularWorks')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('imageAspectRatio', imageAspectRatio)
          ..add('imageURL', imageURL)
          ..add('user', user)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class GFeedPopularWorksData_popularWorksBuilder
    implements
        Builder<GFeedPopularWorksData_popularWorks,
            GFeedPopularWorksData_popularWorksBuilder> {
  _$GFeedPopularWorksData_popularWorks? _$v;

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

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

  GFeedPopularWorksData_popularWorks_userBuilder? _user;
  GFeedPopularWorksData_popularWorks_userBuilder get user =>
      _$this._user ??= new GFeedPopularWorksData_popularWorks_userBuilder();
  set user(GFeedPopularWorksData_popularWorks_userBuilder? user) =>
      _$this._user = user;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  GFeedPopularWorksData_popularWorksBuilder() {
    GFeedPopularWorksData_popularWorks._initializeBuilder(this);
  }

  GFeedPopularWorksData_popularWorksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _imageAspectRatio = $v.imageAspectRatio;
      _imageURL = $v.imageURL;
      _user = $v.user.toBuilder();
      _isLiked = $v.isLiked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedPopularWorksData_popularWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedPopularWorksData_popularWorks;
  }

  @override
  void update(
      void Function(GFeedPopularWorksData_popularWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedPopularWorksData_popularWorks build() => _build();

  _$GFeedPopularWorksData_popularWorks _build() {
    _$GFeedPopularWorksData_popularWorks _$result;
    try {
      _$result = _$v ??
          new _$GFeedPopularWorksData_popularWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedPopularWorksData_popularWorks', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedPopularWorksData_popularWorks', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFeedPopularWorksData_popularWorks', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GFeedPopularWorksData_popularWorks', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GFeedPopularWorksData_popularWorks', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GFeedPopularWorksData_popularWorks', 'createdAt'),
              imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                  imageAspectRatio,
                  r'GFeedPopularWorksData_popularWorks',
                  'imageAspectRatio'),
              imageURL: BuiltValueNullFieldError.checkNotNull(imageURL, r'GFeedPopularWorksData_popularWorks', 'imageURL'),
              user: user.build(),
              isLiked: BuiltValueNullFieldError.checkNotNull(isLiked, r'GFeedPopularWorksData_popularWorks', 'isLiked'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedPopularWorksData_popularWorks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedPopularWorksData_popularWorks_user
    extends GFeedPopularWorksData_popularWorks_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final String? iconUrl;
  @override
  final bool isFollower;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GFeedPopularWorksData_popularWorks_user(
          [void Function(GFeedPopularWorksData_popularWorks_userBuilder)?
              updates]) =>
      (new GFeedPopularWorksData_popularWorks_userBuilder()..update(updates))
          ._build();

  _$GFeedPopularWorksData_popularWorks_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconUrl,
      required this.isFollower,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedPopularWorksData_popularWorks_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedPopularWorksData_popularWorks_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFeedPopularWorksData_popularWorks_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFeedPopularWorksData_popularWorks_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        isFollower, r'GFeedPopularWorksData_popularWorks_user', 'isFollower');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GFeedPopularWorksData_popularWorks_user', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GFeedPopularWorksData_popularWorks_user', 'isMuted');
  }

  @override
  GFeedPopularWorksData_popularWorks_user rebuild(
          void Function(GFeedPopularWorksData_popularWorks_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedPopularWorksData_popularWorks_userBuilder toBuilder() =>
      new GFeedPopularWorksData_popularWorks_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedPopularWorksData_popularWorks_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        iconUrl == other.iconUrl &&
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
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, isFollower.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFeedPopularWorksData_popularWorks_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconUrl', iconUrl)
          ..add('isFollower', isFollower)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GFeedPopularWorksData_popularWorks_userBuilder
    implements
        Builder<GFeedPopularWorksData_popularWorks_user,
            GFeedPopularWorksData_popularWorks_userBuilder> {
  _$GFeedPopularWorksData_popularWorks_user? _$v;

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

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  bool? _isFollower;
  bool? get isFollower => _$this._isFollower;
  set isFollower(bool? isFollower) => _$this._isFollower = isFollower;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GFeedPopularWorksData_popularWorks_userBuilder() {
    GFeedPopularWorksData_popularWorks_user._initializeBuilder(this);
  }

  GFeedPopularWorksData_popularWorks_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _name = $v.name;
      _iconUrl = $v.iconUrl;
      _isFollower = $v.isFollower;
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedPopularWorksData_popularWorks_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedPopularWorksData_popularWorks_user;
  }

  @override
  void update(
      void Function(GFeedPopularWorksData_popularWorks_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedPopularWorksData_popularWorks_user build() => _build();

  _$GFeedPopularWorksData_popularWorks_user _build() {
    final _$result = _$v ??
        new _$GFeedPopularWorksData_popularWorks_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFeedPopularWorksData_popularWorks_user', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedPopularWorksData_popularWorks_user', 'id'),
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GFeedPopularWorksData_popularWorks_user', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GFeedPopularWorksData_popularWorks_user', 'name'),
            iconUrl: iconUrl,
            isFollower: BuiltValueNullFieldError.checkNotNull(
                isFollower, r'GFeedPopularWorksData_popularWorks_user', 'isFollower'),
            isFollowee: BuiltValueNullFieldError.checkNotNull(
                isFollowee, r'GFeedPopularWorksData_popularWorks_user', 'isFollowee'),
            isMuted: BuiltValueNullFieldError.checkNotNull(
                isMuted, r'GFeedPopularWorksData_popularWorks_user', 'isMuted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
