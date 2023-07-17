// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contributors.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GContributorsData> _$gContributorsDataSerializer =
    new _$GContributorsDataSerializer();
Serializer<GContributorsData_contributors>
    _$gContributorsDataContributorsSerializer =
    new _$GContributorsData_contributorsSerializer();
Serializer<GContributorsData_contributors_user>
    _$gContributorsDataContributorsUserSerializer =
    new _$GContributorsData_contributors_userSerializer();
Serializer<GContributorsData_contributors_user_iconImage>
    _$gContributorsDataContributorsUserIconImageSerializer =
    new _$GContributorsData_contributors_user_iconImageSerializer();

class _$GContributorsDataSerializer
    implements StructuredSerializer<GContributorsData> {
  @override
  final Iterable<Type> types = const [GContributorsData, _$GContributorsData];
  @override
  final String wireName = 'GContributorsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GContributorsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'contributors',
      serializers.serialize(object.contributors,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GContributorsData_contributors)])),
    ];

    return result;
  }

  @override
  GContributorsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GContributorsDataBuilder();

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
        case 'contributors':
          result.contributors.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GContributorsData_contributors)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GContributorsData_contributorsSerializer
    implements StructuredSerializer<GContributorsData_contributors> {
  @override
  final Iterable<Type> types = const [
    GContributorsData_contributors,
    _$GContributorsData_contributors
  ];
  @override
  final String wireName = 'GContributorsData_contributors';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GContributorsData_contributors object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'types',
      serializers.serialize(object.types,
          specifiedType: const FullType(
              BuiltList, const [const FullType(_i2.GContributorType)])),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GContributorsData_contributors_user)),
    ];

    return result;
  }

  @override
  GContributorsData_contributors deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GContributorsData_contributorsBuilder();

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
        case 'types':
          result.types.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(_i2.GContributorType)]))!
              as BuiltList<Object?>);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GContributorsData_contributors_user))!
              as GContributorsData_contributors_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GContributorsData_contributors_userSerializer
    implements StructuredSerializer<GContributorsData_contributors_user> {
  @override
  final Iterable<Type> types = const [
    GContributorsData_contributors_user,
    _$GContributorsData_contributors_user
  ];
  @override
  final String wireName = 'GContributorsData_contributors_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GContributorsData_contributors_user object,
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
                const FullType(GContributorsData_contributors_user_iconImage)));
    }
    return result;
  }

  @override
  GContributorsData_contributors_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GContributorsData_contributors_userBuilder();

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
                      GContributorsData_contributors_user_iconImage))!
              as GContributorsData_contributors_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GContributorsData_contributors_user_iconImageSerializer
    implements
        StructuredSerializer<GContributorsData_contributors_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GContributorsData_contributors_user_iconImage,
    _$GContributorsData_contributors_user_iconImage
  ];
  @override
  final String wireName = 'GContributorsData_contributors_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GContributorsData_contributors_user_iconImage object,
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
  GContributorsData_contributors_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GContributorsData_contributors_user_iconImageBuilder();

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

class _$GContributorsData extends GContributorsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GContributorsData_contributors> contributors;

  factory _$GContributorsData(
          [void Function(GContributorsDataBuilder)? updates]) =>
      (new GContributorsDataBuilder()..update(updates))._build();

  _$GContributorsData._({required this.G__typename, required this.contributors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GContributorsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        contributors, r'GContributorsData', 'contributors');
  }

  @override
  GContributorsData rebuild(void Function(GContributorsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GContributorsDataBuilder toBuilder() =>
      new GContributorsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GContributorsData &&
        G__typename == other.G__typename &&
        contributors == other.contributors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, contributors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GContributorsData')
          ..add('G__typename', G__typename)
          ..add('contributors', contributors))
        .toString();
  }
}

class GContributorsDataBuilder
    implements Builder<GContributorsData, GContributorsDataBuilder> {
  _$GContributorsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GContributorsData_contributors>? _contributors;
  ListBuilder<GContributorsData_contributors> get contributors =>
      _$this._contributors ??=
          new ListBuilder<GContributorsData_contributors>();
  set contributors(ListBuilder<GContributorsData_contributors>? contributors) =>
      _$this._contributors = contributors;

  GContributorsDataBuilder() {
    GContributorsData._initializeBuilder(this);
  }

  GContributorsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _contributors = $v.contributors.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GContributorsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GContributorsData;
  }

  @override
  void update(void Function(GContributorsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GContributorsData build() => _build();

  _$GContributorsData _build() {
    _$GContributorsData _$result;
    try {
      _$result = _$v ??
          new _$GContributorsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GContributorsData', 'G__typename'),
              contributors: contributors.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'contributors';
        contributors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GContributorsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GContributorsData_contributors extends GContributorsData_contributors {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<_i2.GContributorType> types;
  @override
  final GContributorsData_contributors_user user;

  factory _$GContributorsData_contributors(
          [void Function(GContributorsData_contributorsBuilder)? updates]) =>
      (new GContributorsData_contributorsBuilder()..update(updates))._build();

  _$GContributorsData_contributors._(
      {required this.G__typename,
      required this.id,
      required this.types,
      required this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GContributorsData_contributors', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GContributorsData_contributors', 'id');
    BuiltValueNullFieldError.checkNotNull(
        types, r'GContributorsData_contributors', 'types');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GContributorsData_contributors', 'user');
  }

  @override
  GContributorsData_contributors rebuild(
          void Function(GContributorsData_contributorsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GContributorsData_contributorsBuilder toBuilder() =>
      new GContributorsData_contributorsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GContributorsData_contributors &&
        G__typename == other.G__typename &&
        id == other.id &&
        types == other.types &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, types.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GContributorsData_contributors')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('types', types)
          ..add('user', user))
        .toString();
  }
}

class GContributorsData_contributorsBuilder
    implements
        Builder<GContributorsData_contributors,
            GContributorsData_contributorsBuilder> {
  _$GContributorsData_contributors? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<_i2.GContributorType>? _types;
  ListBuilder<_i2.GContributorType> get types =>
      _$this._types ??= new ListBuilder<_i2.GContributorType>();
  set types(ListBuilder<_i2.GContributorType>? types) => _$this._types = types;

  GContributorsData_contributors_userBuilder? _user;
  GContributorsData_contributors_userBuilder get user =>
      _$this._user ??= new GContributorsData_contributors_userBuilder();
  set user(GContributorsData_contributors_userBuilder? user) =>
      _$this._user = user;

  GContributorsData_contributorsBuilder() {
    GContributorsData_contributors._initializeBuilder(this);
  }

  GContributorsData_contributorsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _types = $v.types.toBuilder();
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GContributorsData_contributors other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GContributorsData_contributors;
  }

  @override
  void update(void Function(GContributorsData_contributorsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GContributorsData_contributors build() => _build();

  _$GContributorsData_contributors _build() {
    _$GContributorsData_contributors _$result;
    try {
      _$result = _$v ??
          new _$GContributorsData_contributors._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GContributorsData_contributors', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GContributorsData_contributors', 'id'),
              types: types.build(),
              user: user.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'types';
        types.build();
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GContributorsData_contributors', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GContributorsData_contributors_user
    extends GContributorsData_contributors_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GContributorsData_contributors_user_iconImage? iconImage;

  factory _$GContributorsData_contributors_user(
          [void Function(GContributorsData_contributors_userBuilder)?
              updates]) =>
      (new GContributorsData_contributors_userBuilder()..update(updates))
          ._build();

  _$GContributorsData_contributors_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GContributorsData_contributors_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GContributorsData_contributors_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GContributorsData_contributors_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GContributorsData_contributors_user', 'name');
  }

  @override
  GContributorsData_contributors_user rebuild(
          void Function(GContributorsData_contributors_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GContributorsData_contributors_userBuilder toBuilder() =>
      new GContributorsData_contributors_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GContributorsData_contributors_user &&
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
    return (newBuiltValueToStringHelper(r'GContributorsData_contributors_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GContributorsData_contributors_userBuilder
    implements
        Builder<GContributorsData_contributors_user,
            GContributorsData_contributors_userBuilder> {
  _$GContributorsData_contributors_user? _$v;

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

  GContributorsData_contributors_user_iconImageBuilder? _iconImage;
  GContributorsData_contributors_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GContributorsData_contributors_user_iconImageBuilder();
  set iconImage(
          GContributorsData_contributors_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GContributorsData_contributors_userBuilder() {
    GContributorsData_contributors_user._initializeBuilder(this);
  }

  GContributorsData_contributors_userBuilder get _$this {
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
  void replace(GContributorsData_contributors_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GContributorsData_contributors_user;
  }

  @override
  void update(
      void Function(GContributorsData_contributors_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GContributorsData_contributors_user build() => _build();

  _$GContributorsData_contributors_user _build() {
    _$GContributorsData_contributors_user _$result;
    try {
      _$result = _$v ??
          new _$GContributorsData_contributors_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GContributorsData_contributors_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GContributorsData_contributors_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GContributorsData_contributors_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GContributorsData_contributors_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GContributorsData_contributors_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GContributorsData_contributors_user_iconImage
    extends GContributorsData_contributors_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GContributorsData_contributors_user_iconImage(
          [void Function(GContributorsData_contributors_user_iconImageBuilder)?
              updates]) =>
      (new GContributorsData_contributors_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GContributorsData_contributors_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GContributorsData_contributors_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GContributorsData_contributors_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GContributorsData_contributors_user_iconImage', 'downloadURL');
  }

  @override
  GContributorsData_contributors_user_iconImage rebuild(
          void Function(GContributorsData_contributors_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GContributorsData_contributors_user_iconImageBuilder toBuilder() =>
      new GContributorsData_contributors_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GContributorsData_contributors_user_iconImage &&
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
            r'GContributorsData_contributors_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GContributorsData_contributors_user_iconImageBuilder
    implements
        Builder<GContributorsData_contributors_user_iconImage,
            GContributorsData_contributors_user_iconImageBuilder> {
  _$GContributorsData_contributors_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GContributorsData_contributors_user_iconImageBuilder() {
    GContributorsData_contributors_user_iconImage._initializeBuilder(this);
  }

  GContributorsData_contributors_user_iconImageBuilder get _$this {
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
  void replace(GContributorsData_contributors_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GContributorsData_contributors_user_iconImage;
  }

  @override
  void update(
      void Function(GContributorsData_contributors_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GContributorsData_contributors_user_iconImage build() => _build();

  _$GContributorsData_contributors_user_iconImage _build() {
    final _$result = _$v ??
        new _$GContributorsData_contributors_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GContributorsData_contributors_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GContributorsData_contributors_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GContributorsData_contributors_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
