// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkData> _$gWorkDataSerializer = new _$GWorkDataSerializer();
Serializer<GWorkData_work> _$gWorkDataWorkSerializer =
    new _$GWorkData_workSerializer();
Serializer<GWorkData_work_image> _$gWorkDataWorkImageSerializer =
    new _$GWorkData_work_imageSerializer();
Serializer<GWorkData_work_user> _$gWorkDataWorkUserSerializer =
    new _$GWorkData_work_userSerializer();
Serializer<GWorkData_work_user_iconImage>
    _$gWorkDataWorkUserIconImageSerializer =
    new _$GWorkData_work_user_iconImageSerializer();
Serializer<GWorkData_work_viewer> _$gWorkDataWorkViewerSerializer =
    new _$GWorkData_work_viewerSerializer();

class _$GWorkDataSerializer implements StructuredSerializer<GWorkData> {
  @override
  final Iterable<Type> types = const [GWorkData, _$GWorkData];
  @override
  final String wireName = 'GWorkData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.work;
    if (value != null) {
      result
        ..add('work')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GWorkData_work)));
    }
    return result;
  }

  @override
  GWorkData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkDataBuilder();

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
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GWorkData_work))!
              as GWorkData_work);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkData_workSerializer
    implements StructuredSerializer<GWorkData_work> {
  @override
  final Iterable<Type> types = const [GWorkData_work, _$GWorkData_work];
  @override
  final String wireName = 'GWorkData_work';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorkData_work object,
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
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GWorkData_work_user)),
      'tagNames',
      serializers.serialize(object.tagNames,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'viewsCount',
      serializers.serialize(object.viewsCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GWorkData_work_image)));
    }
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GWorkData_work_viewer)));
    }
    return result;
  }

  @override
  GWorkData_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkData_workBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GWorkData_work_image))!
              as GWorkData_work_image);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GWorkData_work_user))!
              as GWorkData_work_user);
          break;
        case 'tagNames':
          result.tagNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'viewsCount':
          result.viewsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GWorkData_work_viewer))!
              as GWorkData_work_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkData_work_imageSerializer
    implements StructuredSerializer<GWorkData_work_image> {
  @override
  final Iterable<Type> types = const [
    GWorkData_work_image,
    _$GWorkData_work_image
  ];
  @override
  final String wireName = 'GWorkData_work_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkData_work_image object,
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
  GWorkData_work_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkData_work_imageBuilder();

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

class _$GWorkData_work_userSerializer
    implements StructuredSerializer<GWorkData_work_user> {
  @override
  final Iterable<Type> types = const [
    GWorkData_work_user,
    _$GWorkData_work_user
  ];
  @override
  final String wireName = 'GWorkData_work_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkData_work_user object,
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
            specifiedType: const FullType(GWorkData_work_user_iconImage)));
    }
    return result;
  }

  @override
  GWorkData_work_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkData_work_userBuilder();

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
                  specifiedType: const FullType(GWorkData_work_user_iconImage))!
              as GWorkData_work_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkData_work_user_iconImageSerializer
    implements StructuredSerializer<GWorkData_work_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GWorkData_work_user_iconImage,
    _$GWorkData_work_user_iconImage
  ];
  @override
  final String wireName = 'GWorkData_work_user_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkData_work_user_iconImage object,
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
  GWorkData_work_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkData_work_user_iconImageBuilder();

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

class _$GWorkData_work_viewerSerializer
    implements StructuredSerializer<GWorkData_work_viewer> {
  @override
  final Iterable<Type> types = const [
    GWorkData_work_viewer,
    _$GWorkData_work_viewer
  ];
  @override
  final String wireName = 'GWorkData_work_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkData_work_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
      'isBookmarked',
      serializers.serialize(object.isBookmarked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GWorkData_work_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkData_work_viewerBuilder();

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
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isBookmarked':
          result.isBookmarked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkData extends GWorkData {
  @override
  final String G__typename;
  @override
  final GWorkData_work? work;

  factory _$GWorkData([void Function(GWorkDataBuilder)? updates]) =>
      (new GWorkDataBuilder()..update(updates))._build();

  _$GWorkData._({required this.G__typename, this.work}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData', 'G__typename');
  }

  @override
  GWorkData rebuild(void Function(GWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkDataBuilder toBuilder() => new GWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData &&
        G__typename == other.G__typename &&
        work == other.work;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkData')
          ..add('G__typename', G__typename)
          ..add('work', work))
        .toString();
  }
}

class GWorkDataBuilder implements Builder<GWorkData, GWorkDataBuilder> {
  _$GWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GWorkData_workBuilder? _work;
  GWorkData_workBuilder get work =>
      _$this._work ??= new GWorkData_workBuilder();
  set work(GWorkData_workBuilder? work) => _$this._work = work;

  GWorkDataBuilder() {
    GWorkData._initializeBuilder(this);
  }

  GWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _work = $v.work?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData;
  }

  @override
  void update(void Function(GWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData build() => _build();

  _$GWorkData _build() {
    _$GWorkData _$result;
    try {
      _$result = _$v ??
          new _$GWorkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkData', 'G__typename'),
              work: _work?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        _work?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkData_work extends GWorkData_work {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final GWorkData_work_image? image;
  @override
  final GWorkData_work_user user;
  @override
  final BuiltList<String> tagNames;
  @override
  final int createdAt;
  @override
  final int likesCount;
  @override
  final int viewsCount;
  @override
  final GWorkData_work_viewer? viewer;

  factory _$GWorkData_work([void Function(GWorkData_workBuilder)? updates]) =>
      (new GWorkData_workBuilder()..update(updates))._build();

  _$GWorkData_work._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.description,
      this.image,
      required this.user,
      required this.tagNames,
      required this.createdAt,
      required this.likesCount,
      required this.viewsCount,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'GWorkData_work', 'title');
    BuiltValueNullFieldError.checkNotNull(user, r'GWorkData_work', 'user');
    BuiltValueNullFieldError.checkNotNull(
        tagNames, r'GWorkData_work', 'tagNames');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkData_work', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GWorkData_work', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GWorkData_work', 'viewsCount');
  }

  @override
  GWorkData_work rebuild(void Function(GWorkData_workBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkData_workBuilder toBuilder() =>
      new GWorkData_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData_work &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        image == other.image &&
        user == other.user &&
        tagNames == other.tagNames &&
        createdAt == other.createdAt &&
        likesCount == other.likesCount &&
        viewsCount == other.viewsCount &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, tagNames.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewsCount.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkData_work')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('image', image)
          ..add('user', user)
          ..add('tagNames', tagNames)
          ..add('createdAt', createdAt)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('viewer', viewer))
        .toString();
  }
}

class GWorkData_workBuilder
    implements Builder<GWorkData_work, GWorkData_workBuilder> {
  _$GWorkData_work? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GWorkData_work_imageBuilder? _image;
  GWorkData_work_imageBuilder get image =>
      _$this._image ??= new GWorkData_work_imageBuilder();
  set image(GWorkData_work_imageBuilder? image) => _$this._image = image;

  GWorkData_work_userBuilder? _user;
  GWorkData_work_userBuilder get user =>
      _$this._user ??= new GWorkData_work_userBuilder();
  set user(GWorkData_work_userBuilder? user) => _$this._user = user;

  ListBuilder<String>? _tagNames;
  ListBuilder<String> get tagNames =>
      _$this._tagNames ??= new ListBuilder<String>();
  set tagNames(ListBuilder<String>? tagNames) => _$this._tagNames = tagNames;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _viewsCount;
  int? get viewsCount => _$this._viewsCount;
  set viewsCount(int? viewsCount) => _$this._viewsCount = viewsCount;

  GWorkData_work_viewerBuilder? _viewer;
  GWorkData_work_viewerBuilder get viewer =>
      _$this._viewer ??= new GWorkData_work_viewerBuilder();
  set viewer(GWorkData_work_viewerBuilder? viewer) => _$this._viewer = viewer;

  GWorkData_workBuilder() {
    GWorkData_work._initializeBuilder(this);
  }

  GWorkData_workBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _image = $v.image?.toBuilder();
      _user = $v.user.toBuilder();
      _tagNames = $v.tagNames.toBuilder();
      _createdAt = $v.createdAt;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkData_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData_work;
  }

  @override
  void update(void Function(GWorkData_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData_work build() => _build();

  _$GWorkData_work _build() {
    _$GWorkData_work _$result;
    try {
      _$result = _$v ??
          new _$GWorkData_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkData_work', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkData_work', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GWorkData_work', 'title'),
              description: description,
              image: _image?.build(),
              user: user.build(),
              tagNames: tagNames.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GWorkData_work', 'createdAt'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GWorkData_work', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GWorkData_work', 'viewsCount'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'user';
        user.build();
        _$failedField = 'tagNames';
        tagNames.build();

        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkData_work', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkData_work_image extends GWorkData_work_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkData_work_image(
          [void Function(GWorkData_work_imageBuilder)? updates]) =>
      (new GWorkData_work_imageBuilder()..update(updates))._build();

  _$GWorkData_work_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkData_work_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GWorkData_work_image', 'downloadURL');
  }

  @override
  GWorkData_work_image rebuild(
          void Function(GWorkData_work_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkData_work_imageBuilder toBuilder() =>
      new GWorkData_work_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData_work_image &&
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
    return (newBuiltValueToStringHelper(r'GWorkData_work_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkData_work_imageBuilder
    implements Builder<GWorkData_work_image, GWorkData_work_imageBuilder> {
  _$GWorkData_work_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkData_work_imageBuilder() {
    GWorkData_work_image._initializeBuilder(this);
  }

  GWorkData_work_imageBuilder get _$this {
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
  void replace(GWorkData_work_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData_work_image;
  }

  @override
  void update(void Function(GWorkData_work_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData_work_image build() => _build();

  _$GWorkData_work_image _build() {
    final _$result = _$v ??
        new _$GWorkData_work_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkData_work_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkData_work_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GWorkData_work_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkData_work_user extends GWorkData_work_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GWorkData_work_user_iconImage? iconImage;

  factory _$GWorkData_work_user(
          [void Function(GWorkData_work_userBuilder)? updates]) =>
      (new GWorkData_work_userBuilder()..update(updates))._build();

  _$GWorkData_work_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkData_work_user', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GWorkData_work_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GWorkData_work_user', 'login');
  }

  @override
  GWorkData_work_user rebuild(
          void Function(GWorkData_work_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkData_work_userBuilder toBuilder() =>
      new GWorkData_work_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData_work_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkData_work_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GWorkData_work_userBuilder
    implements Builder<GWorkData_work_user, GWorkData_work_userBuilder> {
  _$GWorkData_work_user? _$v;

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

  GWorkData_work_user_iconImageBuilder? _iconImage;
  GWorkData_work_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GWorkData_work_user_iconImageBuilder();
  set iconImage(GWorkData_work_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GWorkData_work_userBuilder() {
    GWorkData_work_user._initializeBuilder(this);
  }

  GWorkData_work_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkData_work_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData_work_user;
  }

  @override
  void update(void Function(GWorkData_work_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData_work_user build() => _build();

  _$GWorkData_work_user _build() {
    _$GWorkData_work_user _$result;
    try {
      _$result = _$v ??
          new _$GWorkData_work_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkData_work_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkData_work_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GWorkData_work_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GWorkData_work_user', 'login'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkData_work_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkData_work_user_iconImage extends GWorkData_work_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkData_work_user_iconImage(
          [void Function(GWorkData_work_user_iconImageBuilder)? updates]) =>
      (new GWorkData_work_user_iconImageBuilder()..update(updates))._build();

  _$GWorkData_work_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkData_work_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GWorkData_work_user_iconImage', 'downloadURL');
  }

  @override
  GWorkData_work_user_iconImage rebuild(
          void Function(GWorkData_work_user_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkData_work_user_iconImageBuilder toBuilder() =>
      new GWorkData_work_user_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData_work_user_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GWorkData_work_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkData_work_user_iconImageBuilder
    implements
        Builder<GWorkData_work_user_iconImage,
            GWorkData_work_user_iconImageBuilder> {
  _$GWorkData_work_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkData_work_user_iconImageBuilder() {
    GWorkData_work_user_iconImage._initializeBuilder(this);
  }

  GWorkData_work_user_iconImageBuilder get _$this {
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
  void replace(GWorkData_work_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData_work_user_iconImage;
  }

  @override
  void update(void Function(GWorkData_work_user_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData_work_user_iconImage build() => _build();

  _$GWorkData_work_user_iconImage _build() {
    final _$result = _$v ??
        new _$GWorkData_work_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkData_work_user_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkData_work_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GWorkData_work_user_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkData_work_viewer extends GWorkData_work_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;
  @override
  final bool isBookmarked;

  factory _$GWorkData_work_viewer(
          [void Function(GWorkData_work_viewerBuilder)? updates]) =>
      (new GWorkData_work_viewerBuilder()..update(updates))._build();

  _$GWorkData_work_viewer._(
      {required this.G__typename,
      required this.id,
      required this.isLiked,
      required this.isBookmarked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkData_work_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GWorkData_work_viewer', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(
        isBookmarked, r'GWorkData_work_viewer', 'isBookmarked');
  }

  @override
  GWorkData_work_viewer rebuild(
          void Function(GWorkData_work_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkData_work_viewerBuilder toBuilder() =>
      new GWorkData_work_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData_work_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isLiked == other.isLiked &&
        isBookmarked == other.isBookmarked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jc(_$hash, isBookmarked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkData_work_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked)
          ..add('isBookmarked', isBookmarked))
        .toString();
  }
}

class GWorkData_work_viewerBuilder
    implements Builder<GWorkData_work_viewer, GWorkData_work_viewerBuilder> {
  _$GWorkData_work_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  bool? _isBookmarked;
  bool? get isBookmarked => _$this._isBookmarked;
  set isBookmarked(bool? isBookmarked) => _$this._isBookmarked = isBookmarked;

  GWorkData_work_viewerBuilder() {
    GWorkData_work_viewer._initializeBuilder(this);
  }

  GWorkData_work_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isLiked = $v.isLiked;
      _isBookmarked = $v.isBookmarked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkData_work_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData_work_viewer;
  }

  @override
  void update(void Function(GWorkData_work_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData_work_viewer build() => _build();

  _$GWorkData_work_viewer _build() {
    final _$result = _$v ??
        new _$GWorkData_work_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkData_work_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkData_work_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GWorkData_work_viewer', 'isLiked'),
            isBookmarked: BuiltValueNullFieldError.checkNotNull(
                isBookmarked, r'GWorkData_work_viewer', 'isBookmarked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
