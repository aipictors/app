// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_work_notification_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLikedWorkNotificationFieldsData>
    _$gLikedWorkNotificationFieldsDataSerializer =
    new _$GLikedWorkNotificationFieldsDataSerializer();
Serializer<GLikedWorkNotificationFieldsData_work>
    _$gLikedWorkNotificationFieldsDataWorkSerializer =
    new _$GLikedWorkNotificationFieldsData_workSerializer();
Serializer<GLikedWorkNotificationFieldsData_work_thumbnailImage>
    _$gLikedWorkNotificationFieldsDataWorkThumbnailImageSerializer =
    new _$GLikedWorkNotificationFieldsData_work_thumbnailImageSerializer();
Serializer<GLikedWorkNotificationFieldsData_user>
    _$gLikedWorkNotificationFieldsDataUserSerializer =
    new _$GLikedWorkNotificationFieldsData_userSerializer();
Serializer<GLikedWorkNotificationFieldsData_user_iconImage>
    _$gLikedWorkNotificationFieldsDataUserIconImageSerializer =
    new _$GLikedWorkNotificationFieldsData_user_iconImageSerializer();

class _$GLikedWorkNotificationFieldsDataSerializer
    implements StructuredSerializer<GLikedWorkNotificationFieldsData> {
  @override
  final Iterable<Type> types = const [
    GLikedWorkNotificationFieldsData,
    _$GLikedWorkNotificationFieldsData
  ];
  @override
  final String wireName = 'GLikedWorkNotificationFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLikedWorkNotificationFieldsData object,
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
      'isAnonymous',
      serializers.serialize(object.isAnonymous,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.work;
    if (value != null) {
      result
        ..add('work')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GLikedWorkNotificationFieldsData_work)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GLikedWorkNotificationFieldsData_user)));
    }
    return result;
  }

  @override
  GLikedWorkNotificationFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLikedWorkNotificationFieldsDataBuilder();

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
        case 'isAnonymous':
          result.isAnonymous = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GLikedWorkNotificationFieldsData_work))!
              as GLikedWorkNotificationFieldsData_work);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GLikedWorkNotificationFieldsData_user))!
              as GLikedWorkNotificationFieldsData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GLikedWorkNotificationFieldsData_workSerializer
    implements StructuredSerializer<GLikedWorkNotificationFieldsData_work> {
  @override
  final Iterable<Type> types = const [
    GLikedWorkNotificationFieldsData_work,
    _$GLikedWorkNotificationFieldsData_work
  ];
  @override
  final String wireName = 'GLikedWorkNotificationFieldsData_work';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLikedWorkNotificationFieldsData_work object,
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
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'commentsCount',
      serializers.serialize(object.commentsCount,
          specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GLikedWorkNotificationFieldsData_work_thumbnailImage)));
    }
    return result;
  }

  @override
  GLikedWorkNotificationFieldsData_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLikedWorkNotificationFieldsData_workBuilder();

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
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'commentsCount':
          result.commentsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GLikedWorkNotificationFieldsData_work_thumbnailImage))!
              as GLikedWorkNotificationFieldsData_work_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GLikedWorkNotificationFieldsData_work_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GLikedWorkNotificationFieldsData_work_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GLikedWorkNotificationFieldsData_work_thumbnailImage,
    _$GLikedWorkNotificationFieldsData_work_thumbnailImage
  ];
  @override
  final String wireName =
      'GLikedWorkNotificationFieldsData_work_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GLikedWorkNotificationFieldsData_work_thumbnailImage object,
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
  GLikedWorkNotificationFieldsData_work_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder();

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

class _$GLikedWorkNotificationFieldsData_userSerializer
    implements StructuredSerializer<GLikedWorkNotificationFieldsData_user> {
  @override
  final Iterable<Type> types = const [
    GLikedWorkNotificationFieldsData_user,
    _$GLikedWorkNotificationFieldsData_user
  ];
  @override
  final String wireName = 'GLikedWorkNotificationFieldsData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLikedWorkNotificationFieldsData_user object,
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
            specifiedType: const FullType(
                GLikedWorkNotificationFieldsData_user_iconImage)));
    }
    return result;
  }

  @override
  GLikedWorkNotificationFieldsData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLikedWorkNotificationFieldsData_userBuilder();

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
                      GLikedWorkNotificationFieldsData_user_iconImage))!
              as GLikedWorkNotificationFieldsData_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GLikedWorkNotificationFieldsData_user_iconImageSerializer
    implements
        StructuredSerializer<GLikedWorkNotificationFieldsData_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GLikedWorkNotificationFieldsData_user_iconImage,
    _$GLikedWorkNotificationFieldsData_user_iconImage
  ];
  @override
  final String wireName = 'GLikedWorkNotificationFieldsData_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GLikedWorkNotificationFieldsData_user_iconImage object,
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
  GLikedWorkNotificationFieldsData_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLikedWorkNotificationFieldsData_user_iconImageBuilder();

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

class _$GLikedWorkNotificationFieldsData
    extends GLikedWorkNotificationFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final bool isAnonymous;
  @override
  final GLikedWorkNotificationFieldsData_work? work;
  @override
  final GLikedWorkNotificationFieldsData_user? user;

  factory _$GLikedWorkNotificationFieldsData(
          [void Function(GLikedWorkNotificationFieldsDataBuilder)? updates]) =>
      (new GLikedWorkNotificationFieldsDataBuilder()..update(updates))._build();

  _$GLikedWorkNotificationFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      required this.isAnonymous,
      this.work,
      this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GLikedWorkNotificationFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GLikedWorkNotificationFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GLikedWorkNotificationFieldsData', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        isAnonymous, r'GLikedWorkNotificationFieldsData', 'isAnonymous');
  }

  @override
  GLikedWorkNotificationFieldsData rebuild(
          void Function(GLikedWorkNotificationFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLikedWorkNotificationFieldsDataBuilder toBuilder() =>
      new GLikedWorkNotificationFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLikedWorkNotificationFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        isAnonymous == other.isAnonymous &&
        work == other.work &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, isAnonymous.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GLikedWorkNotificationFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('isAnonymous', isAnonymous)
          ..add('work', work)
          ..add('user', user))
        .toString();
  }
}

class GLikedWorkNotificationFieldsDataBuilder
    implements
        Builder<GLikedWorkNotificationFieldsData,
            GLikedWorkNotificationFieldsDataBuilder> {
  _$GLikedWorkNotificationFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  bool? _isAnonymous;
  bool? get isAnonymous => _$this._isAnonymous;
  set isAnonymous(bool? isAnonymous) => _$this._isAnonymous = isAnonymous;

  GLikedWorkNotificationFieldsData_workBuilder? _work;
  GLikedWorkNotificationFieldsData_workBuilder get work =>
      _$this._work ??= new GLikedWorkNotificationFieldsData_workBuilder();
  set work(GLikedWorkNotificationFieldsData_workBuilder? work) =>
      _$this._work = work;

  GLikedWorkNotificationFieldsData_userBuilder? _user;
  GLikedWorkNotificationFieldsData_userBuilder get user =>
      _$this._user ??= new GLikedWorkNotificationFieldsData_userBuilder();
  set user(GLikedWorkNotificationFieldsData_userBuilder? user) =>
      _$this._user = user;

  GLikedWorkNotificationFieldsDataBuilder() {
    GLikedWorkNotificationFieldsData._initializeBuilder(this);
  }

  GLikedWorkNotificationFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _isAnonymous = $v.isAnonymous;
      _work = $v.work?.toBuilder();
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLikedWorkNotificationFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLikedWorkNotificationFieldsData;
  }

  @override
  void update(void Function(GLikedWorkNotificationFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLikedWorkNotificationFieldsData build() => _build();

  _$GLikedWorkNotificationFieldsData _build() {
    _$GLikedWorkNotificationFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GLikedWorkNotificationFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GLikedWorkNotificationFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GLikedWorkNotificationFieldsData', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GLikedWorkNotificationFieldsData', 'createdAt'),
              isAnonymous: BuiltValueNullFieldError.checkNotNull(isAnonymous,
                  r'GLikedWorkNotificationFieldsData', 'isAnonymous'),
              work: _work?.build(),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        _work?.build();
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GLikedWorkNotificationFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLikedWorkNotificationFieldsData_work
    extends GLikedWorkNotificationFieldsData_work {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final int likesCount;
  @override
  final int commentsCount;
  @override
  final int createdAt;
  @override
  final GLikedWorkNotificationFieldsData_work_thumbnailImage? thumbnailImage;

  factory _$GLikedWorkNotificationFieldsData_work(
          [void Function(GLikedWorkNotificationFieldsData_workBuilder)?
              updates]) =>
      (new GLikedWorkNotificationFieldsData_workBuilder()..update(updates))
          ._build();

  _$GLikedWorkNotificationFieldsData_work._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GLikedWorkNotificationFieldsData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GLikedWorkNotificationFieldsData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GLikedWorkNotificationFieldsData_work', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GLikedWorkNotificationFieldsData_work', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GLikedWorkNotificationFieldsData_work', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GLikedWorkNotificationFieldsData_work', 'createdAt');
  }

  @override
  GLikedWorkNotificationFieldsData_work rebuild(
          void Function(GLikedWorkNotificationFieldsData_workBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLikedWorkNotificationFieldsData_workBuilder toBuilder() =>
      new GLikedWorkNotificationFieldsData_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLikedWorkNotificationFieldsData_work &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, commentsCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GLikedWorkNotificationFieldsData_work')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GLikedWorkNotificationFieldsData_workBuilder
    implements
        Builder<GLikedWorkNotificationFieldsData_work,
            GLikedWorkNotificationFieldsData_workBuilder> {
  _$GLikedWorkNotificationFieldsData_work? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _commentsCount;
  int? get commentsCount => _$this._commentsCount;
  set commentsCount(int? commentsCount) =>
      _$this._commentsCount = commentsCount;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder? _thumbnailImage;
  GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder();
  set thumbnailImage(
          GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GLikedWorkNotificationFieldsData_workBuilder() {
    GLikedWorkNotificationFieldsData_work._initializeBuilder(this);
  }

  GLikedWorkNotificationFieldsData_workBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLikedWorkNotificationFieldsData_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLikedWorkNotificationFieldsData_work;
  }

  @override
  void update(
      void Function(GLikedWorkNotificationFieldsData_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLikedWorkNotificationFieldsData_work build() => _build();

  _$GLikedWorkNotificationFieldsData_work _build() {
    _$GLikedWorkNotificationFieldsData_work _$result;
    try {
      _$result = _$v ??
          new _$GLikedWorkNotificationFieldsData_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GLikedWorkNotificationFieldsData_work', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GLikedWorkNotificationFieldsData_work', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GLikedWorkNotificationFieldsData_work', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GLikedWorkNotificationFieldsData_work', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount,
                  r'GLikedWorkNotificationFieldsData_work',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GLikedWorkNotificationFieldsData_work', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GLikedWorkNotificationFieldsData_work',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLikedWorkNotificationFieldsData_work_thumbnailImage
    extends GLikedWorkNotificationFieldsData_work_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GLikedWorkNotificationFieldsData_work_thumbnailImage(
          [void Function(
                  GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder)?
              updates]) =>
      (new GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GLikedWorkNotificationFieldsData_work_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GLikedWorkNotificationFieldsData_work_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GLikedWorkNotificationFieldsData_work_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GLikedWorkNotificationFieldsData_work_thumbnailImage', 'downloadURL');
  }

  @override
  GLikedWorkNotificationFieldsData_work_thumbnailImage rebuild(
          void Function(
                  GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder toBuilder() =>
      new GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLikedWorkNotificationFieldsData_work_thumbnailImage &&
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
            r'GLikedWorkNotificationFieldsData_work_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder
    implements
        Builder<GLikedWorkNotificationFieldsData_work_thumbnailImage,
            GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder> {
  _$GLikedWorkNotificationFieldsData_work_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder() {
    GLikedWorkNotificationFieldsData_work_thumbnailImage._initializeBuilder(
        this);
  }

  GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder get _$this {
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
  void replace(GLikedWorkNotificationFieldsData_work_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLikedWorkNotificationFieldsData_work_thumbnailImage;
  }

  @override
  void update(
      void Function(
              GLikedWorkNotificationFieldsData_work_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GLikedWorkNotificationFieldsData_work_thumbnailImage build() => _build();

  _$GLikedWorkNotificationFieldsData_work_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GLikedWorkNotificationFieldsData_work_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GLikedWorkNotificationFieldsData_work_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GLikedWorkNotificationFieldsData_work_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GLikedWorkNotificationFieldsData_work_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GLikedWorkNotificationFieldsData_user
    extends GLikedWorkNotificationFieldsData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GLikedWorkNotificationFieldsData_user_iconImage? iconImage;

  factory _$GLikedWorkNotificationFieldsData_user(
          [void Function(GLikedWorkNotificationFieldsData_userBuilder)?
              updates]) =>
      (new GLikedWorkNotificationFieldsData_userBuilder()..update(updates))
          ._build();

  _$GLikedWorkNotificationFieldsData_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GLikedWorkNotificationFieldsData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GLikedWorkNotificationFieldsData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GLikedWorkNotificationFieldsData_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GLikedWorkNotificationFieldsData_user', 'name');
  }

  @override
  GLikedWorkNotificationFieldsData_user rebuild(
          void Function(GLikedWorkNotificationFieldsData_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLikedWorkNotificationFieldsData_userBuilder toBuilder() =>
      new GLikedWorkNotificationFieldsData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLikedWorkNotificationFieldsData_user &&
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
    return (newBuiltValueToStringHelper(
            r'GLikedWorkNotificationFieldsData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GLikedWorkNotificationFieldsData_userBuilder
    implements
        Builder<GLikedWorkNotificationFieldsData_user,
            GLikedWorkNotificationFieldsData_userBuilder> {
  _$GLikedWorkNotificationFieldsData_user? _$v;

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

  GLikedWorkNotificationFieldsData_user_iconImageBuilder? _iconImage;
  GLikedWorkNotificationFieldsData_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GLikedWorkNotificationFieldsData_user_iconImageBuilder();
  set iconImage(
          GLikedWorkNotificationFieldsData_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GLikedWorkNotificationFieldsData_userBuilder() {
    GLikedWorkNotificationFieldsData_user._initializeBuilder(this);
  }

  GLikedWorkNotificationFieldsData_userBuilder get _$this {
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
  void replace(GLikedWorkNotificationFieldsData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLikedWorkNotificationFieldsData_user;
  }

  @override
  void update(
      void Function(GLikedWorkNotificationFieldsData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLikedWorkNotificationFieldsData_user build() => _build();

  _$GLikedWorkNotificationFieldsData_user _build() {
    _$GLikedWorkNotificationFieldsData_user _$result;
    try {
      _$result = _$v ??
          new _$GLikedWorkNotificationFieldsData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GLikedWorkNotificationFieldsData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GLikedWorkNotificationFieldsData_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GLikedWorkNotificationFieldsData_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GLikedWorkNotificationFieldsData_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GLikedWorkNotificationFieldsData_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLikedWorkNotificationFieldsData_user_iconImage
    extends GLikedWorkNotificationFieldsData_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GLikedWorkNotificationFieldsData_user_iconImage(
          [void Function(
                  GLikedWorkNotificationFieldsData_user_iconImageBuilder)?
              updates]) =>
      (new GLikedWorkNotificationFieldsData_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GLikedWorkNotificationFieldsData_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GLikedWorkNotificationFieldsData_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GLikedWorkNotificationFieldsData_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GLikedWorkNotificationFieldsData_user_iconImage', 'downloadURL');
  }

  @override
  GLikedWorkNotificationFieldsData_user_iconImage rebuild(
          void Function(GLikedWorkNotificationFieldsData_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLikedWorkNotificationFieldsData_user_iconImageBuilder toBuilder() =>
      new GLikedWorkNotificationFieldsData_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLikedWorkNotificationFieldsData_user_iconImage &&
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
            r'GLikedWorkNotificationFieldsData_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GLikedWorkNotificationFieldsData_user_iconImageBuilder
    implements
        Builder<GLikedWorkNotificationFieldsData_user_iconImage,
            GLikedWorkNotificationFieldsData_user_iconImageBuilder> {
  _$GLikedWorkNotificationFieldsData_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GLikedWorkNotificationFieldsData_user_iconImageBuilder() {
    GLikedWorkNotificationFieldsData_user_iconImage._initializeBuilder(this);
  }

  GLikedWorkNotificationFieldsData_user_iconImageBuilder get _$this {
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
  void replace(GLikedWorkNotificationFieldsData_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLikedWorkNotificationFieldsData_user_iconImage;
  }

  @override
  void update(
      void Function(GLikedWorkNotificationFieldsData_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GLikedWorkNotificationFieldsData_user_iconImage build() => _build();

  _$GLikedWorkNotificationFieldsData_user_iconImage _build() {
    final _$result = _$v ??
        new _$GLikedWorkNotificationFieldsData_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GLikedWorkNotificationFieldsData_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GLikedWorkNotificationFieldsData_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GLikedWorkNotificationFieldsData_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
