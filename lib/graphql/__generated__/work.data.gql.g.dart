// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkData> _$gWorkDataSerializer = new _$GWorkDataSerializer();
Serializer<GWorkData_work> _$gWorkDataWorkSerializer =
    new _$GWorkData_workSerializer();
Serializer<GWorkData_work_user> _$gWorkDataWorkUserSerializer =
    new _$GWorkData_work_userSerializer();
Serializer<GWorkData_work_user_iconImage>
    _$gWorkDataWorkUserIconImageSerializer =
    new _$GWorkData_work_user_iconImageSerializer();
Serializer<GWorkData_work_subWorks> _$gWorkDataWorkSubWorksSerializer =
    new _$GWorkData_work_subWorksSerializer();
Serializer<GWorkData_work_subWorks_image>
    _$gWorkDataWorkSubWorksImageSerializer =
    new _$GWorkData_work_subWorks_imageSerializer();
Serializer<GWorkData_work_subWorks_thumbnailImage>
    _$gWorkDataWorkSubWorksThumbnailImageSerializer =
    new _$GWorkData_work_subWorks_thumbnailImageSerializer();

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
      'isDeleted',
      serializers.serialize(object.isDeleted,
          specifiedType: const FullType(bool)),
      'imageURL',
      serializers.serialize(object.imageURL,
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
      'subWorks',
      serializers.serialize(object.subWorks,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GWorkData_work_subWorks)])),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
        case 'subWorks':
          result.subWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GWorkData_work_subWorks)
              ]))! as BuiltList<Object?>);
          break;
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
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

class _$GWorkData_work_subWorksSerializer
    implements StructuredSerializer<GWorkData_work_subWorks> {
  @override
  final Iterable<Type> types = const [
    GWorkData_work_subWorks,
    _$GWorkData_work_subWorks
  ];
  @override
  final String wireName = 'GWorkData_work_subWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkData_work_subWorks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(GWorkData_work_subWorks_image)),
      'thumbnailImage',
      serializers.serialize(object.thumbnailImage,
          specifiedType:
              const FullType(GWorkData_work_subWorks_thumbnailImage)),
    ];

    return result;
  }

  @override
  GWorkData_work_subWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkData_work_subWorksBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GWorkData_work_subWorks_image))!
              as GWorkData_work_subWorks_image);
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkData_work_subWorks_thumbnailImage))!
              as GWorkData_work_subWorks_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkData_work_subWorks_imageSerializer
    implements StructuredSerializer<GWorkData_work_subWorks_image> {
  @override
  final Iterable<Type> types = const [
    GWorkData_work_subWorks_image,
    _$GWorkData_work_subWorks_image
  ];
  @override
  final String wireName = 'GWorkData_work_subWorks_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkData_work_subWorks_image object,
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
  GWorkData_work_subWorks_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkData_work_subWorks_imageBuilder();

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

class _$GWorkData_work_subWorks_thumbnailImageSerializer
    implements StructuredSerializer<GWorkData_work_subWorks_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GWorkData_work_subWorks_thumbnailImage,
    _$GWorkData_work_subWorks_thumbnailImage
  ];
  @override
  final String wireName = 'GWorkData_work_subWorks_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkData_work_subWorks_thumbnailImage object,
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
  GWorkData_work_subWorks_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkData_work_subWorks_thumbnailImageBuilder();

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
  final bool isDeleted;
  @override
  final String imageURL;
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
  final BuiltList<GWorkData_work_subWorks> subWorks;
  @override
  final bool isLiked;

  factory _$GWorkData_work([void Function(GWorkData_workBuilder)? updates]) =>
      (new GWorkData_workBuilder()..update(updates))._build();

  _$GWorkData_work._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.description,
      required this.isDeleted,
      required this.imageURL,
      required this.user,
      required this.tagNames,
      required this.createdAt,
      required this.likesCount,
      required this.viewsCount,
      required this.subWorks,
      required this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'GWorkData_work', 'title');
    BuiltValueNullFieldError.checkNotNull(
        isDeleted, r'GWorkData_work', 'isDeleted');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GWorkData_work', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(user, r'GWorkData_work', 'user');
    BuiltValueNullFieldError.checkNotNull(
        tagNames, r'GWorkData_work', 'tagNames');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkData_work', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GWorkData_work', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GWorkData_work', 'viewsCount');
    BuiltValueNullFieldError.checkNotNull(
        subWorks, r'GWorkData_work', 'subWorks');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GWorkData_work', 'isLiked');
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
        isDeleted == other.isDeleted &&
        imageURL == other.imageURL &&
        user == other.user &&
        tagNames == other.tagNames &&
        createdAt == other.createdAt &&
        likesCount == other.likesCount &&
        viewsCount == other.viewsCount &&
        subWorks == other.subWorks &&
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jc(_$hash, imageURL.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, tagNames.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewsCount.hashCode);
    _$hash = $jc(_$hash, subWorks.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
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
          ..add('isDeleted', isDeleted)
          ..add('imageURL', imageURL)
          ..add('user', user)
          ..add('tagNames', tagNames)
          ..add('createdAt', createdAt)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('subWorks', subWorks)
          ..add('isLiked', isLiked))
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

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

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

  ListBuilder<GWorkData_work_subWorks>? _subWorks;
  ListBuilder<GWorkData_work_subWorks> get subWorks =>
      _$this._subWorks ??= new ListBuilder<GWorkData_work_subWorks>();
  set subWorks(ListBuilder<GWorkData_work_subWorks>? subWorks) =>
      _$this._subWorks = subWorks;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

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
      _isDeleted = $v.isDeleted;
      _imageURL = $v.imageURL;
      _user = $v.user.toBuilder();
      _tagNames = $v.tagNames.toBuilder();
      _createdAt = $v.createdAt;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _subWorks = $v.subWorks.toBuilder();
      _isLiked = $v.isLiked;
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
              isDeleted: BuiltValueNullFieldError.checkNotNull(
                  isDeleted, r'GWorkData_work', 'isDeleted'),
              imageURL: BuiltValueNullFieldError.checkNotNull(
                  imageURL, r'GWorkData_work', 'imageURL'),
              user: user.build(),
              tagNames: tagNames.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GWorkData_work', 'createdAt'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GWorkData_work', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GWorkData_work', 'viewsCount'),
              subWorks: subWorks.build(),
              isLiked: BuiltValueNullFieldError.checkNotNull(
                  isLiked, r'GWorkData_work', 'isLiked'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'tagNames';
        tagNames.build();

        _$failedField = 'subWorks';
        subWorks.build();
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
  @override
  final bool isFollower;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GWorkData_work_user(
          [void Function(GWorkData_work_userBuilder)? updates]) =>
      (new GWorkData_work_userBuilder()..update(updates))._build();

  _$GWorkData_work_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage,
      required this.isFollower,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkData_work_user', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GWorkData_work_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GWorkData_work_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        isFollower, r'GWorkData_work_user', 'isFollower');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GWorkData_work_user', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GWorkData_work_user', 'isMuted');
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
        iconImage == other.iconImage &&
        isFollower == other.isFollower &&
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
    _$hash = $jc(_$hash, isFollower.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
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
          ..add('iconImage', iconImage)
          ..add('isFollower', isFollower)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
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

  bool? _isFollower;
  bool? get isFollower => _$this._isFollower;
  set isFollower(bool? isFollower) => _$this._isFollower = isFollower;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

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
      _isFollower = $v.isFollower;
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
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
              iconImage: _iconImage?.build(),
              isFollower: BuiltValueNullFieldError.checkNotNull(
                  isFollower, r'GWorkData_work_user', 'isFollower'),
              isFollowee: BuiltValueNullFieldError.checkNotNull(
                  isFollowee, r'GWorkData_work_user', 'isFollowee'),
              isMuted: BuiltValueNullFieldError.checkNotNull(
                  isMuted, r'GWorkData_work_user', 'isMuted'));
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

class _$GWorkData_work_subWorks extends GWorkData_work_subWorks {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GWorkData_work_subWorks_image image;
  @override
  final GWorkData_work_subWorks_thumbnailImage thumbnailImage;

  factory _$GWorkData_work_subWorks(
          [void Function(GWorkData_work_subWorksBuilder)? updates]) =>
      (new GWorkData_work_subWorksBuilder()..update(updates))._build();

  _$GWorkData_work_subWorks._(
      {required this.G__typename,
      required this.id,
      required this.image,
      required this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work_subWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkData_work_subWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        image, r'GWorkData_work_subWorks', 'image');
    BuiltValueNullFieldError.checkNotNull(
        thumbnailImage, r'GWorkData_work_subWorks', 'thumbnailImage');
  }

  @override
  GWorkData_work_subWorks rebuild(
          void Function(GWorkData_work_subWorksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkData_work_subWorksBuilder toBuilder() =>
      new GWorkData_work_subWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData_work_subWorks &&
        G__typename == other.G__typename &&
        id == other.id &&
        image == other.image &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkData_work_subWorks')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('image', image)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GWorkData_work_subWorksBuilder
    implements
        Builder<GWorkData_work_subWorks, GWorkData_work_subWorksBuilder> {
  _$GWorkData_work_subWorks? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GWorkData_work_subWorks_imageBuilder? _image;
  GWorkData_work_subWorks_imageBuilder get image =>
      _$this._image ??= new GWorkData_work_subWorks_imageBuilder();
  set image(GWorkData_work_subWorks_imageBuilder? image) =>
      _$this._image = image;

  GWorkData_work_subWorks_thumbnailImageBuilder? _thumbnailImage;
  GWorkData_work_subWorks_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GWorkData_work_subWorks_thumbnailImageBuilder();
  set thumbnailImage(
          GWorkData_work_subWorks_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GWorkData_work_subWorksBuilder() {
    GWorkData_work_subWorks._initializeBuilder(this);
  }

  GWorkData_work_subWorksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _image = $v.image.toBuilder();
      _thumbnailImage = $v.thumbnailImage.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkData_work_subWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData_work_subWorks;
  }

  @override
  void update(void Function(GWorkData_work_subWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData_work_subWorks build() => _build();

  _$GWorkData_work_subWorks _build() {
    _$GWorkData_work_subWorks _$result;
    try {
      _$result = _$v ??
          new _$GWorkData_work_subWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkData_work_subWorks', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkData_work_subWorks', 'id'),
              image: image.build(),
              thumbnailImage: thumbnailImage.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        image.build();
        _$failedField = 'thumbnailImage';
        thumbnailImage.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkData_work_subWorks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkData_work_subWorks_image extends GWorkData_work_subWorks_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkData_work_subWorks_image(
          [void Function(GWorkData_work_subWorks_imageBuilder)? updates]) =>
      (new GWorkData_work_subWorks_imageBuilder()..update(updates))._build();

  _$GWorkData_work_subWorks_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work_subWorks_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkData_work_subWorks_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GWorkData_work_subWorks_image', 'downloadURL');
  }

  @override
  GWorkData_work_subWorks_image rebuild(
          void Function(GWorkData_work_subWorks_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkData_work_subWorks_imageBuilder toBuilder() =>
      new GWorkData_work_subWorks_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData_work_subWorks_image &&
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
    return (newBuiltValueToStringHelper(r'GWorkData_work_subWorks_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkData_work_subWorks_imageBuilder
    implements
        Builder<GWorkData_work_subWorks_image,
            GWorkData_work_subWorks_imageBuilder> {
  _$GWorkData_work_subWorks_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkData_work_subWorks_imageBuilder() {
    GWorkData_work_subWorks_image._initializeBuilder(this);
  }

  GWorkData_work_subWorks_imageBuilder get _$this {
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
  void replace(GWorkData_work_subWorks_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData_work_subWorks_image;
  }

  @override
  void update(void Function(GWorkData_work_subWorks_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData_work_subWorks_image build() => _build();

  _$GWorkData_work_subWorks_image _build() {
    final _$result = _$v ??
        new _$GWorkData_work_subWorks_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkData_work_subWorks_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkData_work_subWorks_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GWorkData_work_subWorks_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkData_work_subWorks_thumbnailImage
    extends GWorkData_work_subWorks_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkData_work_subWorks_thumbnailImage(
          [void Function(GWorkData_work_subWorks_thumbnailImageBuilder)?
              updates]) =>
      (new GWorkData_work_subWorks_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GWorkData_work_subWorks_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkData_work_subWorks_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkData_work_subWorks_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GWorkData_work_subWorks_thumbnailImage', 'downloadURL');
  }

  @override
  GWorkData_work_subWorks_thumbnailImage rebuild(
          void Function(GWorkData_work_subWorks_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkData_work_subWorks_thumbnailImageBuilder toBuilder() =>
      new GWorkData_work_subWorks_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkData_work_subWorks_thumbnailImage &&
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
            r'GWorkData_work_subWorks_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkData_work_subWorks_thumbnailImageBuilder
    implements
        Builder<GWorkData_work_subWorks_thumbnailImage,
            GWorkData_work_subWorks_thumbnailImageBuilder> {
  _$GWorkData_work_subWorks_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkData_work_subWorks_thumbnailImageBuilder() {
    GWorkData_work_subWorks_thumbnailImage._initializeBuilder(this);
  }

  GWorkData_work_subWorks_thumbnailImageBuilder get _$this {
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
  void replace(GWorkData_work_subWorks_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkData_work_subWorks_thumbnailImage;
  }

  @override
  void update(
      void Function(GWorkData_work_subWorks_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkData_work_subWorks_thumbnailImage build() => _build();

  _$GWorkData_work_subWorks_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GWorkData_work_subWorks_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GWorkData_work_subWorks_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkData_work_subWorks_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GWorkData_work_subWorks_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
