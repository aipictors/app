// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedWorksData> _$gFeedWorksDataSerializer =
    new _$GFeedWorksDataSerializer();
Serializer<GFeedWorksData_works> _$gFeedWorksDataWorksSerializer =
    new _$GFeedWorksData_worksSerializer();
Serializer<GFeedWorksData_works_thumbnailImage>
    _$gFeedWorksDataWorksThumbnailImageSerializer =
    new _$GFeedWorksData_works_thumbnailImageSerializer();
Serializer<GFeedWorksData_works_user> _$gFeedWorksDataWorksUserSerializer =
    new _$GFeedWorksData_works_userSerializer();
Serializer<GFeedWorksData_works_user_iconImage>
    _$gFeedWorksDataWorksUserIconImageSerializer =
    new _$GFeedWorksData_works_user_iconImageSerializer();
Serializer<GFeedWorksData_works_viewer> _$gFeedWorksDataWorksViewerSerializer =
    new _$GFeedWorksData_works_viewerSerializer();

class _$GFeedWorksDataSerializer
    implements StructuredSerializer<GFeedWorksData> {
  @override
  final Iterable<Type> types = const [GFeedWorksData, _$GFeedWorksData];
  @override
  final String wireName = 'GFeedWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFeedWorksData object,
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
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFeedWorksData_works)])));
    }
    return result;
  }

  @override
  GFeedWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedWorksDataBuilder();

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
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFeedWorksData_works)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedWorksData_worksSerializer
    implements StructuredSerializer<GFeedWorksData_works> {
  @override
  final Iterable<Type> types = const [
    GFeedWorksData_works,
    _$GFeedWorksData_works
  ];
  @override
  final String wireName = 'GFeedWorksData_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedWorksData_works object,
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
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GFeedWorksData_works_user)),
      'viewer',
      serializers.serialize(object.viewer,
          specifiedType: const FullType(GFeedWorksData_works_viewer)),
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GFeedWorksData_works_thumbnailImage)));
    }
    return result;
  }

  @override
  GFeedWorksData_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedWorksData_worksBuilder();

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
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFeedWorksData_works_thumbnailImage))!
              as GFeedWorksData_works_thumbnailImage);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFeedWorksData_works_user))!
              as GFeedWorksData_works_user);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFeedWorksData_works_viewer))!
              as GFeedWorksData_works_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedWorksData_works_thumbnailImageSerializer
    implements StructuredSerializer<GFeedWorksData_works_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GFeedWorksData_works_thumbnailImage,
    _$GFeedWorksData_works_thumbnailImage
  ];
  @override
  final String wireName = 'GFeedWorksData_works_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedWorksData_works_thumbnailImage object,
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
  GFeedWorksData_works_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedWorksData_works_thumbnailImageBuilder();

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

class _$GFeedWorksData_works_userSerializer
    implements StructuredSerializer<GFeedWorksData_works_user> {
  @override
  final Iterable<Type> types = const [
    GFeedWorksData_works_user,
    _$GFeedWorksData_works_user
  ];
  @override
  final String wireName = 'GFeedWorksData_works_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedWorksData_works_user object,
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
                const FullType(GFeedWorksData_works_user_iconImage)));
    }
    return result;
  }

  @override
  GFeedWorksData_works_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedWorksData_works_userBuilder();

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
                  specifiedType:
                      const FullType(GFeedWorksData_works_user_iconImage))!
              as GFeedWorksData_works_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedWorksData_works_user_iconImageSerializer
    implements StructuredSerializer<GFeedWorksData_works_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GFeedWorksData_works_user_iconImage,
    _$GFeedWorksData_works_user_iconImage
  ];
  @override
  final String wireName = 'GFeedWorksData_works_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedWorksData_works_user_iconImage object,
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
  GFeedWorksData_works_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedWorksData_works_user_iconImageBuilder();

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

class _$GFeedWorksData_works_viewerSerializer
    implements StructuredSerializer<GFeedWorksData_works_viewer> {
  @override
  final Iterable<Type> types = const [
    GFeedWorksData_works_viewer,
    _$GFeedWorksData_works_viewer
  ];
  @override
  final String wireName = 'GFeedWorksData_works_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedWorksData_works_viewer object,
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
  GFeedWorksData_works_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedWorksData_works_viewerBuilder();

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

class _$GFeedWorksData extends GFeedWorksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFeedWorksData_works>? works;

  factory _$GFeedWorksData([void Function(GFeedWorksDataBuilder)? updates]) =>
      (new GFeedWorksDataBuilder()..update(updates))._build();

  _$GFeedWorksData._({required this.G__typename, this.works}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedWorksData', 'G__typename');
  }

  @override
  GFeedWorksData rebuild(void Function(GFeedWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedWorksDataBuilder toBuilder() =>
      new GFeedWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedWorksData &&
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
    return (newBuiltValueToStringHelper(r'GFeedWorksData')
          ..add('G__typename', G__typename)
          ..add('works', works))
        .toString();
  }
}

class GFeedWorksDataBuilder
    implements Builder<GFeedWorksData, GFeedWorksDataBuilder> {
  _$GFeedWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFeedWorksData_works>? _works;
  ListBuilder<GFeedWorksData_works> get works =>
      _$this._works ??= new ListBuilder<GFeedWorksData_works>();
  set works(ListBuilder<GFeedWorksData_works>? works) => _$this._works = works;

  GFeedWorksDataBuilder() {
    GFeedWorksData._initializeBuilder(this);
  }

  GFeedWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _works = $v.works?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedWorksData;
  }

  @override
  void update(void Function(GFeedWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedWorksData build() => _build();

  _$GFeedWorksData _build() {
    _$GFeedWorksData _$result;
    try {
      _$result = _$v ??
          new _$GFeedWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedWorksData', 'G__typename'),
              works: _works?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        _works?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedWorksData_works extends GFeedWorksData_works {
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
  final GFeedWorksData_works_thumbnailImage? thumbnailImage;
  @override
  final GFeedWorksData_works_user user;
  @override
  final GFeedWorksData_works_viewer viewer;

  factory _$GFeedWorksData_works(
          [void Function(GFeedWorksData_worksBuilder)? updates]) =>
      (new GFeedWorksData_worksBuilder()..update(updates))._build();

  _$GFeedWorksData_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage,
      required this.user,
      required this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedWorksData_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GFeedWorksData_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFeedWorksData_works', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GFeedWorksData_works', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GFeedWorksData_works', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFeedWorksData_works', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GFeedWorksData_works', 'user');
    BuiltValueNullFieldError.checkNotNull(
        viewer, r'GFeedWorksData_works', 'viewer');
  }

  @override
  GFeedWorksData_works rebuild(
          void Function(GFeedWorksData_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedWorksData_worksBuilder toBuilder() =>
      new GFeedWorksData_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedWorksData_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        thumbnailImage == other.thumbnailImage &&
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
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedWorksData_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('thumbnailImage', thumbnailImage)
          ..add('user', user)
          ..add('viewer', viewer))
        .toString();
  }
}

class GFeedWorksData_worksBuilder
    implements Builder<GFeedWorksData_works, GFeedWorksData_worksBuilder> {
  _$GFeedWorksData_works? _$v;

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

  GFeedWorksData_works_thumbnailImageBuilder? _thumbnailImage;
  GFeedWorksData_works_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GFeedWorksData_works_thumbnailImageBuilder();
  set thumbnailImage(
          GFeedWorksData_works_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GFeedWorksData_works_userBuilder? _user;
  GFeedWorksData_works_userBuilder get user =>
      _$this._user ??= new GFeedWorksData_works_userBuilder();
  set user(GFeedWorksData_works_userBuilder? user) => _$this._user = user;

  GFeedWorksData_works_viewerBuilder? _viewer;
  GFeedWorksData_works_viewerBuilder get viewer =>
      _$this._viewer ??= new GFeedWorksData_works_viewerBuilder();
  set viewer(GFeedWorksData_works_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GFeedWorksData_worksBuilder() {
    GFeedWorksData_works._initializeBuilder(this);
  }

  GFeedWorksData_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _user = $v.user.toBuilder();
      _viewer = $v.viewer.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedWorksData_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedWorksData_works;
  }

  @override
  void update(void Function(GFeedWorksData_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedWorksData_works build() => _build();

  _$GFeedWorksData_works _build() {
    _$GFeedWorksData_works _$result;
    try {
      _$result = _$v ??
          new _$GFeedWorksData_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedWorksData_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedWorksData_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFeedWorksData_works', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GFeedWorksData_works', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GFeedWorksData_works', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GFeedWorksData_works', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build(),
              user: user.build(),
              viewer: viewer.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
        _$failedField = 'user';
        user.build();
        _$failedField = 'viewer';
        viewer.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedWorksData_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedWorksData_works_thumbnailImage
    extends GFeedWorksData_works_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFeedWorksData_works_thumbnailImage(
          [void Function(GFeedWorksData_works_thumbnailImageBuilder)?
              updates]) =>
      (new GFeedWorksData_works_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GFeedWorksData_works_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedWorksData_works_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedWorksData_works_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GFeedWorksData_works_thumbnailImage', 'downloadURL');
  }

  @override
  GFeedWorksData_works_thumbnailImage rebuild(
          void Function(GFeedWorksData_works_thumbnailImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedWorksData_works_thumbnailImageBuilder toBuilder() =>
      new GFeedWorksData_works_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedWorksData_works_thumbnailImage &&
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
    return (newBuiltValueToStringHelper(r'GFeedWorksData_works_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFeedWorksData_works_thumbnailImageBuilder
    implements
        Builder<GFeedWorksData_works_thumbnailImage,
            GFeedWorksData_works_thumbnailImageBuilder> {
  _$GFeedWorksData_works_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFeedWorksData_works_thumbnailImageBuilder() {
    GFeedWorksData_works_thumbnailImage._initializeBuilder(this);
  }

  GFeedWorksData_works_thumbnailImageBuilder get _$this {
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
  void replace(GFeedWorksData_works_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedWorksData_works_thumbnailImage;
  }

  @override
  void update(
      void Function(GFeedWorksData_works_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedWorksData_works_thumbnailImage build() => _build();

  _$GFeedWorksData_works_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GFeedWorksData_works_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFeedWorksData_works_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedWorksData_works_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFeedWorksData_works_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFeedWorksData_works_user extends GFeedWorksData_works_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GFeedWorksData_works_user_iconImage? iconImage;

  factory _$GFeedWorksData_works_user(
          [void Function(GFeedWorksData_works_userBuilder)? updates]) =>
      (new GFeedWorksData_works_userBuilder()..update(updates))._build();

  _$GFeedWorksData_works_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedWorksData_works_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedWorksData_works_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFeedWorksData_works_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFeedWorksData_works_user', 'name');
  }

  @override
  GFeedWorksData_works_user rebuild(
          void Function(GFeedWorksData_works_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedWorksData_works_userBuilder toBuilder() =>
      new GFeedWorksData_works_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedWorksData_works_user &&
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
    return (newBuiltValueToStringHelper(r'GFeedWorksData_works_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GFeedWorksData_works_userBuilder
    implements
        Builder<GFeedWorksData_works_user, GFeedWorksData_works_userBuilder> {
  _$GFeedWorksData_works_user? _$v;

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

  GFeedWorksData_works_user_iconImageBuilder? _iconImage;
  GFeedWorksData_works_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GFeedWorksData_works_user_iconImageBuilder();
  set iconImage(GFeedWorksData_works_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GFeedWorksData_works_userBuilder() {
    GFeedWorksData_works_user._initializeBuilder(this);
  }

  GFeedWorksData_works_userBuilder get _$this {
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
  void replace(GFeedWorksData_works_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedWorksData_works_user;
  }

  @override
  void update(void Function(GFeedWorksData_works_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedWorksData_works_user build() => _build();

  _$GFeedWorksData_works_user _build() {
    _$GFeedWorksData_works_user _$result;
    try {
      _$result = _$v ??
          new _$GFeedWorksData_works_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedWorksData_works_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedWorksData_works_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GFeedWorksData_works_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GFeedWorksData_works_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedWorksData_works_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedWorksData_works_user_iconImage
    extends GFeedWorksData_works_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFeedWorksData_works_user_iconImage(
          [void Function(GFeedWorksData_works_user_iconImageBuilder)?
              updates]) =>
      (new GFeedWorksData_works_user_iconImageBuilder()..update(updates))
          ._build();

  _$GFeedWorksData_works_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedWorksData_works_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedWorksData_works_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GFeedWorksData_works_user_iconImage', 'downloadURL');
  }

  @override
  GFeedWorksData_works_user_iconImage rebuild(
          void Function(GFeedWorksData_works_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedWorksData_works_user_iconImageBuilder toBuilder() =>
      new GFeedWorksData_works_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedWorksData_works_user_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GFeedWorksData_works_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFeedWorksData_works_user_iconImageBuilder
    implements
        Builder<GFeedWorksData_works_user_iconImage,
            GFeedWorksData_works_user_iconImageBuilder> {
  _$GFeedWorksData_works_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFeedWorksData_works_user_iconImageBuilder() {
    GFeedWorksData_works_user_iconImage._initializeBuilder(this);
  }

  GFeedWorksData_works_user_iconImageBuilder get _$this {
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
  void replace(GFeedWorksData_works_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedWorksData_works_user_iconImage;
  }

  @override
  void update(
      void Function(GFeedWorksData_works_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedWorksData_works_user_iconImage build() => _build();

  _$GFeedWorksData_works_user_iconImage _build() {
    final _$result = _$v ??
        new _$GFeedWorksData_works_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFeedWorksData_works_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedWorksData_works_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFeedWorksData_works_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFeedWorksData_works_viewer extends GFeedWorksData_works_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;
  @override
  final bool isBookmarked;

  factory _$GFeedWorksData_works_viewer(
          [void Function(GFeedWorksData_works_viewerBuilder)? updates]) =>
      (new GFeedWorksData_works_viewerBuilder()..update(updates))._build();

  _$GFeedWorksData_works_viewer._(
      {required this.G__typename,
      required this.id,
      required this.isLiked,
      required this.isBookmarked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedWorksData_works_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedWorksData_works_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GFeedWorksData_works_viewer', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(
        isBookmarked, r'GFeedWorksData_works_viewer', 'isBookmarked');
  }

  @override
  GFeedWorksData_works_viewer rebuild(
          void Function(GFeedWorksData_works_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedWorksData_works_viewerBuilder toBuilder() =>
      new GFeedWorksData_works_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedWorksData_works_viewer &&
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
    return (newBuiltValueToStringHelper(r'GFeedWorksData_works_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked)
          ..add('isBookmarked', isBookmarked))
        .toString();
  }
}

class GFeedWorksData_works_viewerBuilder
    implements
        Builder<GFeedWorksData_works_viewer,
            GFeedWorksData_works_viewerBuilder> {
  _$GFeedWorksData_works_viewer? _$v;

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

  GFeedWorksData_works_viewerBuilder() {
    GFeedWorksData_works_viewer._initializeBuilder(this);
  }

  GFeedWorksData_works_viewerBuilder get _$this {
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
  void replace(GFeedWorksData_works_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedWorksData_works_viewer;
  }

  @override
  void update(void Function(GFeedWorksData_works_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedWorksData_works_viewer build() => _build();

  _$GFeedWorksData_works_viewer _build() {
    final _$result = _$v ??
        new _$GFeedWorksData_works_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GFeedWorksData_works_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedWorksData_works_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GFeedWorksData_works_viewer', 'isLiked'),
            isBookmarked: BuiltValueNullFieldError.checkNotNull(
                isBookmarked, r'GFeedWorksData_works_viewer', 'isBookmarked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
