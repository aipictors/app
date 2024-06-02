// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserData> _$gUserDataSerializer = new _$GUserDataSerializer();
Serializer<GUserData_user> _$gUserDataUserSerializer =
    new _$GUserData_userSerializer();
Serializer<GUserData_user_iconImage> _$gUserDataUserIconImageSerializer =
    new _$GUserData_user_iconImageSerializer();
Serializer<GUserData_user_headerImage> _$gUserDataUserHeaderImageSerializer =
    new _$GUserData_user_headerImageSerializer();

class _$GUserDataSerializer implements StructuredSerializer<GUserData> {
  @override
  final Iterable<Type> types = const [GUserData, _$GUserData];
  @override
  final String wireName = 'GUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserData object,
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
            specifiedType: const FullType(GUserData_user)));
    }
    return result;
  }

  @override
  GUserData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserDataBuilder();

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
                  specifiedType: const FullType(GUserData_user))!
              as GUserData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserData_userSerializer
    implements StructuredSerializer<GUserData_user> {
  @override
  final Iterable<Type> types = const [GUserData_user, _$GUserData_user];
  @override
  final String wireName = 'GUserData_user';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserData_user object,
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
      'receivedLikesCount',
      serializers.serialize(object.receivedLikesCount,
          specifiedType: const FullType(int)),
      'receivedViewsCount',
      serializers.serialize(object.receivedViewsCount,
          specifiedType: const FullType(int)),
      'awardsCount',
      serializers.serialize(object.awardsCount,
          specifiedType: const FullType(int)),
      'followersCount',
      serializers.serialize(object.followersCount,
          specifiedType: const FullType(int)),
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
    value = object.biography;
    if (value != null) {
      result
        ..add('biography')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserData_user_iconImage)));
    }
    value = object.headerImage;
    if (value != null) {
      result
        ..add('headerImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserData_user_headerImage)));
    }
    return result;
  }

  @override
  GUserData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserData_userBuilder();

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
        case 'biography':
          result.biography = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'receivedLikesCount':
          result.receivedLikesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'receivedViewsCount':
          result.receivedViewsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'awardsCount':
          result.awardsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'followersCount':
          result.followersCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserData_user_iconImage))!
              as GUserData_user_iconImage);
          break;
        case 'headerImage':
          result.headerImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserData_user_headerImage))!
              as GUserData_user_headerImage);
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

class _$GUserData_user_iconImageSerializer
    implements StructuredSerializer<GUserData_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GUserData_user_iconImage,
    _$GUserData_user_iconImage
  ];
  @override
  final String wireName = 'GUserData_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserData_user_iconImage object,
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
  GUserData_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserData_user_iconImageBuilder();

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

class _$GUserData_user_headerImageSerializer
    implements StructuredSerializer<GUserData_user_headerImage> {
  @override
  final Iterable<Type> types = const [
    GUserData_user_headerImage,
    _$GUserData_user_headerImage
  ];
  @override
  final String wireName = 'GUserData_user_headerImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserData_user_headerImage object,
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
  GUserData_user_headerImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserData_user_headerImageBuilder();

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

class _$GUserData extends GUserData {
  @override
  final String G__typename;
  @override
  final GUserData_user? user;

  factory _$GUserData([void Function(GUserDataBuilder)? updates]) =>
      (new GUserDataBuilder()..update(updates))._build();

  _$GUserData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserData', 'G__typename');
  }

  @override
  GUserData rebuild(void Function(GUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserDataBuilder toBuilder() => new GUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserData &&
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
    return (newBuiltValueToStringHelper(r'GUserData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserDataBuilder implements Builder<GUserData, GUserDataBuilder> {
  _$GUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserData_userBuilder? _user;
  GUserData_userBuilder get user =>
      _$this._user ??= new GUserData_userBuilder();
  set user(GUserData_userBuilder? user) => _$this._user = user;

  GUserDataBuilder() {
    GUserData._initializeBuilder(this);
  }

  GUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserData;
  }

  @override
  void update(void Function(GUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserData build() => _build();

  _$GUserData _build() {
    _$GUserData _$result;
    try {
      _$result = _$v ??
          new _$GUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserData_user extends GUserData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? biography;
  @override
  final String login;
  @override
  final String name;
  @override
  final int receivedLikesCount;
  @override
  final int receivedViewsCount;
  @override
  final int awardsCount;
  @override
  final int followersCount;
  @override
  final GUserData_user_iconImage? iconImage;
  @override
  final GUserData_user_headerImage? headerImage;
  @override
  final bool isFollower;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GUserData_user([void Function(GUserData_userBuilder)? updates]) =>
      (new GUserData_userBuilder()..update(updates))._build();

  _$GUserData_user._(
      {required this.G__typename,
      required this.id,
      this.biography,
      required this.login,
      required this.name,
      required this.receivedLikesCount,
      required this.receivedViewsCount,
      required this.awardsCount,
      required this.followersCount,
      this.iconImage,
      this.headerImage,
      required this.isFollower,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(login, r'GUserData_user', 'login');
    BuiltValueNullFieldError.checkNotNull(name, r'GUserData_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        receivedLikesCount, r'GUserData_user', 'receivedLikesCount');
    BuiltValueNullFieldError.checkNotNull(
        receivedViewsCount, r'GUserData_user', 'receivedViewsCount');
    BuiltValueNullFieldError.checkNotNull(
        awardsCount, r'GUserData_user', 'awardsCount');
    BuiltValueNullFieldError.checkNotNull(
        followersCount, r'GUserData_user', 'followersCount');
    BuiltValueNullFieldError.checkNotNull(
        isFollower, r'GUserData_user', 'isFollower');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GUserData_user', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GUserData_user', 'isMuted');
  }

  @override
  GUserData_user rebuild(void Function(GUserData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserData_userBuilder toBuilder() =>
      new GUserData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        biography == other.biography &&
        login == other.login &&
        name == other.name &&
        receivedLikesCount == other.receivedLikesCount &&
        receivedViewsCount == other.receivedViewsCount &&
        awardsCount == other.awardsCount &&
        followersCount == other.followersCount &&
        iconImage == other.iconImage &&
        headerImage == other.headerImage &&
        isFollower == other.isFollower &&
        isFollowee == other.isFollowee &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, biography.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, receivedLikesCount.hashCode);
    _$hash = $jc(_$hash, receivedViewsCount.hashCode);
    _$hash = $jc(_$hash, awardsCount.hashCode);
    _$hash = $jc(_$hash, followersCount.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jc(_$hash, headerImage.hashCode);
    _$hash = $jc(_$hash, isFollower.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('biography', biography)
          ..add('login', login)
          ..add('name', name)
          ..add('receivedLikesCount', receivedLikesCount)
          ..add('receivedViewsCount', receivedViewsCount)
          ..add('awardsCount', awardsCount)
          ..add('followersCount', followersCount)
          ..add('iconImage', iconImage)
          ..add('headerImage', headerImage)
          ..add('isFollower', isFollower)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GUserData_userBuilder
    implements Builder<GUserData_user, GUserData_userBuilder> {
  _$GUserData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _biography;
  String? get biography => _$this._biography;
  set biography(String? biography) => _$this._biography = biography;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _receivedLikesCount;
  int? get receivedLikesCount => _$this._receivedLikesCount;
  set receivedLikesCount(int? receivedLikesCount) =>
      _$this._receivedLikesCount = receivedLikesCount;

  int? _receivedViewsCount;
  int? get receivedViewsCount => _$this._receivedViewsCount;
  set receivedViewsCount(int? receivedViewsCount) =>
      _$this._receivedViewsCount = receivedViewsCount;

  int? _awardsCount;
  int? get awardsCount => _$this._awardsCount;
  set awardsCount(int? awardsCount) => _$this._awardsCount = awardsCount;

  int? _followersCount;
  int? get followersCount => _$this._followersCount;
  set followersCount(int? followersCount) =>
      _$this._followersCount = followersCount;

  GUserData_user_iconImageBuilder? _iconImage;
  GUserData_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GUserData_user_iconImageBuilder();
  set iconImage(GUserData_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GUserData_user_headerImageBuilder? _headerImage;
  GUserData_user_headerImageBuilder get headerImage =>
      _$this._headerImage ??= new GUserData_user_headerImageBuilder();
  set headerImage(GUserData_user_headerImageBuilder? headerImage) =>
      _$this._headerImage = headerImage;

  bool? _isFollower;
  bool? get isFollower => _$this._isFollower;
  set isFollower(bool? isFollower) => _$this._isFollower = isFollower;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GUserData_userBuilder() {
    GUserData_user._initializeBuilder(this);
  }

  GUserData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _biography = $v.biography;
      _login = $v.login;
      _name = $v.name;
      _receivedLikesCount = $v.receivedLikesCount;
      _receivedViewsCount = $v.receivedViewsCount;
      _awardsCount = $v.awardsCount;
      _followersCount = $v.followersCount;
      _iconImage = $v.iconImage?.toBuilder();
      _headerImage = $v.headerImage?.toBuilder();
      _isFollower = $v.isFollower;
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserData_user;
  }

  @override
  void update(void Function(GUserData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserData_user build() => _build();

  _$GUserData_user _build() {
    _$GUserData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserData_user', 'id'),
              biography: biography,
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GUserData_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GUserData_user', 'name'),
              receivedLikesCount: BuiltValueNullFieldError.checkNotNull(
                  receivedLikesCount, r'GUserData_user', 'receivedLikesCount'),
              receivedViewsCount: BuiltValueNullFieldError.checkNotNull(
                  receivedViewsCount, r'GUserData_user', 'receivedViewsCount'),
              awardsCount: BuiltValueNullFieldError.checkNotNull(
                  awardsCount, r'GUserData_user', 'awardsCount'),
              followersCount: BuiltValueNullFieldError.checkNotNull(
                  followersCount, r'GUserData_user', 'followersCount'),
              iconImage: _iconImage?.build(),
              headerImage: _headerImage?.build(),
              isFollower:
                  BuiltValueNullFieldError.checkNotNull(isFollower, r'GUserData_user', 'isFollower'),
              isFollowee: BuiltValueNullFieldError.checkNotNull(isFollowee, r'GUserData_user', 'isFollowee'),
              isMuted: BuiltValueNullFieldError.checkNotNull(isMuted, r'GUserData_user', 'isMuted'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
        _$failedField = 'headerImage';
        _headerImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserData_user_iconImage extends GUserData_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserData_user_iconImage(
          [void Function(GUserData_user_iconImageBuilder)? updates]) =>
      (new GUserData_user_iconImageBuilder()..update(updates))._build();

  _$GUserData_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserData_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserData_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GUserData_user_iconImage', 'downloadURL');
  }

  @override
  GUserData_user_iconImage rebuild(
          void Function(GUserData_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserData_user_iconImageBuilder toBuilder() =>
      new GUserData_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserData_user_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GUserData_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserData_user_iconImageBuilder
    implements
        Builder<GUserData_user_iconImage, GUserData_user_iconImageBuilder> {
  _$GUserData_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserData_user_iconImageBuilder() {
    GUserData_user_iconImage._initializeBuilder(this);
  }

  GUserData_user_iconImageBuilder get _$this {
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
  void replace(GUserData_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserData_user_iconImage;
  }

  @override
  void update(void Function(GUserData_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserData_user_iconImage build() => _build();

  _$GUserData_user_iconImage _build() {
    final _$result = _$v ??
        new _$GUserData_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUserData_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserData_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GUserData_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GUserData_user_headerImage extends GUserData_user_headerImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserData_user_headerImage(
          [void Function(GUserData_user_headerImageBuilder)? updates]) =>
      (new GUserData_user_headerImageBuilder()..update(updates))._build();

  _$GUserData_user_headerImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserData_user_headerImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserData_user_headerImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GUserData_user_headerImage', 'downloadURL');
  }

  @override
  GUserData_user_headerImage rebuild(
          void Function(GUserData_user_headerImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserData_user_headerImageBuilder toBuilder() =>
      new GUserData_user_headerImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserData_user_headerImage &&
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
    return (newBuiltValueToStringHelper(r'GUserData_user_headerImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserData_user_headerImageBuilder
    implements
        Builder<GUserData_user_headerImage, GUserData_user_headerImageBuilder> {
  _$GUserData_user_headerImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserData_user_headerImageBuilder() {
    GUserData_user_headerImage._initializeBuilder(this);
  }

  GUserData_user_headerImageBuilder get _$this {
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
  void replace(GUserData_user_headerImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserData_user_headerImage;
  }

  @override
  void update(void Function(GUserData_user_headerImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserData_user_headerImage build() => _build();

  _$GUserData_user_headerImage _build() {
    final _$result = _$v ??
        new _$GUserData_user_headerImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUserData_user_headerImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserData_user_headerImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GUserData_user_headerImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
