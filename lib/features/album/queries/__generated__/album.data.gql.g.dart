// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAlbumData> _$gAlbumDataSerializer = new _$GAlbumDataSerializer();
Serializer<GAlbumData_album> _$gAlbumDataAlbumSerializer =
    new _$GAlbumData_albumSerializer();
Serializer<GAlbumData_album_user> _$gAlbumDataAlbumUserSerializer =
    new _$GAlbumData_album_userSerializer();
Serializer<GAlbumData_album_user_iconImage>
    _$gAlbumDataAlbumUserIconImageSerializer =
    new _$GAlbumData_album_user_iconImageSerializer();

class _$GAlbumDataSerializer implements StructuredSerializer<GAlbumData> {
  @override
  final Iterable<Type> types = const [GAlbumData, _$GAlbumData];
  @override
  final String wireName = 'GAlbumData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAlbumData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.album;
    if (value != null) {
      result
        ..add('album')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAlbumData_album)));
    }
    return result;
  }

  @override
  GAlbumData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumDataBuilder();

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
        case 'album':
          result.album.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAlbumData_album))!
              as GAlbumData_album);
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumData_albumSerializer
    implements StructuredSerializer<GAlbumData_album> {
  @override
  final Iterable<Type> types = const [GAlbumData_album, _$GAlbumData_album];
  @override
  final String wireName = 'GAlbumData_album';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAlbumData_album object,
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
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GAlbumData_album_user)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'isSensitive',
      serializers.serialize(object.isSensitive,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.slug;
    if (value != null) {
      result
        ..add('slug')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumbnailImageURL;
    if (value != null) {
      result
        ..add('thumbnailImageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAlbumData_album deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumData_albumBuilder();

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
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAlbumData_album_user))!
              as GAlbumData_album_user);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'isSensitive':
          result.isSensitive = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'thumbnailImageURL':
          result.thumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumData_album_userSerializer
    implements StructuredSerializer<GAlbumData_album_user> {
  @override
  final Iterable<Type> types = const [
    GAlbumData_album_user,
    _$GAlbumData_album_user
  ];
  @override
  final String wireName = 'GAlbumData_album_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumData_album_user object,
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
            specifiedType: const FullType(GAlbumData_album_user_iconImage)));
    }
    return result;
  }

  @override
  GAlbumData_album_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumData_album_userBuilder();

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
                      const FullType(GAlbumData_album_user_iconImage))!
              as GAlbumData_album_user_iconImage);
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

class _$GAlbumData_album_user_iconImageSerializer
    implements StructuredSerializer<GAlbumData_album_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GAlbumData_album_user_iconImage,
    _$GAlbumData_album_user_iconImage
  ];
  @override
  final String wireName = 'GAlbumData_album_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumData_album_user_iconImage object,
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
  GAlbumData_album_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumData_album_user_iconImageBuilder();

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

class _$GAlbumData extends GAlbumData {
  @override
  final String G__typename;
  @override
  final GAlbumData_album? album;

  factory _$GAlbumData([void Function(GAlbumDataBuilder)? updates]) =>
      (new GAlbumDataBuilder()..update(updates))._build();

  _$GAlbumData._({required this.G__typename, this.album}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumData', 'G__typename');
  }

  @override
  GAlbumData rebuild(void Function(GAlbumDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumDataBuilder toBuilder() => new GAlbumDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumData &&
        G__typename == other.G__typename &&
        album == other.album;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, album.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumData')
          ..add('G__typename', G__typename)
          ..add('album', album))
        .toString();
  }
}

class GAlbumDataBuilder implements Builder<GAlbumData, GAlbumDataBuilder> {
  _$GAlbumData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAlbumData_albumBuilder? _album;
  GAlbumData_albumBuilder get album =>
      _$this._album ??= new GAlbumData_albumBuilder();
  set album(GAlbumData_albumBuilder? album) => _$this._album = album;

  GAlbumDataBuilder() {
    GAlbumData._initializeBuilder(this);
  }

  GAlbumDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _album = $v.album?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumData;
  }

  @override
  void update(void Function(GAlbumDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumData build() => _build();

  _$GAlbumData _build() {
    _$GAlbumData _$result;
    try {
      _$result = _$v ??
          new _$GAlbumData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAlbumData', 'G__typename'),
              album: _album?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'album';
        _album?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumData_album extends GAlbumData_album {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? slug;
  @override
  final String title;
  @override
  final String description;
  @override
  final GAlbumData_album_user user;
  @override
  final int createdAt;
  @override
  final bool isSensitive;
  @override
  final String? thumbnailImageURL;

  factory _$GAlbumData_album(
          [void Function(GAlbumData_albumBuilder)? updates]) =>
      (new GAlbumData_albumBuilder()..update(updates))._build();

  _$GAlbumData_album._(
      {required this.G__typename,
      required this.id,
      this.slug,
      required this.title,
      required this.description,
      required this.user,
      required this.createdAt,
      required this.isSensitive,
      this.thumbnailImageURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumData_album', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GAlbumData_album', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'GAlbumData_album', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GAlbumData_album', 'description');
    BuiltValueNullFieldError.checkNotNull(user, r'GAlbumData_album', 'user');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GAlbumData_album', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        isSensitive, r'GAlbumData_album', 'isSensitive');
  }

  @override
  GAlbumData_album rebuild(void Function(GAlbumData_albumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumData_albumBuilder toBuilder() =>
      new GAlbumData_albumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumData_album &&
        G__typename == other.G__typename &&
        id == other.id &&
        slug == other.slug &&
        title == other.title &&
        description == other.description &&
        user == other.user &&
        createdAt == other.createdAt &&
        isSensitive == other.isSensitive &&
        thumbnailImageURL == other.thumbnailImageURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, isSensitive.hashCode);
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumData_album')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('slug', slug)
          ..add('title', title)
          ..add('description', description)
          ..add('user', user)
          ..add('createdAt', createdAt)
          ..add('isSensitive', isSensitive)
          ..add('thumbnailImageURL', thumbnailImageURL))
        .toString();
  }
}

class GAlbumData_albumBuilder
    implements Builder<GAlbumData_album, GAlbumData_albumBuilder> {
  _$GAlbumData_album? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GAlbumData_album_userBuilder? _user;
  GAlbumData_album_userBuilder get user =>
      _$this._user ??= new GAlbumData_album_userBuilder();
  set user(GAlbumData_album_userBuilder? user) => _$this._user = user;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  bool? _isSensitive;
  bool? get isSensitive => _$this._isSensitive;
  set isSensitive(bool? isSensitive) => _$this._isSensitive = isSensitive;

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  GAlbumData_albumBuilder() {
    GAlbumData_album._initializeBuilder(this);
  }

  GAlbumData_albumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _slug = $v.slug;
      _title = $v.title;
      _description = $v.description;
      _user = $v.user.toBuilder();
      _createdAt = $v.createdAt;
      _isSensitive = $v.isSensitive;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumData_album other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumData_album;
  }

  @override
  void update(void Function(GAlbumData_albumBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumData_album build() => _build();

  _$GAlbumData_album _build() {
    _$GAlbumData_album _$result;
    try {
      _$result = _$v ??
          new _$GAlbumData_album._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAlbumData_album', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GAlbumData_album', 'id'),
              slug: slug,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GAlbumData_album', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GAlbumData_album', 'description'),
              user: user.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GAlbumData_album', 'createdAt'),
              isSensitive: BuiltValueNullFieldError.checkNotNull(
                  isSensitive, r'GAlbumData_album', 'isSensitive'),
              thumbnailImageURL: thumbnailImageURL);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumData_album', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumData_album_user extends GAlbumData_album_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GAlbumData_album_user_iconImage? iconImage;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GAlbumData_album_user(
          [void Function(GAlbumData_album_userBuilder)? updates]) =>
      (new GAlbumData_album_userBuilder()..update(updates))._build();

  _$GAlbumData_album_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumData_album_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GAlbumData_album_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GAlbumData_album_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GAlbumData_album_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GAlbumData_album_user', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GAlbumData_album_user', 'isMuted');
  }

  @override
  GAlbumData_album_user rebuild(
          void Function(GAlbumData_album_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumData_album_userBuilder toBuilder() =>
      new GAlbumData_album_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumData_album_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
        iconImage == other.iconImage &&
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
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumData_album_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GAlbumData_album_userBuilder
    implements Builder<GAlbumData_album_user, GAlbumData_album_userBuilder> {
  _$GAlbumData_album_user? _$v;

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

  GAlbumData_album_user_iconImageBuilder? _iconImage;
  GAlbumData_album_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GAlbumData_album_user_iconImageBuilder();
  set iconImage(GAlbumData_album_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GAlbumData_album_userBuilder() {
    GAlbumData_album_user._initializeBuilder(this);
  }

  GAlbumData_album_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumData_album_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumData_album_user;
  }

  @override
  void update(void Function(GAlbumData_album_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumData_album_user build() => _build();

  _$GAlbumData_album_user _build() {
    _$GAlbumData_album_user _$result;
    try {
      _$result = _$v ??
          new _$GAlbumData_album_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAlbumData_album_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GAlbumData_album_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GAlbumData_album_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GAlbumData_album_user', 'login'),
              iconImage: _iconImage?.build(),
              isFollowee: BuiltValueNullFieldError.checkNotNull(
                  isFollowee, r'GAlbumData_album_user', 'isFollowee'),
              isMuted: BuiltValueNullFieldError.checkNotNull(
                  isMuted, r'GAlbumData_album_user', 'isMuted'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumData_album_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumData_album_user_iconImage
    extends GAlbumData_album_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GAlbumData_album_user_iconImage(
          [void Function(GAlbumData_album_user_iconImageBuilder)? updates]) =>
      (new GAlbumData_album_user_iconImageBuilder()..update(updates))._build();

  _$GAlbumData_album_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumData_album_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAlbumData_album_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GAlbumData_album_user_iconImage', 'downloadURL');
  }

  @override
  GAlbumData_album_user_iconImage rebuild(
          void Function(GAlbumData_album_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumData_album_user_iconImageBuilder toBuilder() =>
      new GAlbumData_album_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumData_album_user_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GAlbumData_album_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GAlbumData_album_user_iconImageBuilder
    implements
        Builder<GAlbumData_album_user_iconImage,
            GAlbumData_album_user_iconImageBuilder> {
  _$GAlbumData_album_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GAlbumData_album_user_iconImageBuilder() {
    GAlbumData_album_user_iconImage._initializeBuilder(this);
  }

  GAlbumData_album_user_iconImageBuilder get _$this {
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
  void replace(GAlbumData_album_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumData_album_user_iconImage;
  }

  @override
  void update(void Function(GAlbumData_album_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumData_album_user_iconImage build() => _build();

  _$GAlbumData_album_user_iconImage _build() {
    final _$result = _$v ??
        new _$GAlbumData_album_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAlbumData_album_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAlbumData_album_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GAlbumData_album_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
