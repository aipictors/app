// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStickerData> _$gStickerDataSerializer =
    new _$GStickerDataSerializer();
Serializer<GStickerData_sticker> _$gStickerDataStickerSerializer =
    new _$GStickerData_stickerSerializer();
Serializer<GStickerData_sticker_image> _$gStickerDataStickerImageSerializer =
    new _$GStickerData_sticker_imageSerializer();
Serializer<GStickerData_sticker_user> _$gStickerDataStickerUserSerializer =
    new _$GStickerData_sticker_userSerializer();
Serializer<GStickerData_sticker_user_iconImage>
    _$gStickerDataStickerUserIconImageSerializer =
    new _$GStickerData_sticker_user_iconImageSerializer();

class _$GStickerDataSerializer implements StructuredSerializer<GStickerData> {
  @override
  final Iterable<Type> types = const [GStickerData, _$GStickerData];
  @override
  final String wireName = 'GStickerData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStickerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GStickerData_sticker)));
    }
    return result;
  }

  @override
  GStickerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerDataBuilder();

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
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GStickerData_sticker))!
              as GStickerData_sticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GStickerData_stickerSerializer
    implements StructuredSerializer<GStickerData_sticker> {
  @override
  final Iterable<Type> types = const [
    GStickerData_sticker,
    _$GStickerData_sticker
  ];
  @override
  final String wireName = 'GStickerData_sticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickerData_sticker object,
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
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GStickerData_sticker_user)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
      'downloadsCount',
      serializers.serialize(object.downloadsCount,
          specifiedType: const FullType(int)),
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'usesCount',
      serializers.serialize(object.usesCount,
          specifiedType: const FullType(int)),
      'genre',
      serializers.serialize(object.genre,
          specifiedType: const FullType(_i2.GStickerGenre)),
      'categories',
      serializers.serialize(object.categories,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'isDownloaded',
      serializers.serialize(object.isDownloaded,
          specifiedType: const FullType(bool)),
      'isDeleted',
      serializers.serialize(object.isDeleted,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GStickerData_sticker_image)));
    }
    return result;
  }

  @override
  GStickerData_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerData_stickerBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GStickerData_sticker_image))!
              as GStickerData_sticker_image);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GStickerData_sticker_user))!
              as GStickerData_sticker_user);
          break;
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'downloadsCount':
          result.downloadsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'usesCount':
          result.usesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'genre':
          result.genre = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GStickerGenre))!
              as _i2.GStickerGenre;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'isDownloaded':
          result.isDownloaded = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GStickerData_sticker_imageSerializer
    implements StructuredSerializer<GStickerData_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GStickerData_sticker_image,
    _$GStickerData_sticker_image
  ];
  @override
  final String wireName = 'GStickerData_sticker_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickerData_sticker_image object,
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
  GStickerData_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerData_sticker_imageBuilder();

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

class _$GStickerData_sticker_userSerializer
    implements StructuredSerializer<GStickerData_sticker_user> {
  @override
  final Iterable<Type> types = const [
    GStickerData_sticker_user,
    _$GStickerData_sticker_user
  ];
  @override
  final String wireName = 'GStickerData_sticker_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickerData_sticker_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
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
                const FullType(GStickerData_sticker_user_iconImage)));
    }
    return result;
  }

  @override
  GStickerData_sticker_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerData_sticker_userBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GStickerData_sticker_user_iconImage))!
              as GStickerData_sticker_user_iconImage);
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

class _$GStickerData_sticker_user_iconImageSerializer
    implements StructuredSerializer<GStickerData_sticker_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GStickerData_sticker_user_iconImage,
    _$GStickerData_sticker_user_iconImage
  ];
  @override
  final String wireName = 'GStickerData_sticker_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickerData_sticker_user_iconImage object,
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
  GStickerData_sticker_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerData_sticker_user_iconImageBuilder();

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

class _$GStickerData extends GStickerData {
  @override
  final String G__typename;
  @override
  final GStickerData_sticker? sticker;

  factory _$GStickerData([void Function(GStickerDataBuilder)? updates]) =>
      (new GStickerDataBuilder()..update(updates))._build();

  _$GStickerData._({required this.G__typename, this.sticker}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickerData', 'G__typename');
  }

  @override
  GStickerData rebuild(void Function(GStickerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerDataBuilder toBuilder() => new GStickerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerData &&
        G__typename == other.G__typename &&
        sticker == other.sticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, sticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickerData')
          ..add('G__typename', G__typename)
          ..add('sticker', sticker))
        .toString();
  }
}

class GStickerDataBuilder
    implements Builder<GStickerData, GStickerDataBuilder> {
  _$GStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GStickerData_stickerBuilder? _sticker;
  GStickerData_stickerBuilder get sticker =>
      _$this._sticker ??= new GStickerData_stickerBuilder();
  set sticker(GStickerData_stickerBuilder? sticker) =>
      _$this._sticker = sticker;

  GStickerDataBuilder() {
    GStickerData._initializeBuilder(this);
  }

  GStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _sticker = $v.sticker?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerData;
  }

  @override
  void update(void Function(GStickerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerData build() => _build();

  _$GStickerData _build() {
    _$GStickerData _$result;
    try {
      _$result = _$v ??
          new _$GStickerData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickerData', 'G__typename'),
              sticker: _sticker?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sticker';
        _sticker?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickerData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickerData_sticker extends GStickerData_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String title;
  @override
  final GStickerData_sticker_image? image;
  @override
  final GStickerData_sticker_user user;
  @override
  final bool isLiked;
  @override
  final int downloadsCount;
  @override
  final int likesCount;
  @override
  final int usesCount;
  @override
  final _i2.GStickerGenre genre;
  @override
  final BuiltList<String> categories;
  @override
  final bool isDownloaded;
  @override
  final bool isDeleted;

  factory _$GStickerData_sticker(
          [void Function(GStickerData_stickerBuilder)? updates]) =>
      (new GStickerData_stickerBuilder()..update(updates))._build();

  _$GStickerData_sticker._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      required this.title,
      this.image,
      required this.user,
      required this.isLiked,
      required this.downloadsCount,
      required this.likesCount,
      required this.usesCount,
      required this.genre,
      required this.categories,
      required this.isDownloaded,
      required this.isDeleted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickerData_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GStickerData_sticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GStickerData_sticker', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GStickerData_sticker', 'title');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GStickerData_sticker', 'user');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GStickerData_sticker', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(
        downloadsCount, r'GStickerData_sticker', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GStickerData_sticker', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        usesCount, r'GStickerData_sticker', 'usesCount');
    BuiltValueNullFieldError.checkNotNull(
        genre, r'GStickerData_sticker', 'genre');
    BuiltValueNullFieldError.checkNotNull(
        categories, r'GStickerData_sticker', 'categories');
    BuiltValueNullFieldError.checkNotNull(
        isDownloaded, r'GStickerData_sticker', 'isDownloaded');
    BuiltValueNullFieldError.checkNotNull(
        isDeleted, r'GStickerData_sticker', 'isDeleted');
  }

  @override
  GStickerData_sticker rebuild(
          void Function(GStickerData_stickerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerData_stickerBuilder toBuilder() =>
      new GStickerData_stickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerData_sticker &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        title == other.title &&
        image == other.image &&
        user == other.user &&
        isLiked == other.isLiked &&
        downloadsCount == other.downloadsCount &&
        likesCount == other.likesCount &&
        usesCount == other.usesCount &&
        genre == other.genre &&
        categories == other.categories &&
        isDownloaded == other.isDownloaded &&
        isDeleted == other.isDeleted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jc(_$hash, downloadsCount.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, usesCount.hashCode);
    _$hash = $jc(_$hash, genre.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, isDownloaded.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickerData_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('title', title)
          ..add('image', image)
          ..add('user', user)
          ..add('isLiked', isLiked)
          ..add('downloadsCount', downloadsCount)
          ..add('likesCount', likesCount)
          ..add('usesCount', usesCount)
          ..add('genre', genre)
          ..add('categories', categories)
          ..add('isDownloaded', isDownloaded)
          ..add('isDeleted', isDeleted))
        .toString();
  }
}

class GStickerData_stickerBuilder
    implements Builder<GStickerData_sticker, GStickerData_stickerBuilder> {
  _$GStickerData_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GStickerData_sticker_imageBuilder? _image;
  GStickerData_sticker_imageBuilder get image =>
      _$this._image ??= new GStickerData_sticker_imageBuilder();
  set image(GStickerData_sticker_imageBuilder? image) => _$this._image = image;

  GStickerData_sticker_userBuilder? _user;
  GStickerData_sticker_userBuilder get user =>
      _$this._user ??= new GStickerData_sticker_userBuilder();
  set user(GStickerData_sticker_userBuilder? user) => _$this._user = user;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  int? _downloadsCount;
  int? get downloadsCount => _$this._downloadsCount;
  set downloadsCount(int? downloadsCount) =>
      _$this._downloadsCount = downloadsCount;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _usesCount;
  int? get usesCount => _$this._usesCount;
  set usesCount(int? usesCount) => _$this._usesCount = usesCount;

  _i2.GStickerGenre? _genre;
  _i2.GStickerGenre? get genre => _$this._genre;
  set genre(_i2.GStickerGenre? genre) => _$this._genre = genre;

  ListBuilder<String>? _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String>? categories) =>
      _$this._categories = categories;

  bool? _isDownloaded;
  bool? get isDownloaded => _$this._isDownloaded;
  set isDownloaded(bool? isDownloaded) => _$this._isDownloaded = isDownloaded;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  GStickerData_stickerBuilder() {
    GStickerData_sticker._initializeBuilder(this);
  }

  GStickerData_stickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _title = $v.title;
      _image = $v.image?.toBuilder();
      _user = $v.user.toBuilder();
      _isLiked = $v.isLiked;
      _downloadsCount = $v.downloadsCount;
      _likesCount = $v.likesCount;
      _usesCount = $v.usesCount;
      _genre = $v.genre;
      _categories = $v.categories.toBuilder();
      _isDownloaded = $v.isDownloaded;
      _isDeleted = $v.isDeleted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickerData_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerData_sticker;
  }

  @override
  void update(void Function(GStickerData_stickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerData_sticker build() => _build();

  _$GStickerData_sticker _build() {
    _$GStickerData_sticker _$result;
    try {
      _$result = _$v ??
          new _$GStickerData_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickerData_sticker', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GStickerData_sticker', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GStickerData_sticker', 'createdAt'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GStickerData_sticker', 'title'),
              image: _image?.build(),
              user: user.build(),
              isLiked: BuiltValueNullFieldError.checkNotNull(
                  isLiked, r'GStickerData_sticker', 'isLiked'),
              downloadsCount: BuiltValueNullFieldError.checkNotNull(
                  downloadsCount, r'GStickerData_sticker', 'downloadsCount'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GStickerData_sticker', 'likesCount'),
              usesCount: BuiltValueNullFieldError.checkNotNull(
                  usesCount, r'GStickerData_sticker', 'usesCount'),
              genre:
                  BuiltValueNullFieldError.checkNotNull(genre, r'GStickerData_sticker', 'genre'),
              categories: categories.build(),
              isDownloaded: BuiltValueNullFieldError.checkNotNull(isDownloaded, r'GStickerData_sticker', 'isDownloaded'),
              isDeleted: BuiltValueNullFieldError.checkNotNull(isDeleted, r'GStickerData_sticker', 'isDeleted'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'user';
        user.build();

        _$failedField = 'categories';
        categories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickerData_sticker', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickerData_sticker_image extends GStickerData_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GStickerData_sticker_image(
          [void Function(GStickerData_sticker_imageBuilder)? updates]) =>
      (new GStickerData_sticker_imageBuilder()..update(updates))._build();

  _$GStickerData_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickerData_sticker_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GStickerData_sticker_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GStickerData_sticker_image', 'downloadURL');
  }

  @override
  GStickerData_sticker_image rebuild(
          void Function(GStickerData_sticker_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerData_sticker_imageBuilder toBuilder() =>
      new GStickerData_sticker_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerData_sticker_image &&
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
    return (newBuiltValueToStringHelper(r'GStickerData_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GStickerData_sticker_imageBuilder
    implements
        Builder<GStickerData_sticker_image, GStickerData_sticker_imageBuilder> {
  _$GStickerData_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GStickerData_sticker_imageBuilder() {
    GStickerData_sticker_image._initializeBuilder(this);
  }

  GStickerData_sticker_imageBuilder get _$this {
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
  void replace(GStickerData_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerData_sticker_image;
  }

  @override
  void update(void Function(GStickerData_sticker_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerData_sticker_image build() => _build();

  _$GStickerData_sticker_image _build() {
    final _$result = _$v ??
        new _$GStickerData_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GStickerData_sticker_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GStickerData_sticker_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GStickerData_sticker_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GStickerData_sticker_user extends GStickerData_sticker_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GStickerData_sticker_user_iconImage? iconImage;
  @override
  final bool isFollower;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GStickerData_sticker_user(
          [void Function(GStickerData_sticker_userBuilder)? updates]) =>
      (new GStickerData_sticker_userBuilder()..update(updates))._build();

  _$GStickerData_sticker_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage,
      required this.isFollower,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickerData_sticker_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GStickerData_sticker_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GStickerData_sticker_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GStickerData_sticker_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        isFollower, r'GStickerData_sticker_user', 'isFollower');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GStickerData_sticker_user', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GStickerData_sticker_user', 'isMuted');
  }

  @override
  GStickerData_sticker_user rebuild(
          void Function(GStickerData_sticker_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerData_sticker_userBuilder toBuilder() =>
      new GStickerData_sticker_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerData_sticker_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
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
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jc(_$hash, isFollower.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickerData_sticker_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage)
          ..add('isFollower', isFollower)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GStickerData_sticker_userBuilder
    implements
        Builder<GStickerData_sticker_user, GStickerData_sticker_userBuilder> {
  _$GStickerData_sticker_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  GStickerData_sticker_user_iconImageBuilder? _iconImage;
  GStickerData_sticker_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GStickerData_sticker_user_iconImageBuilder();
  set iconImage(GStickerData_sticker_user_iconImageBuilder? iconImage) =>
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

  GStickerData_sticker_userBuilder() {
    GStickerData_sticker_user._initializeBuilder(this);
  }

  GStickerData_sticker_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _isFollower = $v.isFollower;
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickerData_sticker_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerData_sticker_user;
  }

  @override
  void update(void Function(GStickerData_sticker_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerData_sticker_user build() => _build();

  _$GStickerData_sticker_user _build() {
    _$GStickerData_sticker_user _$result;
    try {
      _$result = _$v ??
          new _$GStickerData_sticker_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickerData_sticker_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GStickerData_sticker_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GStickerData_sticker_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GStickerData_sticker_user', 'login'),
              iconImage: _iconImage?.build(),
              isFollower: BuiltValueNullFieldError.checkNotNull(
                  isFollower, r'GStickerData_sticker_user', 'isFollower'),
              isFollowee: BuiltValueNullFieldError.checkNotNull(
                  isFollowee, r'GStickerData_sticker_user', 'isFollowee'),
              isMuted: BuiltValueNullFieldError.checkNotNull(
                  isMuted, r'GStickerData_sticker_user', 'isMuted'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickerData_sticker_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickerData_sticker_user_iconImage
    extends GStickerData_sticker_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GStickerData_sticker_user_iconImage(
          [void Function(GStickerData_sticker_user_iconImageBuilder)?
              updates]) =>
      (new GStickerData_sticker_user_iconImageBuilder()..update(updates))
          ._build();

  _$GStickerData_sticker_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickerData_sticker_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GStickerData_sticker_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GStickerData_sticker_user_iconImage', 'downloadURL');
  }

  @override
  GStickerData_sticker_user_iconImage rebuild(
          void Function(GStickerData_sticker_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerData_sticker_user_iconImageBuilder toBuilder() =>
      new GStickerData_sticker_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerData_sticker_user_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GStickerData_sticker_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GStickerData_sticker_user_iconImageBuilder
    implements
        Builder<GStickerData_sticker_user_iconImage,
            GStickerData_sticker_user_iconImageBuilder> {
  _$GStickerData_sticker_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GStickerData_sticker_user_iconImageBuilder() {
    GStickerData_sticker_user_iconImage._initializeBuilder(this);
  }

  GStickerData_sticker_user_iconImageBuilder get _$this {
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
  void replace(GStickerData_sticker_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerData_sticker_user_iconImage;
  }

  @override
  void update(
      void Function(GStickerData_sticker_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerData_sticker_user_iconImage build() => _build();

  _$GStickerData_sticker_user_iconImage _build() {
    final _$result = _$v ??
        new _$GStickerData_sticker_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GStickerData_sticker_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GStickerData_sticker_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GStickerData_sticker_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
