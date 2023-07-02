// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_followees.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserFolloweesData> _$gUserFolloweesDataSerializer =
    new _$GUserFolloweesDataSerializer();
Serializer<GUserFolloweesData_user> _$gUserFolloweesDataUserSerializer =
    new _$GUserFolloweesData_userSerializer();
Serializer<GUserFolloweesData_user_followees>
    _$gUserFolloweesDataUserFolloweesSerializer =
    new _$GUserFolloweesData_user_followeesSerializer();
Serializer<GUserFolloweesData_user_followees_iconImage>
    _$gUserFolloweesDataUserFolloweesIconImageSerializer =
    new _$GUserFolloweesData_user_followees_iconImageSerializer();

class _$GUserFolloweesDataSerializer
    implements StructuredSerializer<GUserFolloweesData> {
  @override
  final Iterable<Type> types = const [GUserFolloweesData, _$GUserFolloweesData];
  @override
  final String wireName = 'GUserFolloweesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFolloweesData object,
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
            specifiedType: const FullType(GUserFolloweesData_user)));
    }
    return result;
  }

  @override
  GUserFolloweesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolloweesDataBuilder();

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
                  specifiedType: const FullType(GUserFolloweesData_user))!
              as GUserFolloweesData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFolloweesData_userSerializer
    implements StructuredSerializer<GUserFolloweesData_user> {
  @override
  final Iterable<Type> types = const [
    GUserFolloweesData_user,
    _$GUserFolloweesData_user
  ];
  @override
  final String wireName = 'GUserFolloweesData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFolloweesData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'followees',
      serializers.serialize(object.followees,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GUserFolloweesData_user_followees)])),
    ];

    return result;
  }

  @override
  GUserFolloweesData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolloweesData_userBuilder();

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
        case 'followees':
          result.followees.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserFolloweesData_user_followees)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFolloweesData_user_followeesSerializer
    implements StructuredSerializer<GUserFolloweesData_user_followees> {
  @override
  final Iterable<Type> types = const [
    GUserFolloweesData_user_followees,
    _$GUserFolloweesData_user_followees
  ];
  @override
  final String wireName = 'GUserFolloweesData_user_followees';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFolloweesData_user_followees object,
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
                const FullType(GUserFolloweesData_user_followees_iconImage)));
    }
    return result;
  }

  @override
  GUserFolloweesData_user_followees deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolloweesData_user_followeesBuilder();

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
                      GUserFolloweesData_user_followees_iconImage))!
              as GUserFolloweesData_user_followees_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFolloweesData_user_followees_iconImageSerializer
    implements
        StructuredSerializer<GUserFolloweesData_user_followees_iconImage> {
  @override
  final Iterable<Type> types = const [
    GUserFolloweesData_user_followees_iconImage,
    _$GUserFolloweesData_user_followees_iconImage
  ];
  @override
  final String wireName = 'GUserFolloweesData_user_followees_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserFolloweesData_user_followees_iconImage object,
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
  GUserFolloweesData_user_followees_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFolloweesData_user_followees_iconImageBuilder();

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

class _$GUserFolloweesData extends GUserFolloweesData {
  @override
  final String G__typename;
  @override
  final GUserFolloweesData_user? user;

  factory _$GUserFolloweesData(
          [void Function(GUserFolloweesDataBuilder)? updates]) =>
      (new GUserFolloweesDataBuilder()..update(updates))._build();

  _$GUserFolloweesData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFolloweesData', 'G__typename');
  }

  @override
  GUserFolloweesData rebuild(
          void Function(GUserFolloweesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolloweesDataBuilder toBuilder() =>
      new GUserFolloweesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolloweesData &&
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
    return (newBuiltValueToStringHelper(r'GUserFolloweesData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserFolloweesDataBuilder
    implements Builder<GUserFolloweesData, GUserFolloweesDataBuilder> {
  _$GUserFolloweesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserFolloweesData_userBuilder? _user;
  GUserFolloweesData_userBuilder get user =>
      _$this._user ??= new GUserFolloweesData_userBuilder();
  set user(GUserFolloweesData_userBuilder? user) => _$this._user = user;

  GUserFolloweesDataBuilder() {
    GUserFolloweesData._initializeBuilder(this);
  }

  GUserFolloweesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFolloweesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolloweesData;
  }

  @override
  void update(void Function(GUserFolloweesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolloweesData build() => _build();

  _$GUserFolloweesData _build() {
    _$GUserFolloweesData _$result;
    try {
      _$result = _$v ??
          new _$GUserFolloweesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFolloweesData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFolloweesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFolloweesData_user extends GUserFolloweesData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GUserFolloweesData_user_followees> followees;

  factory _$GUserFolloweesData_user(
          [void Function(GUserFolloweesData_userBuilder)? updates]) =>
      (new GUserFolloweesData_userBuilder()..update(updates))._build();

  _$GUserFolloweesData_user._(
      {required this.G__typename, required this.id, required this.followees})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFolloweesData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserFolloweesData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        followees, r'GUserFolloweesData_user', 'followees');
  }

  @override
  GUserFolloweesData_user rebuild(
          void Function(GUserFolloweesData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolloweesData_userBuilder toBuilder() =>
      new GUserFolloweesData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolloweesData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        followees == other.followees;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, followees.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFolloweesData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('followees', followees))
        .toString();
  }
}

class GUserFolloweesData_userBuilder
    implements
        Builder<GUserFolloweesData_user, GUserFolloweesData_userBuilder> {
  _$GUserFolloweesData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GUserFolloweesData_user_followees>? _followees;
  ListBuilder<GUserFolloweesData_user_followees> get followees =>
      _$this._followees ??=
          new ListBuilder<GUserFolloweesData_user_followees>();
  set followees(ListBuilder<GUserFolloweesData_user_followees>? followees) =>
      _$this._followees = followees;

  GUserFolloweesData_userBuilder() {
    GUserFolloweesData_user._initializeBuilder(this);
  }

  GUserFolloweesData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _followees = $v.followees.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFolloweesData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolloweesData_user;
  }

  @override
  void update(void Function(GUserFolloweesData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolloweesData_user build() => _build();

  _$GUserFolloweesData_user _build() {
    _$GUserFolloweesData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserFolloweesData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFolloweesData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFolloweesData_user', 'id'),
              followees: followees.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'followees';
        followees.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFolloweesData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFolloweesData_user_followees
    extends GUserFolloweesData_user_followees {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GUserFolloweesData_user_followees_iconImage? iconImage;

  factory _$GUserFolloweesData_user_followees(
          [void Function(GUserFolloweesData_user_followeesBuilder)? updates]) =>
      (new GUserFolloweesData_user_followeesBuilder()..update(updates))
          ._build();

  _$GUserFolloweesData_user_followees._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFolloweesData_user_followees', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFolloweesData_user_followees', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GUserFolloweesData_user_followees', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GUserFolloweesData_user_followees', 'name');
  }

  @override
  GUserFolloweesData_user_followees rebuild(
          void Function(GUserFolloweesData_user_followeesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolloweesData_user_followeesBuilder toBuilder() =>
      new GUserFolloweesData_user_followeesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolloweesData_user_followees &&
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
    return (newBuiltValueToStringHelper(r'GUserFolloweesData_user_followees')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GUserFolloweesData_user_followeesBuilder
    implements
        Builder<GUserFolloweesData_user_followees,
            GUserFolloweesData_user_followeesBuilder> {
  _$GUserFolloweesData_user_followees? _$v;

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

  GUserFolloweesData_user_followees_iconImageBuilder? _iconImage;
  GUserFolloweesData_user_followees_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GUserFolloweesData_user_followees_iconImageBuilder();
  set iconImage(
          GUserFolloweesData_user_followees_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GUserFolloweesData_user_followeesBuilder() {
    GUserFolloweesData_user_followees._initializeBuilder(this);
  }

  GUserFolloweesData_user_followeesBuilder get _$this {
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
  void replace(GUserFolloweesData_user_followees other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolloweesData_user_followees;
  }

  @override
  void update(
      void Function(GUserFolloweesData_user_followeesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolloweesData_user_followees build() => _build();

  _$GUserFolloweesData_user_followees _build() {
    _$GUserFolloweesData_user_followees _$result;
    try {
      _$result = _$v ??
          new _$GUserFolloweesData_user_followees._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GUserFolloweesData_user_followees', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFolloweesData_user_followees', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GUserFolloweesData_user_followees', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GUserFolloweesData_user_followees', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFolloweesData_user_followees', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFolloweesData_user_followees_iconImage
    extends GUserFolloweesData_user_followees_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserFolloweesData_user_followees_iconImage(
          [void Function(GUserFolloweesData_user_followees_iconImageBuilder)?
              updates]) =>
      (new GUserFolloweesData_user_followees_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GUserFolloweesData_user_followees_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUserFolloweesData_user_followees_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFolloweesData_user_followees_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GUserFolloweesData_user_followees_iconImage', 'downloadURL');
  }

  @override
  GUserFolloweesData_user_followees_iconImage rebuild(
          void Function(GUserFolloweesData_user_followees_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFolloweesData_user_followees_iconImageBuilder toBuilder() =>
      new GUserFolloweesData_user_followees_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFolloweesData_user_followees_iconImage &&
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
            r'GUserFolloweesData_user_followees_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserFolloweesData_user_followees_iconImageBuilder
    implements
        Builder<GUserFolloweesData_user_followees_iconImage,
            GUserFolloweesData_user_followees_iconImageBuilder> {
  _$GUserFolloweesData_user_followees_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserFolloweesData_user_followees_iconImageBuilder() {
    GUserFolloweesData_user_followees_iconImage._initializeBuilder(this);
  }

  GUserFolloweesData_user_followees_iconImageBuilder get _$this {
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
  void replace(GUserFolloweesData_user_followees_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFolloweesData_user_followees_iconImage;
  }

  @override
  void update(
      void Function(GUserFolloweesData_user_followees_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFolloweesData_user_followees_iconImage build() => _build();

  _$GUserFolloweesData_user_followees_iconImage _build() {
    final _$result = _$v ??
        new _$GUserFolloweesData_user_followees_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserFolloweesData_user_followees_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserFolloweesData_user_followees_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GUserFolloweesData_user_followees_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
