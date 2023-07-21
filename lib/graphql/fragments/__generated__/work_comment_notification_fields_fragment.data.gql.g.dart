// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment_notification_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentNotificationFieldsData>
    _$gWorkCommentNotificationFieldsDataSerializer =
    new _$GWorkCommentNotificationFieldsDataSerializer();
Serializer<GWorkCommentNotificationFieldsData_work>
    _$gWorkCommentNotificationFieldsDataWorkSerializer =
    new _$GWorkCommentNotificationFieldsData_workSerializer();
Serializer<GWorkCommentNotificationFieldsData_work_thumbnailImage>
    _$gWorkCommentNotificationFieldsDataWorkThumbnailImageSerializer =
    new _$GWorkCommentNotificationFieldsData_work_thumbnailImageSerializer();
Serializer<GWorkCommentNotificationFieldsData_user>
    _$gWorkCommentNotificationFieldsDataUserSerializer =
    new _$GWorkCommentNotificationFieldsData_userSerializer();
Serializer<GWorkCommentNotificationFieldsData_user_iconImage>
    _$gWorkCommentNotificationFieldsDataUserIconImageSerializer =
    new _$GWorkCommentNotificationFieldsData_user_iconImageSerializer();
Serializer<GWorkCommentNotificationFieldsData_sticker>
    _$gWorkCommentNotificationFieldsDataStickerSerializer =
    new _$GWorkCommentNotificationFieldsData_stickerSerializer();
Serializer<GWorkCommentNotificationFieldsData_sticker_image>
    _$gWorkCommentNotificationFieldsDataStickerImageSerializer =
    new _$GWorkCommentNotificationFieldsData_sticker_imageSerializer();

class _$GWorkCommentNotificationFieldsDataSerializer
    implements StructuredSerializer<GWorkCommentNotificationFieldsData> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsData,
    _$GWorkCommentNotificationFieldsData
  ];
  @override
  final String wireName = 'GWorkCommentNotificationFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentNotificationFieldsData object,
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
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.work;
    if (value != null) {
      result
        ..add('work')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkCommentNotificationFieldsData_work)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkCommentNotificationFieldsData_user)));
    }
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkCommentNotificationFieldsData_sticker)));
    }
    return result;
  }

  @override
  GWorkCommentNotificationFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentNotificationFieldsDataBuilder();

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
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkCommentNotificationFieldsData_work))!
              as GWorkCommentNotificationFieldsData_work);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkCommentNotificationFieldsData_user))!
              as GWorkCommentNotificationFieldsData_user);
          break;
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentNotificationFieldsData_sticker))!
              as GWorkCommentNotificationFieldsData_sticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentNotificationFieldsData_workSerializer
    implements StructuredSerializer<GWorkCommentNotificationFieldsData_work> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsData_work,
    _$GWorkCommentNotificationFieldsData_work
  ];
  @override
  final String wireName = 'GWorkCommentNotificationFieldsData_work';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentNotificationFieldsData_work object,
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
                GWorkCommentNotificationFieldsData_work_thumbnailImage)));
    }
    return result;
  }

  @override
  GWorkCommentNotificationFieldsData_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentNotificationFieldsData_workBuilder();

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
                      GWorkCommentNotificationFieldsData_work_thumbnailImage))!
              as GWorkCommentNotificationFieldsData_work_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentNotificationFieldsData_work_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GWorkCommentNotificationFieldsData_work_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsData_work_thumbnailImage,
    _$GWorkCommentNotificationFieldsData_work_thumbnailImage
  ];
  @override
  final String wireName =
      'GWorkCommentNotificationFieldsData_work_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentNotificationFieldsData_work_thumbnailImage object,
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
  GWorkCommentNotificationFieldsData_work_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder();

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

class _$GWorkCommentNotificationFieldsData_userSerializer
    implements StructuredSerializer<GWorkCommentNotificationFieldsData_user> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsData_user,
    _$GWorkCommentNotificationFieldsData_user
  ];
  @override
  final String wireName = 'GWorkCommentNotificationFieldsData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentNotificationFieldsData_user object,
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
                GWorkCommentNotificationFieldsData_user_iconImage)));
    }
    return result;
  }

  @override
  GWorkCommentNotificationFieldsData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentNotificationFieldsData_userBuilder();

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
                      GWorkCommentNotificationFieldsData_user_iconImage))!
              as GWorkCommentNotificationFieldsData_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentNotificationFieldsData_user_iconImageSerializer
    implements
        StructuredSerializer<
            GWorkCommentNotificationFieldsData_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsData_user_iconImage,
    _$GWorkCommentNotificationFieldsData_user_iconImage
  ];
  @override
  final String wireName = 'GWorkCommentNotificationFieldsData_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentNotificationFieldsData_user_iconImage object,
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
  GWorkCommentNotificationFieldsData_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentNotificationFieldsData_user_iconImageBuilder();

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

class _$GWorkCommentNotificationFieldsData_stickerSerializer
    implements
        StructuredSerializer<GWorkCommentNotificationFieldsData_sticker> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsData_sticker,
    _$GWorkCommentNotificationFieldsData_sticker
  ];
  @override
  final String wireName = 'GWorkCommentNotificationFieldsData_sticker';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentNotificationFieldsData_sticker object,
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
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentNotificationFieldsData_sticker_image)));
    }
    return result;
  }

  @override
  GWorkCommentNotificationFieldsData_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentNotificationFieldsData_stickerBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentNotificationFieldsData_sticker_image))!
              as GWorkCommentNotificationFieldsData_sticker_image);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentNotificationFieldsData_sticker_imageSerializer
    implements
        StructuredSerializer<GWorkCommentNotificationFieldsData_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsData_sticker_image,
    _$GWorkCommentNotificationFieldsData_sticker_image
  ];
  @override
  final String wireName = 'GWorkCommentNotificationFieldsData_sticker_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentNotificationFieldsData_sticker_image object,
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
  GWorkCommentNotificationFieldsData_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentNotificationFieldsData_sticker_imageBuilder();

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

class _$GWorkCommentNotificationFieldsData
    extends GWorkCommentNotificationFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String? message;
  @override
  final GWorkCommentNotificationFieldsData_work? work;
  @override
  final GWorkCommentNotificationFieldsData_user? user;
  @override
  final GWorkCommentNotificationFieldsData_sticker? sticker;

  factory _$GWorkCommentNotificationFieldsData(
          [void Function(GWorkCommentNotificationFieldsDataBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsDataBuilder()..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      this.message,
      this.work,
      this.user,
      this.sticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentNotificationFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentNotificationFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkCommentNotificationFieldsData', 'createdAt');
  }

  @override
  GWorkCommentNotificationFieldsData rebuild(
          void Function(GWorkCommentNotificationFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsDataBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        message == other.message &&
        work == other.work &&
        user == other.user &&
        sticker == other.sticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, sticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentNotificationFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('message', message)
          ..add('work', work)
          ..add('user', user)
          ..add('sticker', sticker))
        .toString();
  }
}

class GWorkCommentNotificationFieldsDataBuilder
    implements
        Builder<GWorkCommentNotificationFieldsData,
            GWorkCommentNotificationFieldsDataBuilder> {
  _$GWorkCommentNotificationFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  GWorkCommentNotificationFieldsData_workBuilder? _work;
  GWorkCommentNotificationFieldsData_workBuilder get work =>
      _$this._work ??= new GWorkCommentNotificationFieldsData_workBuilder();
  set work(GWorkCommentNotificationFieldsData_workBuilder? work) =>
      _$this._work = work;

  GWorkCommentNotificationFieldsData_userBuilder? _user;
  GWorkCommentNotificationFieldsData_userBuilder get user =>
      _$this._user ??= new GWorkCommentNotificationFieldsData_userBuilder();
  set user(GWorkCommentNotificationFieldsData_userBuilder? user) =>
      _$this._user = user;

  GWorkCommentNotificationFieldsData_stickerBuilder? _sticker;
  GWorkCommentNotificationFieldsData_stickerBuilder get sticker =>
      _$this._sticker ??=
          new GWorkCommentNotificationFieldsData_stickerBuilder();
  set sticker(GWorkCommentNotificationFieldsData_stickerBuilder? sticker) =>
      _$this._sticker = sticker;

  GWorkCommentNotificationFieldsDataBuilder() {
    GWorkCommentNotificationFieldsData._initializeBuilder(this);
  }

  GWorkCommentNotificationFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _message = $v.message;
      _work = $v.work?.toBuilder();
      _user = $v.user?.toBuilder();
      _sticker = $v.sticker?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentNotificationFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsData;
  }

  @override
  void update(
      void Function(GWorkCommentNotificationFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsData build() => _build();

  _$GWorkCommentNotificationFieldsData _build() {
    _$GWorkCommentNotificationFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentNotificationFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentNotificationFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentNotificationFieldsData', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(createdAt,
                  r'GWorkCommentNotificationFieldsData', 'createdAt'),
              message: message,
              work: _work?.build(),
              user: _user?.build(),
              sticker: _sticker?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        _work?.build();
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'sticker';
        _sticker?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentNotificationFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentNotificationFieldsData_work
    extends GWorkCommentNotificationFieldsData_work {
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
  final GWorkCommentNotificationFieldsData_work_thumbnailImage? thumbnailImage;

  factory _$GWorkCommentNotificationFieldsData_work(
          [void Function(GWorkCommentNotificationFieldsData_workBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsData_workBuilder()..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsData_work._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentNotificationFieldsData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentNotificationFieldsData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkCommentNotificationFieldsData_work', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GWorkCommentNotificationFieldsData_work', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GWorkCommentNotificationFieldsData_work', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkCommentNotificationFieldsData_work', 'createdAt');
  }

  @override
  GWorkCommentNotificationFieldsData_work rebuild(
          void Function(GWorkCommentNotificationFieldsData_workBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsData_workBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsData_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsData_work &&
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
            r'GWorkCommentNotificationFieldsData_work')
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

class GWorkCommentNotificationFieldsData_workBuilder
    implements
        Builder<GWorkCommentNotificationFieldsData_work,
            GWorkCommentNotificationFieldsData_workBuilder> {
  _$GWorkCommentNotificationFieldsData_work? _$v;

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

  GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder?
      _thumbnailImage;
  GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder();
  set thumbnailImage(
          GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GWorkCommentNotificationFieldsData_workBuilder() {
    GWorkCommentNotificationFieldsData_work._initializeBuilder(this);
  }

  GWorkCommentNotificationFieldsData_workBuilder get _$this {
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
  void replace(GWorkCommentNotificationFieldsData_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsData_work;
  }

  @override
  void update(
      void Function(GWorkCommentNotificationFieldsData_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsData_work build() => _build();

  _$GWorkCommentNotificationFieldsData_work _build() {
    _$GWorkCommentNotificationFieldsData_work _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentNotificationFieldsData_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentNotificationFieldsData_work', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentNotificationFieldsData_work', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GWorkCommentNotificationFieldsData_work', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GWorkCommentNotificationFieldsData_work', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount,
                  r'GWorkCommentNotificationFieldsData_work',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GWorkCommentNotificationFieldsData_work', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentNotificationFieldsData_work',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentNotificationFieldsData_work_thumbnailImage
    extends GWorkCommentNotificationFieldsData_work_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentNotificationFieldsData_work_thumbnailImage(
          [void Function(
                  GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsData_work_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentNotificationFieldsData_work_thumbnailImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentNotificationFieldsData_work_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentNotificationFieldsData_work_thumbnailImage',
        'downloadURL');
  }

  @override
  GWorkCommentNotificationFieldsData_work_thumbnailImage rebuild(
          void Function(
                  GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsData_work_thumbnailImage &&
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
            r'GWorkCommentNotificationFieldsData_work_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder
    implements
        Builder<GWorkCommentNotificationFieldsData_work_thumbnailImage,
            GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder> {
  _$GWorkCommentNotificationFieldsData_work_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder() {
    GWorkCommentNotificationFieldsData_work_thumbnailImage._initializeBuilder(
        this);
  }

  GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder get _$this {
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
  void replace(GWorkCommentNotificationFieldsData_work_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsData_work_thumbnailImage;
  }

  @override
  void update(
      void Function(
              GWorkCommentNotificationFieldsData_work_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsData_work_thumbnailImage build() => _build();

  _$GWorkCommentNotificationFieldsData_work_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GWorkCommentNotificationFieldsData_work_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentNotificationFieldsData_work_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GWorkCommentNotificationFieldsData_work_thumbnailImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentNotificationFieldsData_work_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentNotificationFieldsData_user
    extends GWorkCommentNotificationFieldsData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GWorkCommentNotificationFieldsData_user_iconImage? iconImage;

  factory _$GWorkCommentNotificationFieldsData_user(
          [void Function(GWorkCommentNotificationFieldsData_userBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsData_userBuilder()..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsData_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentNotificationFieldsData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentNotificationFieldsData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GWorkCommentNotificationFieldsData_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GWorkCommentNotificationFieldsData_user', 'name');
  }

  @override
  GWorkCommentNotificationFieldsData_user rebuild(
          void Function(GWorkCommentNotificationFieldsData_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsData_userBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsData_user &&
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
            r'GWorkCommentNotificationFieldsData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GWorkCommentNotificationFieldsData_userBuilder
    implements
        Builder<GWorkCommentNotificationFieldsData_user,
            GWorkCommentNotificationFieldsData_userBuilder> {
  _$GWorkCommentNotificationFieldsData_user? _$v;

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

  GWorkCommentNotificationFieldsData_user_iconImageBuilder? _iconImage;
  GWorkCommentNotificationFieldsData_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GWorkCommentNotificationFieldsData_user_iconImageBuilder();
  set iconImage(
          GWorkCommentNotificationFieldsData_user_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GWorkCommentNotificationFieldsData_userBuilder() {
    GWorkCommentNotificationFieldsData_user._initializeBuilder(this);
  }

  GWorkCommentNotificationFieldsData_userBuilder get _$this {
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
  void replace(GWorkCommentNotificationFieldsData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsData_user;
  }

  @override
  void update(
      void Function(GWorkCommentNotificationFieldsData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsData_user build() => _build();

  _$GWorkCommentNotificationFieldsData_user _build() {
    _$GWorkCommentNotificationFieldsData_user _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentNotificationFieldsData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentNotificationFieldsData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentNotificationFieldsData_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GWorkCommentNotificationFieldsData_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GWorkCommentNotificationFieldsData_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentNotificationFieldsData_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentNotificationFieldsData_user_iconImage
    extends GWorkCommentNotificationFieldsData_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentNotificationFieldsData_user_iconImage(
          [void Function(
                  GWorkCommentNotificationFieldsData_user_iconImageBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsData_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsData_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentNotificationFieldsData_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentNotificationFieldsData_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GWorkCommentNotificationFieldsData_user_iconImage', 'downloadURL');
  }

  @override
  GWorkCommentNotificationFieldsData_user_iconImage rebuild(
          void Function(
                  GWorkCommentNotificationFieldsData_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsData_user_iconImageBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsData_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsData_user_iconImage &&
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
            r'GWorkCommentNotificationFieldsData_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentNotificationFieldsData_user_iconImageBuilder
    implements
        Builder<GWorkCommentNotificationFieldsData_user_iconImage,
            GWorkCommentNotificationFieldsData_user_iconImageBuilder> {
  _$GWorkCommentNotificationFieldsData_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentNotificationFieldsData_user_iconImageBuilder() {
    GWorkCommentNotificationFieldsData_user_iconImage._initializeBuilder(this);
  }

  GWorkCommentNotificationFieldsData_user_iconImageBuilder get _$this {
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
  void replace(GWorkCommentNotificationFieldsData_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsData_user_iconImage;
  }

  @override
  void update(
      void Function(GWorkCommentNotificationFieldsData_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsData_user_iconImage build() => _build();

  _$GWorkCommentNotificationFieldsData_user_iconImage _build() {
    final _$result = _$v ??
        new _$GWorkCommentNotificationFieldsData_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentNotificationFieldsData_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentNotificationFieldsData_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentNotificationFieldsData_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentNotificationFieldsData_sticker
    extends GWorkCommentNotificationFieldsData_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GWorkCommentNotificationFieldsData_sticker_image? image;

  factory _$GWorkCommentNotificationFieldsData_sticker(
          [void Function(GWorkCommentNotificationFieldsData_stickerBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsData_stickerBuilder()..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsData_sticker._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentNotificationFieldsData_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentNotificationFieldsData_sticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkCommentNotificationFieldsData_sticker', 'title');
  }

  @override
  GWorkCommentNotificationFieldsData_sticker rebuild(
          void Function(GWorkCommentNotificationFieldsData_stickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsData_stickerBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsData_stickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsData_sticker &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentNotificationFieldsData_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('image', image))
        .toString();
  }
}

class GWorkCommentNotificationFieldsData_stickerBuilder
    implements
        Builder<GWorkCommentNotificationFieldsData_sticker,
            GWorkCommentNotificationFieldsData_stickerBuilder> {
  _$GWorkCommentNotificationFieldsData_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GWorkCommentNotificationFieldsData_sticker_imageBuilder? _image;
  GWorkCommentNotificationFieldsData_sticker_imageBuilder get image =>
      _$this._image ??=
          new GWorkCommentNotificationFieldsData_sticker_imageBuilder();
  set image(GWorkCommentNotificationFieldsData_sticker_imageBuilder? image) =>
      _$this._image = image;

  GWorkCommentNotificationFieldsData_stickerBuilder() {
    GWorkCommentNotificationFieldsData_sticker._initializeBuilder(this);
  }

  GWorkCommentNotificationFieldsData_stickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _image = $v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentNotificationFieldsData_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsData_sticker;
  }

  @override
  void update(
      void Function(GWorkCommentNotificationFieldsData_stickerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsData_sticker build() => _build();

  _$GWorkCommentNotificationFieldsData_sticker _build() {
    _$GWorkCommentNotificationFieldsData_sticker _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentNotificationFieldsData_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentNotificationFieldsData_sticker', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentNotificationFieldsData_sticker', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(title,
                  r'GWorkCommentNotificationFieldsData_sticker', 'title'),
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentNotificationFieldsData_sticker',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentNotificationFieldsData_sticker_image
    extends GWorkCommentNotificationFieldsData_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentNotificationFieldsData_sticker_image(
          [void Function(
                  GWorkCommentNotificationFieldsData_sticker_imageBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsData_sticker_imageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsData_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentNotificationFieldsData_sticker_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentNotificationFieldsData_sticker_image', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GWorkCommentNotificationFieldsData_sticker_image', 'downloadURL');
  }

  @override
  GWorkCommentNotificationFieldsData_sticker_image rebuild(
          void Function(GWorkCommentNotificationFieldsData_sticker_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsData_sticker_imageBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsData_sticker_imageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsData_sticker_image &&
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
            r'GWorkCommentNotificationFieldsData_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentNotificationFieldsData_sticker_imageBuilder
    implements
        Builder<GWorkCommentNotificationFieldsData_sticker_image,
            GWorkCommentNotificationFieldsData_sticker_imageBuilder> {
  _$GWorkCommentNotificationFieldsData_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentNotificationFieldsData_sticker_imageBuilder() {
    GWorkCommentNotificationFieldsData_sticker_image._initializeBuilder(this);
  }

  GWorkCommentNotificationFieldsData_sticker_imageBuilder get _$this {
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
  void replace(GWorkCommentNotificationFieldsData_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsData_sticker_image;
  }

  @override
  void update(
      void Function(GWorkCommentNotificationFieldsData_sticker_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsData_sticker_image build() => _build();

  _$GWorkCommentNotificationFieldsData_sticker_image _build() {
    final _$result = _$v ??
        new _$GWorkCommentNotificationFieldsData_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentNotificationFieldsData_sticker_image',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentNotificationFieldsData_sticker_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentNotificationFieldsData_sticker_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
