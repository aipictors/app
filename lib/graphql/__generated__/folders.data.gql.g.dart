// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFoldersData> _$gFoldersDataSerializer =
    new _$GFoldersDataSerializer();
Serializer<GFoldersData_folders> _$gFoldersDataFoldersSerializer =
    new _$GFoldersData_foldersSerializer();
Serializer<GFoldersData_folders_user> _$gFoldersDataFoldersUserSerializer =
    new _$GFoldersData_folders_userSerializer();
Serializer<GFoldersData_folders_user_iconImage>
    _$gFoldersDataFoldersUserIconImageSerializer =
    new _$GFoldersData_folders_user_iconImageSerializer();

class _$GFoldersDataSerializer implements StructuredSerializer<GFoldersData> {
  @override
  final Iterable<Type> types = const [GFoldersData, _$GFoldersData];
  @override
  final String wireName = 'GFoldersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFoldersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.folders;
    if (value != null) {
      result
        ..add('folders')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFoldersData_folders)])));
    }
    return result;
  }

  @override
  GFoldersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFoldersDataBuilder();

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
        case 'folders':
          result.folders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFoldersData_folders)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFoldersData_foldersSerializer
    implements StructuredSerializer<GFoldersData_folders> {
  @override
  final Iterable<Type> types = const [
    GFoldersData_folders,
    _$GFoldersData_folders
  ];
  @override
  final String wireName = 'GFoldersData_folders';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFoldersData_folders object,
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
    ];
    Object? value;
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i3.GRating)));
    }
    value = object.thumbnailImageURL;
    if (value != null) {
      result
        ..add('thumbnailImageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFoldersData_folders_user)));
    }
    return result;
  }

  @override
  GFoldersData_folders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFoldersData_foldersBuilder();

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
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(_i3.GRating)) as _i3.GRating?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'thumbnailImageURL':
          result.thumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFoldersData_folders_user))!
              as GFoldersData_folders_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GFoldersData_folders_userSerializer
    implements StructuredSerializer<GFoldersData_folders_user> {
  @override
  final Iterable<Type> types = const [
    GFoldersData_folders_user,
    _$GFoldersData_folders_user
  ];
  @override
  final String wireName = 'GFoldersData_folders_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFoldersData_folders_user object,
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
                const FullType(GFoldersData_folders_user_iconImage)));
    }
    return result;
  }

  @override
  GFoldersData_folders_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFoldersData_folders_userBuilder();

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
                      const FullType(GFoldersData_folders_user_iconImage))!
              as GFoldersData_folders_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GFoldersData_folders_user_iconImageSerializer
    implements StructuredSerializer<GFoldersData_folders_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GFoldersData_folders_user_iconImage,
    _$GFoldersData_folders_user_iconImage
  ];
  @override
  final String wireName = 'GFoldersData_folders_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFoldersData_folders_user_iconImage object,
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
  GFoldersData_folders_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFoldersData_folders_user_iconImageBuilder();

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

class _$GFoldersData extends GFoldersData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFoldersData_folders>? folders;

  factory _$GFoldersData([void Function(GFoldersDataBuilder)? updates]) =>
      (new GFoldersDataBuilder()..update(updates))._build();

  _$GFoldersData._({required this.G__typename, this.folders}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFoldersData', 'G__typename');
  }

  @override
  GFoldersData rebuild(void Function(GFoldersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFoldersDataBuilder toBuilder() => new GFoldersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFoldersData &&
        G__typename == other.G__typename &&
        folders == other.folders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, folders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFoldersData')
          ..add('G__typename', G__typename)
          ..add('folders', folders))
        .toString();
  }
}

class GFoldersDataBuilder
    implements Builder<GFoldersData, GFoldersDataBuilder> {
  _$GFoldersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFoldersData_folders>? _folders;
  ListBuilder<GFoldersData_folders> get folders =>
      _$this._folders ??= new ListBuilder<GFoldersData_folders>();
  set folders(ListBuilder<GFoldersData_folders>? folders) =>
      _$this._folders = folders;

  GFoldersDataBuilder() {
    GFoldersData._initializeBuilder(this);
  }

  GFoldersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _folders = $v.folders?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFoldersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFoldersData;
  }

  @override
  void update(void Function(GFoldersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFoldersData build() => _build();

  _$GFoldersData _build() {
    _$GFoldersData _$result;
    try {
      _$result = _$v ??
          new _$GFoldersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFoldersData', 'G__typename'),
              folders: _folders?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folders';
        _folders?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFoldersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFoldersData_folders extends GFoldersData_folders {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final _i3.GRating? rating;
  @override
  final String description;
  @override
  final String? thumbnailImageURL;
  @override
  final GFoldersData_folders_user? user;

  factory _$GFoldersData_folders(
          [void Function(GFoldersData_foldersBuilder)? updates]) =>
      (new GFoldersData_foldersBuilder()..update(updates))._build();

  _$GFoldersData_folders._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.rating,
      required this.description,
      this.thumbnailImageURL,
      this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFoldersData_folders', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GFoldersData_folders', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFoldersData_folders', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GFoldersData_folders', 'description');
  }

  @override
  GFoldersData_folders rebuild(
          void Function(GFoldersData_foldersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFoldersData_foldersBuilder toBuilder() =>
      new GFoldersData_foldersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFoldersData_folders &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        rating == other.rating &&
        description == other.description &&
        thumbnailImageURL == other.thumbnailImageURL &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFoldersData_folders')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('rating', rating)
          ..add('description', description)
          ..add('thumbnailImageURL', thumbnailImageURL)
          ..add('user', user))
        .toString();
  }
}

class GFoldersData_foldersBuilder
    implements Builder<GFoldersData_folders, GFoldersData_foldersBuilder> {
  _$GFoldersData_folders? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  _i3.GRating? _rating;
  _i3.GRating? get rating => _$this._rating;
  set rating(_i3.GRating? rating) => _$this._rating = rating;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  GFoldersData_folders_userBuilder? _user;
  GFoldersData_folders_userBuilder get user =>
      _$this._user ??= new GFoldersData_folders_userBuilder();
  set user(GFoldersData_folders_userBuilder? user) => _$this._user = user;

  GFoldersData_foldersBuilder() {
    GFoldersData_folders._initializeBuilder(this);
  }

  GFoldersData_foldersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _rating = $v.rating;
      _description = $v.description;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFoldersData_folders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFoldersData_folders;
  }

  @override
  void update(void Function(GFoldersData_foldersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFoldersData_folders build() => _build();

  _$GFoldersData_folders _build() {
    _$GFoldersData_folders _$result;
    try {
      _$result = _$v ??
          new _$GFoldersData_folders._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFoldersData_folders', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFoldersData_folders', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFoldersData_folders', 'title'),
              rating: rating,
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GFoldersData_folders', 'description'),
              thumbnailImageURL: thumbnailImageURL,
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFoldersData_folders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFoldersData_folders_user extends GFoldersData_folders_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GFoldersData_folders_user_iconImage? iconImage;

  factory _$GFoldersData_folders_user(
          [void Function(GFoldersData_folders_userBuilder)? updates]) =>
      (new GFoldersData_folders_userBuilder()..update(updates))._build();

  _$GFoldersData_folders_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFoldersData_folders_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFoldersData_folders_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFoldersData_folders_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFoldersData_folders_user', 'name');
  }

  @override
  GFoldersData_folders_user rebuild(
          void Function(GFoldersData_folders_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFoldersData_folders_userBuilder toBuilder() =>
      new GFoldersData_folders_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFoldersData_folders_user &&
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
    return (newBuiltValueToStringHelper(r'GFoldersData_folders_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GFoldersData_folders_userBuilder
    implements
        Builder<GFoldersData_folders_user, GFoldersData_folders_userBuilder> {
  _$GFoldersData_folders_user? _$v;

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

  GFoldersData_folders_user_iconImageBuilder? _iconImage;
  GFoldersData_folders_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GFoldersData_folders_user_iconImageBuilder();
  set iconImage(GFoldersData_folders_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GFoldersData_folders_userBuilder() {
    GFoldersData_folders_user._initializeBuilder(this);
  }

  GFoldersData_folders_userBuilder get _$this {
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
  void replace(GFoldersData_folders_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFoldersData_folders_user;
  }

  @override
  void update(void Function(GFoldersData_folders_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFoldersData_folders_user build() => _build();

  _$GFoldersData_folders_user _build() {
    _$GFoldersData_folders_user _$result;
    try {
      _$result = _$v ??
          new _$GFoldersData_folders_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFoldersData_folders_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFoldersData_folders_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GFoldersData_folders_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GFoldersData_folders_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFoldersData_folders_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFoldersData_folders_user_iconImage
    extends GFoldersData_folders_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFoldersData_folders_user_iconImage(
          [void Function(GFoldersData_folders_user_iconImageBuilder)?
              updates]) =>
      (new GFoldersData_folders_user_iconImageBuilder()..update(updates))
          ._build();

  _$GFoldersData_folders_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFoldersData_folders_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFoldersData_folders_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GFoldersData_folders_user_iconImage', 'downloadURL');
  }

  @override
  GFoldersData_folders_user_iconImage rebuild(
          void Function(GFoldersData_folders_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFoldersData_folders_user_iconImageBuilder toBuilder() =>
      new GFoldersData_folders_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFoldersData_folders_user_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GFoldersData_folders_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFoldersData_folders_user_iconImageBuilder
    implements
        Builder<GFoldersData_folders_user_iconImage,
            GFoldersData_folders_user_iconImageBuilder> {
  _$GFoldersData_folders_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFoldersData_folders_user_iconImageBuilder() {
    GFoldersData_folders_user_iconImage._initializeBuilder(this);
  }

  GFoldersData_folders_user_iconImageBuilder get _$this {
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
  void replace(GFoldersData_folders_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFoldersData_folders_user_iconImage;
  }

  @override
  void update(
      void Function(GFoldersData_folders_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFoldersData_folders_user_iconImage build() => _build();

  _$GFoldersData_folders_user_iconImage _build() {
    final _$result = _$v ??
        new _$GFoldersData_folders_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFoldersData_folders_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFoldersData_folders_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFoldersData_folders_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
