// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_user.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerUserData> _$gViewerUserDataSerializer =
    new _$GViewerUserDataSerializer();
Serializer<GViewerUserData_viewer> _$gViewerUserDataViewerSerializer =
    new _$GViewerUserData_viewerSerializer();
Serializer<GViewerUserData_viewer_user> _$gViewerUserDataViewerUserSerializer =
    new _$GViewerUserData_viewer_userSerializer();
Serializer<GViewerUserData_viewer_user_iconImage>
    _$gViewerUserDataViewerUserIconImageSerializer =
    new _$GViewerUserData_viewer_user_iconImageSerializer();
Serializer<GViewerUserData_viewer_user_headerImage>
    _$gViewerUserDataViewerUserHeaderImageSerializer =
    new _$GViewerUserData_viewer_user_headerImageSerializer();

class _$GViewerUserDataSerializer
    implements StructuredSerializer<GViewerUserData> {
  @override
  final Iterable<Type> types = const [GViewerUserData, _$GViewerUserData];
  @override
  final String wireName = 'GViewerUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GViewerUserData object,
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
            specifiedType: const FullType(GViewerUserData_viewer)));
    }
    return result;
  }

  @override
  GViewerUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerUserDataBuilder();

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
                  specifiedType: const FullType(GViewerUserData_viewer))!
              as GViewerUserData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerUserData_viewerSerializer
    implements StructuredSerializer<GViewerUserData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerUserData_viewer,
    _$GViewerUserData_viewer
  ];
  @override
  final String wireName = 'GViewerUserData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerUserData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GViewerUserData_viewer_user)),
    ];

    return result;
  }

  @override
  GViewerUserData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerUserData_viewerBuilder();

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
                  specifiedType: const FullType(GViewerUserData_viewer_user))!
              as GViewerUserData_viewer_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerUserData_viewer_userSerializer
    implements StructuredSerializer<GViewerUserData_viewer_user> {
  @override
  final Iterable<Type> types = const [
    GViewerUserData_viewer_user,
    _$GViewerUserData_viewer_user
  ];
  @override
  final String wireName = 'GViewerUserData_viewer_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerUserData_viewer_user object,
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
    ];
    Object? value;
    value = object.biography;
    if (value != null) {
      result
        ..add('biography')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fcmToken;
    if (value != null) {
      result
        ..add('fcmToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GViewerUserData_viewer_user_iconImage)));
    }
    value = object.headerImage;
    if (value != null) {
      result
        ..add('headerImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GViewerUserData_viewer_user_headerImage)));
    }
    return result;
  }

  @override
  GViewerUserData_viewer_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerUserData_viewer_userBuilder();

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
        case 'fcmToken':
          result.fcmToken = serializers.deserialize(value,
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
                  specifiedType:
                      const FullType(GViewerUserData_viewer_user_iconImage))!
              as GViewerUserData_viewer_user_iconImage);
          break;
        case 'headerImage':
          result.headerImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GViewerUserData_viewer_user_headerImage))!
              as GViewerUserData_viewer_user_headerImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerUserData_viewer_user_iconImageSerializer
    implements StructuredSerializer<GViewerUserData_viewer_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GViewerUserData_viewer_user_iconImage,
    _$GViewerUserData_viewer_user_iconImage
  ];
  @override
  final String wireName = 'GViewerUserData_viewer_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerUserData_viewer_user_iconImage object,
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
  GViewerUserData_viewer_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerUserData_viewer_user_iconImageBuilder();

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

class _$GViewerUserData_viewer_user_headerImageSerializer
    implements StructuredSerializer<GViewerUserData_viewer_user_headerImage> {
  @override
  final Iterable<Type> types = const [
    GViewerUserData_viewer_user_headerImage,
    _$GViewerUserData_viewer_user_headerImage
  ];
  @override
  final String wireName = 'GViewerUserData_viewer_user_headerImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerUserData_viewer_user_headerImage object,
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
  GViewerUserData_viewer_user_headerImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerUserData_viewer_user_headerImageBuilder();

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

class _$GViewerUserData extends GViewerUserData {
  @override
  final String G__typename;
  @override
  final GViewerUserData_viewer? viewer;

  factory _$GViewerUserData([void Function(GViewerUserDataBuilder)? updates]) =>
      (new GViewerUserDataBuilder()..update(updates))._build();

  _$GViewerUserData._({required this.G__typename, this.viewer}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerUserData', 'G__typename');
  }

  @override
  GViewerUserData rebuild(void Function(GViewerUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerUserDataBuilder toBuilder() =>
      new GViewerUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerUserData &&
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
    return (newBuiltValueToStringHelper(r'GViewerUserData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerUserDataBuilder
    implements Builder<GViewerUserData, GViewerUserDataBuilder> {
  _$GViewerUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerUserData_viewerBuilder? _viewer;
  GViewerUserData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerUserData_viewerBuilder();
  set viewer(GViewerUserData_viewerBuilder? viewer) => _$this._viewer = viewer;

  GViewerUserDataBuilder() {
    GViewerUserData._initializeBuilder(this);
  }

  GViewerUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerUserData;
  }

  @override
  void update(void Function(GViewerUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerUserData build() => _build();

  _$GViewerUserData _build() {
    _$GViewerUserData _$result;
    try {
      _$result = _$v ??
          new _$GViewerUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerUserData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerUserData_viewer extends GViewerUserData_viewer {
  @override
  final String G__typename;
  @override
  final GViewerUserData_viewer_user user;

  factory _$GViewerUserData_viewer(
          [void Function(GViewerUserData_viewerBuilder)? updates]) =>
      (new GViewerUserData_viewerBuilder()..update(updates))._build();

  _$GViewerUserData_viewer._({required this.G__typename, required this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerUserData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GViewerUserData_viewer', 'user');
  }

  @override
  GViewerUserData_viewer rebuild(
          void Function(GViewerUserData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerUserData_viewerBuilder toBuilder() =>
      new GViewerUserData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerUserData_viewer &&
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
    return (newBuiltValueToStringHelper(r'GViewerUserData_viewer')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GViewerUserData_viewerBuilder
    implements Builder<GViewerUserData_viewer, GViewerUserData_viewerBuilder> {
  _$GViewerUserData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerUserData_viewer_userBuilder? _user;
  GViewerUserData_viewer_userBuilder get user =>
      _$this._user ??= new GViewerUserData_viewer_userBuilder();
  set user(GViewerUserData_viewer_userBuilder? user) => _$this._user = user;

  GViewerUserData_viewerBuilder() {
    GViewerUserData_viewer._initializeBuilder(this);
  }

  GViewerUserData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerUserData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerUserData_viewer;
  }

  @override
  void update(void Function(GViewerUserData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerUserData_viewer build() => _build();

  _$GViewerUserData_viewer _build() {
    _$GViewerUserData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerUserData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerUserData_viewer', 'G__typename'),
              user: user.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerUserData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerUserData_viewer_user extends GViewerUserData_viewer_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? biography;
  @override
  final String? fcmToken;
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
  final GViewerUserData_viewer_user_iconImage? iconImage;
  @override
  final GViewerUserData_viewer_user_headerImage? headerImage;

  factory _$GViewerUserData_viewer_user(
          [void Function(GViewerUserData_viewer_userBuilder)? updates]) =>
      (new GViewerUserData_viewer_userBuilder()..update(updates))._build();

  _$GViewerUserData_viewer_user._(
      {required this.G__typename,
      required this.id,
      this.biography,
      this.fcmToken,
      required this.login,
      required this.name,
      required this.receivedLikesCount,
      required this.receivedViewsCount,
      required this.awardsCount,
      required this.followersCount,
      this.iconImage,
      this.headerImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerUserData_viewer_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerUserData_viewer_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GViewerUserData_viewer_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GViewerUserData_viewer_user', 'name');
    BuiltValueNullFieldError.checkNotNull(receivedLikesCount,
        r'GViewerUserData_viewer_user', 'receivedLikesCount');
    BuiltValueNullFieldError.checkNotNull(receivedViewsCount,
        r'GViewerUserData_viewer_user', 'receivedViewsCount');
    BuiltValueNullFieldError.checkNotNull(
        awardsCount, r'GViewerUserData_viewer_user', 'awardsCount');
    BuiltValueNullFieldError.checkNotNull(
        followersCount, r'GViewerUserData_viewer_user', 'followersCount');
  }

  @override
  GViewerUserData_viewer_user rebuild(
          void Function(GViewerUserData_viewer_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerUserData_viewer_userBuilder toBuilder() =>
      new GViewerUserData_viewer_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerUserData_viewer_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        biography == other.biography &&
        fcmToken == other.fcmToken &&
        login == other.login &&
        name == other.name &&
        receivedLikesCount == other.receivedLikesCount &&
        receivedViewsCount == other.receivedViewsCount &&
        awardsCount == other.awardsCount &&
        followersCount == other.followersCount &&
        iconImage == other.iconImage &&
        headerImage == other.headerImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, biography.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, receivedLikesCount.hashCode);
    _$hash = $jc(_$hash, receivedViewsCount.hashCode);
    _$hash = $jc(_$hash, awardsCount.hashCode);
    _$hash = $jc(_$hash, followersCount.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jc(_$hash, headerImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerUserData_viewer_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('biography', biography)
          ..add('fcmToken', fcmToken)
          ..add('login', login)
          ..add('name', name)
          ..add('receivedLikesCount', receivedLikesCount)
          ..add('receivedViewsCount', receivedViewsCount)
          ..add('awardsCount', awardsCount)
          ..add('followersCount', followersCount)
          ..add('iconImage', iconImage)
          ..add('headerImage', headerImage))
        .toString();
  }
}

class GViewerUserData_viewer_userBuilder
    implements
        Builder<GViewerUserData_viewer_user,
            GViewerUserData_viewer_userBuilder> {
  _$GViewerUserData_viewer_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _biography;
  String? get biography => _$this._biography;
  set biography(String? biography) => _$this._biography = biography;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

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

  GViewerUserData_viewer_user_iconImageBuilder? _iconImage;
  GViewerUserData_viewer_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GViewerUserData_viewer_user_iconImageBuilder();
  set iconImage(GViewerUserData_viewer_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GViewerUserData_viewer_user_headerImageBuilder? _headerImage;
  GViewerUserData_viewer_user_headerImageBuilder get headerImage =>
      _$this._headerImage ??=
          new GViewerUserData_viewer_user_headerImageBuilder();
  set headerImage(
          GViewerUserData_viewer_user_headerImageBuilder? headerImage) =>
      _$this._headerImage = headerImage;

  GViewerUserData_viewer_userBuilder() {
    GViewerUserData_viewer_user._initializeBuilder(this);
  }

  GViewerUserData_viewer_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _biography = $v.biography;
      _fcmToken = $v.fcmToken;
      _login = $v.login;
      _name = $v.name;
      _receivedLikesCount = $v.receivedLikesCount;
      _receivedViewsCount = $v.receivedViewsCount;
      _awardsCount = $v.awardsCount;
      _followersCount = $v.followersCount;
      _iconImage = $v.iconImage?.toBuilder();
      _headerImage = $v.headerImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerUserData_viewer_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerUserData_viewer_user;
  }

  @override
  void update(void Function(GViewerUserData_viewer_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerUserData_viewer_user build() => _build();

  _$GViewerUserData_viewer_user _build() {
    _$GViewerUserData_viewer_user _$result;
    try {
      _$result = _$v ??
          new _$GViewerUserData_viewer_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerUserData_viewer_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerUserData_viewer_user', 'id'),
              biography: biography,
              fcmToken: fcmToken,
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GViewerUserData_viewer_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GViewerUserData_viewer_user', 'name'),
              receivedLikesCount: BuiltValueNullFieldError.checkNotNull(
                  receivedLikesCount, r'GViewerUserData_viewer_user', 'receivedLikesCount'),
              receivedViewsCount: BuiltValueNullFieldError.checkNotNull(
                  receivedViewsCount, r'GViewerUserData_viewer_user', 'receivedViewsCount'),
              awardsCount: BuiltValueNullFieldError.checkNotNull(
                  awardsCount, r'GViewerUserData_viewer_user', 'awardsCount'),
              followersCount:
                  BuiltValueNullFieldError.checkNotNull(followersCount, r'GViewerUserData_viewer_user', 'followersCount'),
              iconImage: _iconImage?.build(),
              headerImage: _headerImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
        _$failedField = 'headerImage';
        _headerImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerUserData_viewer_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerUserData_viewer_user_iconImage
    extends GViewerUserData_viewer_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerUserData_viewer_user_iconImage(
          [void Function(GViewerUserData_viewer_user_iconImageBuilder)?
              updates]) =>
      (new GViewerUserData_viewer_user_iconImageBuilder()..update(updates))
          ._build();

  _$GViewerUserData_viewer_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerUserData_viewer_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerUserData_viewer_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GViewerUserData_viewer_user_iconImage', 'downloadURL');
  }

  @override
  GViewerUserData_viewer_user_iconImage rebuild(
          void Function(GViewerUserData_viewer_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerUserData_viewer_user_iconImageBuilder toBuilder() =>
      new GViewerUserData_viewer_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerUserData_viewer_user_iconImage &&
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
            r'GViewerUserData_viewer_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerUserData_viewer_user_iconImageBuilder
    implements
        Builder<GViewerUserData_viewer_user_iconImage,
            GViewerUserData_viewer_user_iconImageBuilder> {
  _$GViewerUserData_viewer_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerUserData_viewer_user_iconImageBuilder() {
    GViewerUserData_viewer_user_iconImage._initializeBuilder(this);
  }

  GViewerUserData_viewer_user_iconImageBuilder get _$this {
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
  void replace(GViewerUserData_viewer_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerUserData_viewer_user_iconImage;
  }

  @override
  void update(
      void Function(GViewerUserData_viewer_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerUserData_viewer_user_iconImage build() => _build();

  _$GViewerUserData_viewer_user_iconImage _build() {
    final _$result = _$v ??
        new _$GViewerUserData_viewer_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GViewerUserData_viewer_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerUserData_viewer_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GViewerUserData_viewer_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GViewerUserData_viewer_user_headerImage
    extends GViewerUserData_viewer_user_headerImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerUserData_viewer_user_headerImage(
          [void Function(GViewerUserData_viewer_user_headerImageBuilder)?
              updates]) =>
      (new GViewerUserData_viewer_user_headerImageBuilder()..update(updates))
          ._build();

  _$GViewerUserData_viewer_user_headerImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerUserData_viewer_user_headerImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerUserData_viewer_user_headerImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GViewerUserData_viewer_user_headerImage', 'downloadURL');
  }

  @override
  GViewerUserData_viewer_user_headerImage rebuild(
          void Function(GViewerUserData_viewer_user_headerImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerUserData_viewer_user_headerImageBuilder toBuilder() =>
      new GViewerUserData_viewer_user_headerImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerUserData_viewer_user_headerImage &&
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
            r'GViewerUserData_viewer_user_headerImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerUserData_viewer_user_headerImageBuilder
    implements
        Builder<GViewerUserData_viewer_user_headerImage,
            GViewerUserData_viewer_user_headerImageBuilder> {
  _$GViewerUserData_viewer_user_headerImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerUserData_viewer_user_headerImageBuilder() {
    GViewerUserData_viewer_user_headerImage._initializeBuilder(this);
  }

  GViewerUserData_viewer_user_headerImageBuilder get _$this {
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
  void replace(GViewerUserData_viewer_user_headerImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerUserData_viewer_user_headerImage;
  }

  @override
  void update(
      void Function(GViewerUserData_viewer_user_headerImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerUserData_viewer_user_headerImage build() => _build();

  _$GViewerUserData_viewer_user_headerImage _build() {
    final _$result = _$v ??
        new _$GViewerUserData_viewer_user_headerImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GViewerUserData_viewer_user_headerImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerUserData_viewer_user_headerImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GViewerUserData_viewer_user_headerImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
