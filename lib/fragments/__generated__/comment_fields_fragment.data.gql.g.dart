// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCommentFieldsData> _$gCommentFieldsDataSerializer =
    new _$GCommentFieldsDataSerializer();
Serializer<GCommentFieldsData_user> _$gCommentFieldsDataUserSerializer =
    new _$GCommentFieldsData_userSerializer();
Serializer<GCommentFieldsData_user_iconImage>
    _$gCommentFieldsDataUserIconImageSerializer =
    new _$GCommentFieldsData_user_iconImageSerializer();
Serializer<GCommentFieldsData_sticker> _$gCommentFieldsDataStickerSerializer =
    new _$GCommentFieldsData_stickerSerializer();

class _$GCommentFieldsDataSerializer
    implements StructuredSerializer<GCommentFieldsData> {
  @override
  final Iterable<Type> types = const [GCommentFieldsData, _$GCommentFieldsData];
  @override
  final String wireName = 'GCommentFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCommentFieldsData object,
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
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GCommentFieldsData_user)));
    }
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GCommentFieldsData_sticker)));
    }
    return result;
  }

  @override
  GCommentFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCommentFieldsDataBuilder();

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
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GCommentFieldsData_user))!
              as GCommentFieldsData_user);
          break;
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GCommentFieldsData_sticker))!
              as GCommentFieldsData_sticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GCommentFieldsData_userSerializer
    implements StructuredSerializer<GCommentFieldsData_user> {
  @override
  final Iterable<Type> types = const [
    GCommentFieldsData_user,
    _$GCommentFieldsData_user
  ];
  @override
  final String wireName = 'GCommentFieldsData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCommentFieldsData_user object,
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
            specifiedType: const FullType(GCommentFieldsData_user_iconImage)));
    }
    return result;
  }

  @override
  GCommentFieldsData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCommentFieldsData_userBuilder();

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
                      const FullType(GCommentFieldsData_user_iconImage))!
              as GCommentFieldsData_user_iconImage);
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

class _$GCommentFieldsData_user_iconImageSerializer
    implements StructuredSerializer<GCommentFieldsData_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GCommentFieldsData_user_iconImage,
    _$GCommentFieldsData_user_iconImage
  ];
  @override
  final String wireName = 'GCommentFieldsData_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCommentFieldsData_user_iconImage object,
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
  GCommentFieldsData_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCommentFieldsData_user_iconImageBuilder();

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

class _$GCommentFieldsData_stickerSerializer
    implements StructuredSerializer<GCommentFieldsData_sticker> {
  @override
  final Iterable<Type> types = const [
    GCommentFieldsData_sticker,
    _$GCommentFieldsData_sticker
  ];
  @override
  final String wireName = 'GCommentFieldsData_sticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCommentFieldsData_sticker object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'accessType',
      serializers.serialize(object.accessType,
          specifiedType: const FullType(_i2.GAccessType)),
    ];
    Object? value;
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCommentFieldsData_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCommentFieldsData_stickerBuilder();

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
        case 'accessType':
          result.accessType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GAccessType))!
              as _i2.GAccessType;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCommentFieldsData extends GCommentFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String text;
  @override
  final GCommentFieldsData_user? user;
  @override
  final GCommentFieldsData_sticker? sticker;

  factory _$GCommentFieldsData(
          [void Function(GCommentFieldsDataBuilder)? updates]) =>
      (new GCommentFieldsDataBuilder()..update(updates))._build();

  _$GCommentFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      required this.text,
      this.user,
      this.sticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCommentFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GCommentFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GCommentFieldsData', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(text, r'GCommentFieldsData', 'text');
  }

  @override
  GCommentFieldsData rebuild(
          void Function(GCommentFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCommentFieldsDataBuilder toBuilder() =>
      new GCommentFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCommentFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        text == other.text &&
        user == other.user &&
        sticker == other.sticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, sticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCommentFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('text', text)
          ..add('user', user)
          ..add('sticker', sticker))
        .toString();
  }
}

class GCommentFieldsDataBuilder
    implements Builder<GCommentFieldsData, GCommentFieldsDataBuilder> {
  _$GCommentFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  GCommentFieldsData_userBuilder? _user;
  GCommentFieldsData_userBuilder get user =>
      _$this._user ??= new GCommentFieldsData_userBuilder();
  set user(GCommentFieldsData_userBuilder? user) => _$this._user = user;

  GCommentFieldsData_stickerBuilder? _sticker;
  GCommentFieldsData_stickerBuilder get sticker =>
      _$this._sticker ??= new GCommentFieldsData_stickerBuilder();
  set sticker(GCommentFieldsData_stickerBuilder? sticker) =>
      _$this._sticker = sticker;

  GCommentFieldsDataBuilder() {
    GCommentFieldsData._initializeBuilder(this);
  }

  GCommentFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _text = $v.text;
      _user = $v.user?.toBuilder();
      _sticker = $v.sticker?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCommentFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCommentFieldsData;
  }

  @override
  void update(void Function(GCommentFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCommentFieldsData build() => _build();

  _$GCommentFieldsData _build() {
    _$GCommentFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GCommentFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCommentFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GCommentFieldsData', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GCommentFieldsData', 'createdAt'),
              text: BuiltValueNullFieldError.checkNotNull(
                  text, r'GCommentFieldsData', 'text'),
              user: _user?.build(),
              sticker: _sticker?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'sticker';
        _sticker?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCommentFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCommentFieldsData_user extends GCommentFieldsData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GCommentFieldsData_user_iconImage? iconImage;
  @override
  final bool isMuted;

  factory _$GCommentFieldsData_user(
          [void Function(GCommentFieldsData_userBuilder)? updates]) =>
      (new GCommentFieldsData_userBuilder()..update(updates))._build();

  _$GCommentFieldsData_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCommentFieldsData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GCommentFieldsData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GCommentFieldsData_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GCommentFieldsData_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GCommentFieldsData_user', 'isMuted');
  }

  @override
  GCommentFieldsData_user rebuild(
          void Function(GCommentFieldsData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCommentFieldsData_userBuilder toBuilder() =>
      new GCommentFieldsData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCommentFieldsData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
        iconImage == other.iconImage &&
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
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCommentFieldsData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GCommentFieldsData_userBuilder
    implements
        Builder<GCommentFieldsData_user, GCommentFieldsData_userBuilder> {
  _$GCommentFieldsData_user? _$v;

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

  GCommentFieldsData_user_iconImageBuilder? _iconImage;
  GCommentFieldsData_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GCommentFieldsData_user_iconImageBuilder();
  set iconImage(GCommentFieldsData_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GCommentFieldsData_userBuilder() {
    GCommentFieldsData_user._initializeBuilder(this);
  }

  GCommentFieldsData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCommentFieldsData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCommentFieldsData_user;
  }

  @override
  void update(void Function(GCommentFieldsData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCommentFieldsData_user build() => _build();

  _$GCommentFieldsData_user _build() {
    _$GCommentFieldsData_user _$result;
    try {
      _$result = _$v ??
          new _$GCommentFieldsData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCommentFieldsData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GCommentFieldsData_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GCommentFieldsData_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GCommentFieldsData_user', 'login'),
              iconImage: _iconImage?.build(),
              isMuted: BuiltValueNullFieldError.checkNotNull(
                  isMuted, r'GCommentFieldsData_user', 'isMuted'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCommentFieldsData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCommentFieldsData_user_iconImage
    extends GCommentFieldsData_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GCommentFieldsData_user_iconImage(
          [void Function(GCommentFieldsData_user_iconImageBuilder)? updates]) =>
      (new GCommentFieldsData_user_iconImageBuilder()..update(updates))
          ._build();

  _$GCommentFieldsData_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCommentFieldsData_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCommentFieldsData_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GCommentFieldsData_user_iconImage', 'downloadURL');
  }

  @override
  GCommentFieldsData_user_iconImage rebuild(
          void Function(GCommentFieldsData_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCommentFieldsData_user_iconImageBuilder toBuilder() =>
      new GCommentFieldsData_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCommentFieldsData_user_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GCommentFieldsData_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GCommentFieldsData_user_iconImageBuilder
    implements
        Builder<GCommentFieldsData_user_iconImage,
            GCommentFieldsData_user_iconImageBuilder> {
  _$GCommentFieldsData_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GCommentFieldsData_user_iconImageBuilder() {
    GCommentFieldsData_user_iconImage._initializeBuilder(this);
  }

  GCommentFieldsData_user_iconImageBuilder get _$this {
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
  void replace(GCommentFieldsData_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCommentFieldsData_user_iconImage;
  }

  @override
  void update(
      void Function(GCommentFieldsData_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCommentFieldsData_user_iconImage build() => _build();

  _$GCommentFieldsData_user_iconImage _build() {
    final _$result = _$v ??
        new _$GCommentFieldsData_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCommentFieldsData_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCommentFieldsData_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GCommentFieldsData_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GCommentFieldsData_sticker extends GCommentFieldsData_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final _i2.GAccessType accessType;
  @override
  final String? imageUrl;

  factory _$GCommentFieldsData_sticker(
          [void Function(GCommentFieldsData_stickerBuilder)? updates]) =>
      (new GCommentFieldsData_stickerBuilder()..update(updates))._build();

  _$GCommentFieldsData_sticker._(
      {required this.G__typename,
      required this.id,
      required this.accessType,
      this.imageUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCommentFieldsData_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCommentFieldsData_sticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        accessType, r'GCommentFieldsData_sticker', 'accessType');
  }

  @override
  GCommentFieldsData_sticker rebuild(
          void Function(GCommentFieldsData_stickerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCommentFieldsData_stickerBuilder toBuilder() =>
      new GCommentFieldsData_stickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCommentFieldsData_sticker &&
        G__typename == other.G__typename &&
        id == other.id &&
        accessType == other.accessType &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, accessType.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCommentFieldsData_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('accessType', accessType)
          ..add('imageUrl', imageUrl))
        .toString();
  }
}

class GCommentFieldsData_stickerBuilder
    implements
        Builder<GCommentFieldsData_sticker, GCommentFieldsData_stickerBuilder> {
  _$GCommentFieldsData_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  _i2.GAccessType? _accessType;
  _i2.GAccessType? get accessType => _$this._accessType;
  set accessType(_i2.GAccessType? accessType) =>
      _$this._accessType = accessType;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  GCommentFieldsData_stickerBuilder() {
    GCommentFieldsData_sticker._initializeBuilder(this);
  }

  GCommentFieldsData_stickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _accessType = $v.accessType;
      _imageUrl = $v.imageUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCommentFieldsData_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCommentFieldsData_sticker;
  }

  @override
  void update(void Function(GCommentFieldsData_stickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCommentFieldsData_sticker build() => _build();

  _$GCommentFieldsData_sticker _build() {
    final _$result = _$v ??
        new _$GCommentFieldsData_sticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCommentFieldsData_sticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCommentFieldsData_sticker', 'id'),
            accessType: BuiltValueNullFieldError.checkNotNull(
                accessType, r'GCommentFieldsData_sticker', 'accessType'),
            imageUrl: imageUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
