// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFolderData> _$gFolderDataSerializer = new _$GFolderDataSerializer();
Serializer<GFolderData_folder> _$gFolderDataFolderSerializer =
    new _$GFolderData_folderSerializer();
Serializer<GFolderData_folder_user> _$gFolderDataFolderUserSerializer =
    new _$GFolderData_folder_userSerializer();
Serializer<GFolderData_folder_user_iconImage>
    _$gFolderDataFolderUserIconImageSerializer =
    new _$GFolderData_folder_user_iconImageSerializer();
Serializer<GFolderData_folder_user_viewer>
    _$gFolderDataFolderUserViewerSerializer =
    new _$GFolderData_folder_user_viewerSerializer();

class _$GFolderDataSerializer implements StructuredSerializer<GFolderData> {
  @override
  final Iterable<Type> types = const [GFolderData, _$GFolderData];
  @override
  final String wireName = 'GFolderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFolderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.folder;
    if (value != null) {
      result
        ..add('folder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder)));
    }
    return result;
  }

  @override
  GFolderData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderDataBuilder();

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
        case 'folder':
          result.folder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFolderData_folder))!
              as GFolderData_folder);
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData_folderSerializer
    implements StructuredSerializer<GFolderData_folder> {
  @override
  final Iterable<Type> types = const [GFolderData_folder, _$GFolderData_folder];
  @override
  final String wireName = 'GFolderData_folder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'nanoid',
      serializers.serialize(object.nanoid,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'isPrivate',
      serializers.serialize(object.isPrivate,
          specifiedType: const FullType(bool)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder_user)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GRating)));
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
  GFolderData_folder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folderBuilder();

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
        case 'nanoid':
          result.nanoid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'isPrivate':
          result.isPrivate = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFolderData_folder_user))!
              as GFolderData_folder_user);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GRating)) as _i2.GRating?;
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

class _$GFolderData_folder_userSerializer
    implements StructuredSerializer<GFolderData_folder_user> {
  @override
  final Iterable<Type> types = const [
    GFolderData_folder_user,
    _$GFolderData_folder_user
  ];
  @override
  final String wireName = 'GFolderData_folder_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder_user object,
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
    ];
    Object? value;
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder_user_iconImage)));
    }
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderData_folder_user_viewer)));
    }
    return result;
  }

  @override
  GFolderData_folder_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folder_userBuilder();

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
                      const FullType(GFolderData_folder_user_iconImage))!
              as GFolderData_folder_user_iconImage);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFolderData_folder_user_viewer))!
              as GFolderData_folder_user_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderData_folder_user_iconImageSerializer
    implements StructuredSerializer<GFolderData_folder_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GFolderData_folder_user_iconImage,
    _$GFolderData_folder_user_iconImage
  ];
  @override
  final String wireName = 'GFolderData_folder_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder_user_iconImage object,
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
  GFolderData_folder_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folder_user_iconImageBuilder();

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

class _$GFolderData_folder_user_viewerSerializer
    implements StructuredSerializer<GFolderData_folder_user_viewer> {
  @override
  final Iterable<Type> types = const [
    GFolderData_folder_user_viewer,
    _$GFolderData_folder_user_viewer
  ];
  @override
  final String wireName = 'GFolderData_folder_user_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderData_folder_user_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'isFollowee',
      serializers.serialize(object.isFollowee,
          specifiedType: const FullType(bool)),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GFolderData_folder_user_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderData_folder_user_viewerBuilder();

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

class _$GFolderData extends GFolderData {
  @override
  final String G__typename;
  @override
  final GFolderData_folder? folder;

  factory _$GFolderData([void Function(GFolderDataBuilder)? updates]) =>
      (new GFolderDataBuilder()..update(updates))._build();

  _$GFolderData._({required this.G__typename, this.folder}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData', 'G__typename');
  }

  @override
  GFolderData rebuild(void Function(GFolderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderDataBuilder toBuilder() => new GFolderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData &&
        G__typename == other.G__typename &&
        folder == other.folder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, folder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData')
          ..add('G__typename', G__typename)
          ..add('folder', folder))
        .toString();
  }
}

class GFolderDataBuilder implements Builder<GFolderData, GFolderDataBuilder> {
  _$GFolderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFolderData_folderBuilder? _folder;
  GFolderData_folderBuilder get folder =>
      _$this._folder ??= new GFolderData_folderBuilder();
  set folder(GFolderData_folderBuilder? folder) => _$this._folder = folder;

  GFolderDataBuilder() {
    GFolderData._initializeBuilder(this);
  }

  GFolderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _folder = $v.folder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData;
  }

  @override
  void update(void Function(GFolderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData build() => _build();

  _$GFolderData _build() {
    _$GFolderData _$result;
    try {
      _$result = _$v ??
          new _$GFolderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFolderData', 'G__typename'),
              folder: _folder?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folder';
        _folder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFolderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder extends GFolderData_folder {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String nanoid;
  @override
  final String title;
  @override
  final bool isPrivate;
  @override
  final String description;
  @override
  final GFolderData_folder_user? user;
  @override
  final int createdAt;
  @override
  final _i2.GRating? rating;
  @override
  final String? thumbnailImageURL;

  factory _$GFolderData_folder(
          [void Function(GFolderData_folderBuilder)? updates]) =>
      (new GFolderData_folderBuilder()..update(updates))._build();

  _$GFolderData_folder._(
      {required this.G__typename,
      required this.id,
      required this.nanoid,
      required this.title,
      required this.isPrivate,
      required this.description,
      this.user,
      required this.createdAt,
      this.rating,
      this.thumbnailImageURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GFolderData_folder', 'id');
    BuiltValueNullFieldError.checkNotNull(
        nanoid, r'GFolderData_folder', 'nanoid');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFolderData_folder', 'title');
    BuiltValueNullFieldError.checkNotNull(
        isPrivate, r'GFolderData_folder', 'isPrivate');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GFolderData_folder', 'description');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFolderData_folder', 'createdAt');
  }

  @override
  GFolderData_folder rebuild(
          void Function(GFolderData_folderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folderBuilder toBuilder() =>
      new GFolderData_folderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder &&
        G__typename == other.G__typename &&
        id == other.id &&
        nanoid == other.nanoid &&
        title == other.title &&
        isPrivate == other.isPrivate &&
        description == other.description &&
        user == other.user &&
        createdAt == other.createdAt &&
        rating == other.rating &&
        thumbnailImageURL == other.thumbnailImageURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, nanoid.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, isPrivate.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('nanoid', nanoid)
          ..add('title', title)
          ..add('isPrivate', isPrivate)
          ..add('description', description)
          ..add('user', user)
          ..add('createdAt', createdAt)
          ..add('rating', rating)
          ..add('thumbnailImageURL', thumbnailImageURL))
        .toString();
  }
}

class GFolderData_folderBuilder
    implements Builder<GFolderData_folder, GFolderData_folderBuilder> {
  _$GFolderData_folder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _nanoid;
  String? get nanoid => _$this._nanoid;
  set nanoid(String? nanoid) => _$this._nanoid = nanoid;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _isPrivate;
  bool? get isPrivate => _$this._isPrivate;
  set isPrivate(bool? isPrivate) => _$this._isPrivate = isPrivate;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GFolderData_folder_userBuilder? _user;
  GFolderData_folder_userBuilder get user =>
      _$this._user ??= new GFolderData_folder_userBuilder();
  set user(GFolderData_folder_userBuilder? user) => _$this._user = user;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  _i2.GRating? _rating;
  _i2.GRating? get rating => _$this._rating;
  set rating(_i2.GRating? rating) => _$this._rating = rating;

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  GFolderData_folderBuilder() {
    GFolderData_folder._initializeBuilder(this);
  }

  GFolderData_folderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _nanoid = $v.nanoid;
      _title = $v.title;
      _isPrivate = $v.isPrivate;
      _description = $v.description;
      _user = $v.user?.toBuilder();
      _createdAt = $v.createdAt;
      _rating = $v.rating;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder;
  }

  @override
  void update(void Function(GFolderData_folderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder build() => _build();

  _$GFolderData_folder _build() {
    _$GFolderData_folder _$result;
    try {
      _$result = _$v ??
          new _$GFolderData_folder._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFolderData_folder', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFolderData_folder', 'id'),
              nanoid: BuiltValueNullFieldError.checkNotNull(
                  nanoid, r'GFolderData_folder', 'nanoid'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFolderData_folder', 'title'),
              isPrivate: BuiltValueNullFieldError.checkNotNull(
                  isPrivate, r'GFolderData_folder', 'isPrivate'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GFolderData_folder', 'description'),
              user: _user?.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GFolderData_folder', 'createdAt'),
              rating: rating,
              thumbnailImageURL: thumbnailImageURL);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFolderData_folder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder_user extends GFolderData_folder_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GFolderData_folder_user_iconImage? iconImage;
  @override
  final GFolderData_folder_user_viewer? viewer;

  factory _$GFolderData_folder_user(
          [void Function(GFolderData_folder_userBuilder)? updates]) =>
      (new GFolderData_folder_userBuilder()..update(updates))._build();

  _$GFolderData_folder_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GFolderData_folder_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFolderData_folder_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFolderData_folder_user', 'login');
  }

  @override
  GFolderData_folder_user rebuild(
          void Function(GFolderData_folder_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folder_userBuilder toBuilder() =>
      new GFolderData_folder_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
        iconImage == other.iconImage &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage)
          ..add('viewer', viewer))
        .toString();
  }
}

class GFolderData_folder_userBuilder
    implements
        Builder<GFolderData_folder_user, GFolderData_folder_userBuilder> {
  _$GFolderData_folder_user? _$v;

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

  GFolderData_folder_user_iconImageBuilder? _iconImage;
  GFolderData_folder_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GFolderData_folder_user_iconImageBuilder();
  set iconImage(GFolderData_folder_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GFolderData_folder_user_viewerBuilder? _viewer;
  GFolderData_folder_user_viewerBuilder get viewer =>
      _$this._viewer ??= new GFolderData_folder_user_viewerBuilder();
  set viewer(GFolderData_folder_user_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GFolderData_folder_userBuilder() {
    GFolderData_folder_user._initializeBuilder(this);
  }

  GFolderData_folder_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder_user;
  }

  @override
  void update(void Function(GFolderData_folder_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder_user build() => _build();

  _$GFolderData_folder_user _build() {
    _$GFolderData_folder_user _$result;
    try {
      _$result = _$v ??
          new _$GFolderData_folder_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFolderData_folder_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFolderData_folder_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GFolderData_folder_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GFolderData_folder_user', 'login'),
              iconImage: _iconImage?.build(),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFolderData_folder_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder_user_iconImage
    extends GFolderData_folder_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFolderData_folder_user_iconImage(
          [void Function(GFolderData_folder_user_iconImageBuilder)? updates]) =>
      (new GFolderData_folder_user_iconImageBuilder()..update(updates))
          ._build();

  _$GFolderData_folder_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFolderData_folder_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GFolderData_folder_user_iconImage', 'downloadURL');
  }

  @override
  GFolderData_folder_user_iconImage rebuild(
          void Function(GFolderData_folder_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folder_user_iconImageBuilder toBuilder() =>
      new GFolderData_folder_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder_user_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GFolderData_folder_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFolderData_folder_user_iconImageBuilder
    implements
        Builder<GFolderData_folder_user_iconImage,
            GFolderData_folder_user_iconImageBuilder> {
  _$GFolderData_folder_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFolderData_folder_user_iconImageBuilder() {
    GFolderData_folder_user_iconImage._initializeBuilder(this);
  }

  GFolderData_folder_user_iconImageBuilder get _$this {
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
  void replace(GFolderData_folder_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder_user_iconImage;
  }

  @override
  void update(
      void Function(GFolderData_folder_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder_user_iconImage build() => _build();

  _$GFolderData_folder_user_iconImage _build() {
    final _$result = _$v ??
        new _$GFolderData_folder_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFolderData_folder_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFolderData_folder_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GFolderData_folder_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFolderData_folder_user_viewer extends GFolderData_folder_user_viewer {
  @override
  final String G__typename;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GFolderData_folder_user_viewer(
          [void Function(GFolderData_folder_user_viewerBuilder)? updates]) =>
      (new GFolderData_folder_user_viewerBuilder()..update(updates))._build();

  _$GFolderData_folder_user_viewer._(
      {required this.G__typename,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderData_folder_user_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GFolderData_folder_user_viewer', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GFolderData_folder_user_viewer', 'isMuted');
  }

  @override
  GFolderData_folder_user_viewer rebuild(
          void Function(GFolderData_folder_user_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderData_folder_user_viewerBuilder toBuilder() =>
      new GFolderData_folder_user_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderData_folder_user_viewer &&
        G__typename == other.G__typename &&
        isFollowee == other.isFollowee &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderData_folder_user_viewer')
          ..add('G__typename', G__typename)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GFolderData_folder_user_viewerBuilder
    implements
        Builder<GFolderData_folder_user_viewer,
            GFolderData_folder_user_viewerBuilder> {
  _$GFolderData_folder_user_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GFolderData_folder_user_viewerBuilder() {
    GFolderData_folder_user_viewer._initializeBuilder(this);
  }

  GFolderData_folder_user_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderData_folder_user_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderData_folder_user_viewer;
  }

  @override
  void update(void Function(GFolderData_folder_user_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderData_folder_user_viewer build() => _build();

  _$GFolderData_folder_user_viewer _build() {
    final _$result = _$v ??
        new _$GFolderData_folder_user_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GFolderData_folder_user_viewer', 'G__typename'),
            isFollowee: BuiltValueNullFieldError.checkNotNull(
                isFollowee, r'GFolderData_folder_user_viewer', 'isFollowee'),
            isMuted: BuiltValueNullFieldError.checkNotNull(
                isMuted, r'GFolderData_folder_user_viewer', 'isMuted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
