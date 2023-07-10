// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_liked_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserLikedWorksData> _$gUserLikedWorksDataSerializer =
    new _$GUserLikedWorksDataSerializer();
Serializer<GUserLikedWorksData_user> _$gUserLikedWorksDataUserSerializer =
    new _$GUserLikedWorksData_userSerializer();
Serializer<GUserLikedWorksData_user_likedWorks>
    _$gUserLikedWorksDataUserLikedWorksSerializer =
    new _$GUserLikedWorksData_user_likedWorksSerializer();
Serializer<GUserLikedWorksData_user_likedWorks_thumbnailImage>
    _$gUserLikedWorksDataUserLikedWorksThumbnailImageSerializer =
    new _$GUserLikedWorksData_user_likedWorks_thumbnailImageSerializer();

class _$GUserLikedWorksDataSerializer
    implements StructuredSerializer<GUserLikedWorksData> {
  @override
  final Iterable<Type> types = const [
    GUserLikedWorksData,
    _$GUserLikedWorksData
  ];
  @override
  final String wireName = 'GUserLikedWorksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserLikedWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserLikedWorksData_user)));
    }
    return result;
  }

  @override
  GUserLikedWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserLikedWorksDataBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserLikedWorksData_user))!
              as GUserLikedWorksData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserLikedWorksData_userSerializer
    implements StructuredSerializer<GUserLikedWorksData_user> {
  @override
  final Iterable<Type> types = const [
    GUserLikedWorksData_user,
    _$GUserLikedWorksData_user
  ];
  @override
  final String wireName = 'GUserLikedWorksData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserLikedWorksData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'likedWorks',
      serializers.serialize(object.likedWorks,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GUserLikedWorksData_user_likedWorks)])),
    ];

    return result;
  }

  @override
  GUserLikedWorksData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserLikedWorksData_userBuilder();

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
        case 'likedWorks':
          result.likedWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserLikedWorksData_user_likedWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserLikedWorksData_user_likedWorksSerializer
    implements StructuredSerializer<GUserLikedWorksData_user_likedWorks> {
  @override
  final Iterable<Type> types = const [
    GUserLikedWorksData_user_likedWorks,
    _$GUserLikedWorksData_user_likedWorks
  ];
  @override
  final String wireName = 'GUserLikedWorksData_user_likedWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserLikedWorksData_user_likedWorks object,
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
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GUserLikedWorksData_user_likedWorks_thumbnailImage)));
    }
    return result;
  }

  @override
  GUserLikedWorksData_user_likedWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserLikedWorksData_user_likedWorksBuilder();

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
                  specifiedType: const FullType(
                      GUserLikedWorksData_user_likedWorks_thumbnailImage))!
              as GUserLikedWorksData_user_likedWorks_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserLikedWorksData_user_likedWorks_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GUserLikedWorksData_user_likedWorks_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GUserLikedWorksData_user_likedWorks_thumbnailImage,
    _$GUserLikedWorksData_user_likedWorks_thumbnailImage
  ];
  @override
  final String wireName = 'GUserLikedWorksData_user_likedWorks_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserLikedWorksData_user_likedWorks_thumbnailImage object,
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
  GUserLikedWorksData_user_likedWorks_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder();

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

class _$GUserLikedWorksData extends GUserLikedWorksData {
  @override
  final String G__typename;
  @override
  final GUserLikedWorksData_user? user;

  factory _$GUserLikedWorksData(
          [void Function(GUserLikedWorksDataBuilder)? updates]) =>
      (new GUserLikedWorksDataBuilder()..update(updates))._build();

  _$GUserLikedWorksData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserLikedWorksData', 'G__typename');
  }

  @override
  GUserLikedWorksData rebuild(
          void Function(GUserLikedWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserLikedWorksDataBuilder toBuilder() =>
      new GUserLikedWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserLikedWorksData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserLikedWorksData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserLikedWorksDataBuilder
    implements Builder<GUserLikedWorksData, GUserLikedWorksDataBuilder> {
  _$GUserLikedWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserLikedWorksData_userBuilder? _user;
  GUserLikedWorksData_userBuilder get user =>
      _$this._user ??= new GUserLikedWorksData_userBuilder();
  set user(GUserLikedWorksData_userBuilder? user) => _$this._user = user;

  GUserLikedWorksDataBuilder() {
    GUserLikedWorksData._initializeBuilder(this);
  }

  GUserLikedWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserLikedWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserLikedWorksData;
  }

  @override
  void update(void Function(GUserLikedWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserLikedWorksData build() => _build();

  _$GUserLikedWorksData _build() {
    _$GUserLikedWorksData _$result;
    try {
      _$result = _$v ??
          new _$GUserLikedWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserLikedWorksData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserLikedWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserLikedWorksData_user extends GUserLikedWorksData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GUserLikedWorksData_user_likedWorks> likedWorks;

  factory _$GUserLikedWorksData_user(
          [void Function(GUserLikedWorksData_userBuilder)? updates]) =>
      (new GUserLikedWorksData_userBuilder()..update(updates))._build();

  _$GUserLikedWorksData_user._(
      {required this.G__typename, required this.id, required this.likedWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserLikedWorksData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserLikedWorksData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        likedWorks, r'GUserLikedWorksData_user', 'likedWorks');
  }

  @override
  GUserLikedWorksData_user rebuild(
          void Function(GUserLikedWorksData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserLikedWorksData_userBuilder toBuilder() =>
      new GUserLikedWorksData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserLikedWorksData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        likedWorks == other.likedWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, likedWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserLikedWorksData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('likedWorks', likedWorks))
        .toString();
  }
}

class GUserLikedWorksData_userBuilder
    implements
        Builder<GUserLikedWorksData_user, GUserLikedWorksData_userBuilder> {
  _$GUserLikedWorksData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GUserLikedWorksData_user_likedWorks>? _likedWorks;
  ListBuilder<GUserLikedWorksData_user_likedWorks> get likedWorks =>
      _$this._likedWorks ??=
          new ListBuilder<GUserLikedWorksData_user_likedWorks>();
  set likedWorks(
          ListBuilder<GUserLikedWorksData_user_likedWorks>? likedWorks) =>
      _$this._likedWorks = likedWorks;

  GUserLikedWorksData_userBuilder() {
    GUserLikedWorksData_user._initializeBuilder(this);
  }

  GUserLikedWorksData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _likedWorks = $v.likedWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserLikedWorksData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserLikedWorksData_user;
  }

  @override
  void update(void Function(GUserLikedWorksData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserLikedWorksData_user build() => _build();

  _$GUserLikedWorksData_user _build() {
    _$GUserLikedWorksData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserLikedWorksData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserLikedWorksData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserLikedWorksData_user', 'id'),
              likedWorks: likedWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedWorks';
        likedWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserLikedWorksData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserLikedWorksData_user_likedWorks
    extends GUserLikedWorksData_user_likedWorks {
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
  final GUserLikedWorksData_user_likedWorks_thumbnailImage? thumbnailImage;

  factory _$GUserLikedWorksData_user_likedWorks(
          [void Function(GUserLikedWorksData_user_likedWorksBuilder)?
              updates]) =>
      (new GUserLikedWorksData_user_likedWorksBuilder()..update(updates))
          ._build();

  _$GUserLikedWorksData_user_likedWorks._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserLikedWorksData_user_likedWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserLikedWorksData_user_likedWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUserLikedWorksData_user_likedWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GUserLikedWorksData_user_likedWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GUserLikedWorksData_user_likedWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GUserLikedWorksData_user_likedWorks', 'createdAt');
  }

  @override
  GUserLikedWorksData_user_likedWorks rebuild(
          void Function(GUserLikedWorksData_user_likedWorksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserLikedWorksData_user_likedWorksBuilder toBuilder() =>
      new GUserLikedWorksData_user_likedWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserLikedWorksData_user_likedWorks &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        thumbnailImage == other.thumbnailImage;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserLikedWorksData_user_likedWorks')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GUserLikedWorksData_user_likedWorksBuilder
    implements
        Builder<GUserLikedWorksData_user_likedWorks,
            GUserLikedWorksData_user_likedWorksBuilder> {
  _$GUserLikedWorksData_user_likedWorks? _$v;

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

  GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder? _thumbnailImage;
  GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder();
  set thumbnailImage(
          GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GUserLikedWorksData_user_likedWorksBuilder() {
    GUserLikedWorksData_user_likedWorks._initializeBuilder(this);
  }

  GUserLikedWorksData_user_likedWorksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserLikedWorksData_user_likedWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserLikedWorksData_user_likedWorks;
  }

  @override
  void update(
      void Function(GUserLikedWorksData_user_likedWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserLikedWorksData_user_likedWorks build() => _build();

  _$GUserLikedWorksData_user_likedWorks _build() {
    _$GUserLikedWorksData_user_likedWorks _$result;
    try {
      _$result = _$v ??
          new _$GUserLikedWorksData_user_likedWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GUserLikedWorksData_user_likedWorks', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserLikedWorksData_user_likedWorks', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GUserLikedWorksData_user_likedWorks', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(likesCount,
                  r'GUserLikedWorksData_user_likedWorks', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(commentsCount,
                  r'GUserLikedWorksData_user_likedWorks', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GUserLikedWorksData_user_likedWorks', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserLikedWorksData_user_likedWorks',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserLikedWorksData_user_likedWorks_thumbnailImage
    extends GUserLikedWorksData_user_likedWorks_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserLikedWorksData_user_likedWorks_thumbnailImage(
          [void Function(
                  GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder)?
              updates]) =>
      (new GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GUserLikedWorksData_user_likedWorks_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUserLikedWorksData_user_likedWorks_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserLikedWorksData_user_likedWorks_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GUserLikedWorksData_user_likedWorks_thumbnailImage', 'downloadURL');
  }

  @override
  GUserLikedWorksData_user_likedWorks_thumbnailImage rebuild(
          void Function(
                  GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder toBuilder() =>
      new GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserLikedWorksData_user_likedWorks_thumbnailImage &&
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
            r'GUserLikedWorksData_user_likedWorks_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder
    implements
        Builder<GUserLikedWorksData_user_likedWorks_thumbnailImage,
            GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder> {
  _$GUserLikedWorksData_user_likedWorks_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder() {
    GUserLikedWorksData_user_likedWorks_thumbnailImage._initializeBuilder(this);
  }

  GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder get _$this {
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
  void replace(GUserLikedWorksData_user_likedWorks_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserLikedWorksData_user_likedWorks_thumbnailImage;
  }

  @override
  void update(
      void Function(GUserLikedWorksData_user_likedWorks_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserLikedWorksData_user_likedWorks_thumbnailImage build() => _build();

  _$GUserLikedWorksData_user_likedWorks_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GUserLikedWorksData_user_likedWorks_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GUserLikedWorksData_user_likedWorks_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GUserLikedWorksData_user_likedWorks_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GUserLikedWorksData_user_likedWorks_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
