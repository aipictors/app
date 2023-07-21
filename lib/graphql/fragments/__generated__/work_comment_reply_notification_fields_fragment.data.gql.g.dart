// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment_reply_notification_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentReplyNotificationFieldsData>
    _$gWorkCommentReplyNotificationFieldsDataSerializer =
    new _$GWorkCommentReplyNotificationFieldsDataSerializer();
Serializer<GWorkCommentReplyNotificationFieldsData_work>
    _$gWorkCommentReplyNotificationFieldsDataWorkSerializer =
    new _$GWorkCommentReplyNotificationFieldsData_workSerializer();
Serializer<GWorkCommentReplyNotificationFieldsData_work_thumbnailImage>
    _$gWorkCommentReplyNotificationFieldsDataWorkThumbnailImageSerializer =
    new _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImageSerializer();
Serializer<GWorkCommentReplyNotificationFieldsData_user>
    _$gWorkCommentReplyNotificationFieldsDataUserSerializer =
    new _$GWorkCommentReplyNotificationFieldsData_userSerializer();
Serializer<GWorkCommentReplyNotificationFieldsData_user_iconImage>
    _$gWorkCommentReplyNotificationFieldsDataUserIconImageSerializer =
    new _$GWorkCommentReplyNotificationFieldsData_user_iconImageSerializer();
Serializer<GWorkCommentReplyNotificationFieldsData_sticker>
    _$gWorkCommentReplyNotificationFieldsDataStickerSerializer =
    new _$GWorkCommentReplyNotificationFieldsData_stickerSerializer();
Serializer<GWorkCommentReplyNotificationFieldsData_sticker_image>
    _$gWorkCommentReplyNotificationFieldsDataStickerImageSerializer =
    new _$GWorkCommentReplyNotificationFieldsData_sticker_imageSerializer();

class _$GWorkCommentReplyNotificationFieldsDataSerializer
    implements StructuredSerializer<GWorkCommentReplyNotificationFieldsData> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentReplyNotificationFieldsData,
    _$GWorkCommentReplyNotificationFieldsData
  ];
  @override
  final String wireName = 'GWorkCommentReplyNotificationFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentReplyNotificationFieldsData object,
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
                const FullType(GWorkCommentReplyNotificationFieldsData_work)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkCommentReplyNotificationFieldsData_user)));
    }
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentReplyNotificationFieldsData_sticker)));
    }
    return result;
  }

  @override
  GWorkCommentReplyNotificationFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentReplyNotificationFieldsDataBuilder();

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
                  specifiedType: const FullType(
                      GWorkCommentReplyNotificationFieldsData_work))!
              as GWorkCommentReplyNotificationFieldsData_work);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentReplyNotificationFieldsData_user))!
              as GWorkCommentReplyNotificationFieldsData_user);
          break;
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentReplyNotificationFieldsData_sticker))!
              as GWorkCommentReplyNotificationFieldsData_sticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentReplyNotificationFieldsData_workSerializer
    implements
        StructuredSerializer<GWorkCommentReplyNotificationFieldsData_work> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentReplyNotificationFieldsData_work,
    _$GWorkCommentReplyNotificationFieldsData_work
  ];
  @override
  final String wireName = 'GWorkCommentReplyNotificationFieldsData_work';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentReplyNotificationFieldsData_work object,
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
                GWorkCommentReplyNotificationFieldsData_work_thumbnailImage)));
    }
    return result;
  }

  @override
  GWorkCommentReplyNotificationFieldsData_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentReplyNotificationFieldsData_workBuilder();

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
                      GWorkCommentReplyNotificationFieldsData_work_thumbnailImage))!
              as GWorkCommentReplyNotificationFieldsData_work_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GWorkCommentReplyNotificationFieldsData_work_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentReplyNotificationFieldsData_work_thumbnailImage,
    _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage
  ];
  @override
  final String wireName =
      'GWorkCommentReplyNotificationFieldsData_work_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentReplyNotificationFieldsData_work_thumbnailImage object,
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
  GWorkCommentReplyNotificationFieldsData_work_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder();

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

class _$GWorkCommentReplyNotificationFieldsData_userSerializer
    implements
        StructuredSerializer<GWorkCommentReplyNotificationFieldsData_user> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentReplyNotificationFieldsData_user,
    _$GWorkCommentReplyNotificationFieldsData_user
  ];
  @override
  final String wireName = 'GWorkCommentReplyNotificationFieldsData_user';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentReplyNotificationFieldsData_user object,
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
                GWorkCommentReplyNotificationFieldsData_user_iconImage)));
    }
    return result;
  }

  @override
  GWorkCommentReplyNotificationFieldsData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentReplyNotificationFieldsData_userBuilder();

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
                      GWorkCommentReplyNotificationFieldsData_user_iconImage))!
              as GWorkCommentReplyNotificationFieldsData_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentReplyNotificationFieldsData_user_iconImageSerializer
    implements
        StructuredSerializer<
            GWorkCommentReplyNotificationFieldsData_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentReplyNotificationFieldsData_user_iconImage,
    _$GWorkCommentReplyNotificationFieldsData_user_iconImage
  ];
  @override
  final String wireName =
      'GWorkCommentReplyNotificationFieldsData_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentReplyNotificationFieldsData_user_iconImage object,
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
  GWorkCommentReplyNotificationFieldsData_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder();

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

class _$GWorkCommentReplyNotificationFieldsData_stickerSerializer
    implements
        StructuredSerializer<GWorkCommentReplyNotificationFieldsData_sticker> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentReplyNotificationFieldsData_sticker,
    _$GWorkCommentReplyNotificationFieldsData_sticker
  ];
  @override
  final String wireName = 'GWorkCommentReplyNotificationFieldsData_sticker';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentReplyNotificationFieldsData_sticker object,
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
                GWorkCommentReplyNotificationFieldsData_sticker_image)));
    }
    return result;
  }

  @override
  GWorkCommentReplyNotificationFieldsData_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentReplyNotificationFieldsData_stickerBuilder();

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
                      GWorkCommentReplyNotificationFieldsData_sticker_image))!
              as GWorkCommentReplyNotificationFieldsData_sticker_image);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentReplyNotificationFieldsData_sticker_imageSerializer
    implements
        StructuredSerializer<
            GWorkCommentReplyNotificationFieldsData_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentReplyNotificationFieldsData_sticker_image,
    _$GWorkCommentReplyNotificationFieldsData_sticker_image
  ];
  @override
  final String wireName =
      'GWorkCommentReplyNotificationFieldsData_sticker_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentReplyNotificationFieldsData_sticker_image object,
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
  GWorkCommentReplyNotificationFieldsData_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder();

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

class _$GWorkCommentReplyNotificationFieldsData
    extends GWorkCommentReplyNotificationFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String? message;
  @override
  final GWorkCommentReplyNotificationFieldsData_work? work;
  @override
  final GWorkCommentReplyNotificationFieldsData_user? user;
  @override
  final GWorkCommentReplyNotificationFieldsData_sticker? sticker;

  factory _$GWorkCommentReplyNotificationFieldsData(
          [void Function(GWorkCommentReplyNotificationFieldsDataBuilder)?
              updates]) =>
      (new GWorkCommentReplyNotificationFieldsDataBuilder()..update(updates))
          ._build();

  _$GWorkCommentReplyNotificationFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      this.message,
      this.work,
      this.user,
      this.sticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentReplyNotificationFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentReplyNotificationFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkCommentReplyNotificationFieldsData', 'createdAt');
  }

  @override
  GWorkCommentReplyNotificationFieldsData rebuild(
          void Function(GWorkCommentReplyNotificationFieldsDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentReplyNotificationFieldsDataBuilder toBuilder() =>
      new GWorkCommentReplyNotificationFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentReplyNotificationFieldsData &&
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
    return (newBuiltValueToStringHelper(
            r'GWorkCommentReplyNotificationFieldsData')
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

class GWorkCommentReplyNotificationFieldsDataBuilder
    implements
        Builder<GWorkCommentReplyNotificationFieldsData,
            GWorkCommentReplyNotificationFieldsDataBuilder> {
  _$GWorkCommentReplyNotificationFieldsData? _$v;

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

  GWorkCommentReplyNotificationFieldsData_workBuilder? _work;
  GWorkCommentReplyNotificationFieldsData_workBuilder get work =>
      _$this._work ??=
          new GWorkCommentReplyNotificationFieldsData_workBuilder();
  set work(GWorkCommentReplyNotificationFieldsData_workBuilder? work) =>
      _$this._work = work;

  GWorkCommentReplyNotificationFieldsData_userBuilder? _user;
  GWorkCommentReplyNotificationFieldsData_userBuilder get user =>
      _$this._user ??=
          new GWorkCommentReplyNotificationFieldsData_userBuilder();
  set user(GWorkCommentReplyNotificationFieldsData_userBuilder? user) =>
      _$this._user = user;

  GWorkCommentReplyNotificationFieldsData_stickerBuilder? _sticker;
  GWorkCommentReplyNotificationFieldsData_stickerBuilder get sticker =>
      _$this._sticker ??=
          new GWorkCommentReplyNotificationFieldsData_stickerBuilder();
  set sticker(
          GWorkCommentReplyNotificationFieldsData_stickerBuilder? sticker) =>
      _$this._sticker = sticker;

  GWorkCommentReplyNotificationFieldsDataBuilder() {
    GWorkCommentReplyNotificationFieldsData._initializeBuilder(this);
  }

  GWorkCommentReplyNotificationFieldsDataBuilder get _$this {
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
  void replace(GWorkCommentReplyNotificationFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentReplyNotificationFieldsData;
  }

  @override
  void update(
      void Function(GWorkCommentReplyNotificationFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentReplyNotificationFieldsData build() => _build();

  _$GWorkCommentReplyNotificationFieldsData _build() {
    _$GWorkCommentReplyNotificationFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentReplyNotificationFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentReplyNotificationFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentReplyNotificationFieldsData', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(createdAt,
                  r'GWorkCommentReplyNotificationFieldsData', 'createdAt'),
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
            r'GWorkCommentReplyNotificationFieldsData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentReplyNotificationFieldsData_work
    extends GWorkCommentReplyNotificationFieldsData_work {
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
  final GWorkCommentReplyNotificationFieldsData_work_thumbnailImage?
      thumbnailImage;

  factory _$GWorkCommentReplyNotificationFieldsData_work(
          [void Function(GWorkCommentReplyNotificationFieldsData_workBuilder)?
              updates]) =>
      (new GWorkCommentReplyNotificationFieldsData_workBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentReplyNotificationFieldsData_work._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentReplyNotificationFieldsData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentReplyNotificationFieldsData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkCommentReplyNotificationFieldsData_work', 'title');
    BuiltValueNullFieldError.checkNotNull(likesCount,
        r'GWorkCommentReplyNotificationFieldsData_work', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GWorkCommentReplyNotificationFieldsData_work', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(createdAt,
        r'GWorkCommentReplyNotificationFieldsData_work', 'createdAt');
  }

  @override
  GWorkCommentReplyNotificationFieldsData_work rebuild(
          void Function(GWorkCommentReplyNotificationFieldsData_workBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentReplyNotificationFieldsData_workBuilder toBuilder() =>
      new GWorkCommentReplyNotificationFieldsData_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentReplyNotificationFieldsData_work &&
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
            r'GWorkCommentReplyNotificationFieldsData_work')
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

class GWorkCommentReplyNotificationFieldsData_workBuilder
    implements
        Builder<GWorkCommentReplyNotificationFieldsData_work,
            GWorkCommentReplyNotificationFieldsData_workBuilder> {
  _$GWorkCommentReplyNotificationFieldsData_work? _$v;

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

  GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder?
      _thumbnailImage;
  GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder();
  set thumbnailImage(
          GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GWorkCommentReplyNotificationFieldsData_workBuilder() {
    GWorkCommentReplyNotificationFieldsData_work._initializeBuilder(this);
  }

  GWorkCommentReplyNotificationFieldsData_workBuilder get _$this {
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
  void replace(GWorkCommentReplyNotificationFieldsData_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentReplyNotificationFieldsData_work;
  }

  @override
  void update(
      void Function(GWorkCommentReplyNotificationFieldsData_workBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentReplyNotificationFieldsData_work build() => _build();

  _$GWorkCommentReplyNotificationFieldsData_work _build() {
    _$GWorkCommentReplyNotificationFieldsData_work _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentReplyNotificationFieldsData_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentReplyNotificationFieldsData_work',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentReplyNotificationFieldsData_work', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GWorkCommentReplyNotificationFieldsData_work', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GWorkCommentReplyNotificationFieldsData_work', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount,
                  r'GWorkCommentReplyNotificationFieldsData_work',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GWorkCommentReplyNotificationFieldsData_work', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentReplyNotificationFieldsData_work',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage
    extends GWorkCommentReplyNotificationFieldsData_work_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage(
          [void Function(
                  GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder)?
              updates]) =>
      (new GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentReplyNotificationFieldsData_work_thumbnailImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(id,
        r'GWorkCommentReplyNotificationFieldsData_work_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentReplyNotificationFieldsData_work_thumbnailImage',
        'downloadURL');
  }

  @override
  GWorkCommentReplyNotificationFieldsData_work_thumbnailImage rebuild(
          void Function(
                  GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder
      toBuilder() =>
          new GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GWorkCommentReplyNotificationFieldsData_work_thumbnailImage &&
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
            r'GWorkCommentReplyNotificationFieldsData_work_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder
    implements
        Builder<GWorkCommentReplyNotificationFieldsData_work_thumbnailImage,
            GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder> {
  _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder() {
    GWorkCommentReplyNotificationFieldsData_work_thumbnailImage
        ._initializeBuilder(this);
  }

  GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder
      get _$this {
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
  void replace(
      GWorkCommentReplyNotificationFieldsData_work_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage;
  }

  @override
  void update(
      void Function(
              GWorkCommentReplyNotificationFieldsData_work_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentReplyNotificationFieldsData_work_thumbnailImage build() =>
      _build();

  _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GWorkCommentReplyNotificationFieldsData_work_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentReplyNotificationFieldsData_work_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GWorkCommentReplyNotificationFieldsData_work_thumbnailImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentReplyNotificationFieldsData_work_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentReplyNotificationFieldsData_user
    extends GWorkCommentReplyNotificationFieldsData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GWorkCommentReplyNotificationFieldsData_user_iconImage? iconImage;

  factory _$GWorkCommentReplyNotificationFieldsData_user(
          [void Function(GWorkCommentReplyNotificationFieldsData_userBuilder)?
              updates]) =>
      (new GWorkCommentReplyNotificationFieldsData_userBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentReplyNotificationFieldsData_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentReplyNotificationFieldsData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentReplyNotificationFieldsData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GWorkCommentReplyNotificationFieldsData_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GWorkCommentReplyNotificationFieldsData_user', 'name');
  }

  @override
  GWorkCommentReplyNotificationFieldsData_user rebuild(
          void Function(GWorkCommentReplyNotificationFieldsData_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentReplyNotificationFieldsData_userBuilder toBuilder() =>
      new GWorkCommentReplyNotificationFieldsData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentReplyNotificationFieldsData_user &&
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
            r'GWorkCommentReplyNotificationFieldsData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GWorkCommentReplyNotificationFieldsData_userBuilder
    implements
        Builder<GWorkCommentReplyNotificationFieldsData_user,
            GWorkCommentReplyNotificationFieldsData_userBuilder> {
  _$GWorkCommentReplyNotificationFieldsData_user? _$v;

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

  GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder? _iconImage;
  GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder();
  set iconImage(
          GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GWorkCommentReplyNotificationFieldsData_userBuilder() {
    GWorkCommentReplyNotificationFieldsData_user._initializeBuilder(this);
  }

  GWorkCommentReplyNotificationFieldsData_userBuilder get _$this {
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
  void replace(GWorkCommentReplyNotificationFieldsData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentReplyNotificationFieldsData_user;
  }

  @override
  void update(
      void Function(GWorkCommentReplyNotificationFieldsData_userBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentReplyNotificationFieldsData_user build() => _build();

  _$GWorkCommentReplyNotificationFieldsData_user _build() {
    _$GWorkCommentReplyNotificationFieldsData_user _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentReplyNotificationFieldsData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentReplyNotificationFieldsData_user',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentReplyNotificationFieldsData_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(login,
                  r'GWorkCommentReplyNotificationFieldsData_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(name,
                  r'GWorkCommentReplyNotificationFieldsData_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentReplyNotificationFieldsData_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentReplyNotificationFieldsData_user_iconImage
    extends GWorkCommentReplyNotificationFieldsData_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentReplyNotificationFieldsData_user_iconImage(
          [void Function(
                  GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder)?
              updates]) =>
      (new GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentReplyNotificationFieldsData_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentReplyNotificationFieldsData_user_iconImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentReplyNotificationFieldsData_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentReplyNotificationFieldsData_user_iconImage',
        'downloadURL');
  }

  @override
  GWorkCommentReplyNotificationFieldsData_user_iconImage rebuild(
          void Function(
                  GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder toBuilder() =>
      new GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentReplyNotificationFieldsData_user_iconImage &&
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
            r'GWorkCommentReplyNotificationFieldsData_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder
    implements
        Builder<GWorkCommentReplyNotificationFieldsData_user_iconImage,
            GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder> {
  _$GWorkCommentReplyNotificationFieldsData_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder() {
    GWorkCommentReplyNotificationFieldsData_user_iconImage._initializeBuilder(
        this);
  }

  GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder get _$this {
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
  void replace(GWorkCommentReplyNotificationFieldsData_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentReplyNotificationFieldsData_user_iconImage;
  }

  @override
  void update(
      void Function(
              GWorkCommentReplyNotificationFieldsData_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentReplyNotificationFieldsData_user_iconImage build() => _build();

  _$GWorkCommentReplyNotificationFieldsData_user_iconImage _build() {
    final _$result = _$v ??
        new _$GWorkCommentReplyNotificationFieldsData_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentReplyNotificationFieldsData_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GWorkCommentReplyNotificationFieldsData_user_iconImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentReplyNotificationFieldsData_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentReplyNotificationFieldsData_sticker
    extends GWorkCommentReplyNotificationFieldsData_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GWorkCommentReplyNotificationFieldsData_sticker_image? image;

  factory _$GWorkCommentReplyNotificationFieldsData_sticker(
          [void Function(
                  GWorkCommentReplyNotificationFieldsData_stickerBuilder)?
              updates]) =>
      (new GWorkCommentReplyNotificationFieldsData_stickerBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentReplyNotificationFieldsData_sticker._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentReplyNotificationFieldsData_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentReplyNotificationFieldsData_sticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkCommentReplyNotificationFieldsData_sticker', 'title');
  }

  @override
  GWorkCommentReplyNotificationFieldsData_sticker rebuild(
          void Function(GWorkCommentReplyNotificationFieldsData_stickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentReplyNotificationFieldsData_stickerBuilder toBuilder() =>
      new GWorkCommentReplyNotificationFieldsData_stickerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentReplyNotificationFieldsData_sticker &&
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
            r'GWorkCommentReplyNotificationFieldsData_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('image', image))
        .toString();
  }
}

class GWorkCommentReplyNotificationFieldsData_stickerBuilder
    implements
        Builder<GWorkCommentReplyNotificationFieldsData_sticker,
            GWorkCommentReplyNotificationFieldsData_stickerBuilder> {
  _$GWorkCommentReplyNotificationFieldsData_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder? _image;
  GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder get image =>
      _$this._image ??=
          new GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder();
  set image(
          GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder?
              image) =>
      _$this._image = image;

  GWorkCommentReplyNotificationFieldsData_stickerBuilder() {
    GWorkCommentReplyNotificationFieldsData_sticker._initializeBuilder(this);
  }

  GWorkCommentReplyNotificationFieldsData_stickerBuilder get _$this {
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
  void replace(GWorkCommentReplyNotificationFieldsData_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentReplyNotificationFieldsData_sticker;
  }

  @override
  void update(
      void Function(GWorkCommentReplyNotificationFieldsData_stickerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentReplyNotificationFieldsData_sticker build() => _build();

  _$GWorkCommentReplyNotificationFieldsData_sticker _build() {
    _$GWorkCommentReplyNotificationFieldsData_sticker _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentReplyNotificationFieldsData_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentReplyNotificationFieldsData_sticker',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentReplyNotificationFieldsData_sticker', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(title,
                  r'GWorkCommentReplyNotificationFieldsData_sticker', 'title'),
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentReplyNotificationFieldsData_sticker',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentReplyNotificationFieldsData_sticker_image
    extends GWorkCommentReplyNotificationFieldsData_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentReplyNotificationFieldsData_sticker_image(
          [void Function(
                  GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder)?
              updates]) =>
      (new GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentReplyNotificationFieldsData_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentReplyNotificationFieldsData_sticker_image',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentReplyNotificationFieldsData_sticker_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentReplyNotificationFieldsData_sticker_image',
        'downloadURL');
  }

  @override
  GWorkCommentReplyNotificationFieldsData_sticker_image rebuild(
          void Function(
                  GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder toBuilder() =>
      new GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentReplyNotificationFieldsData_sticker_image &&
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
            r'GWorkCommentReplyNotificationFieldsData_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder
    implements
        Builder<GWorkCommentReplyNotificationFieldsData_sticker_image,
            GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder> {
  _$GWorkCommentReplyNotificationFieldsData_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder() {
    GWorkCommentReplyNotificationFieldsData_sticker_image._initializeBuilder(
        this);
  }

  GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder get _$this {
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
  void replace(GWorkCommentReplyNotificationFieldsData_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentReplyNotificationFieldsData_sticker_image;
  }

  @override
  void update(
      void Function(
              GWorkCommentReplyNotificationFieldsData_sticker_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentReplyNotificationFieldsData_sticker_image build() => _build();

  _$GWorkCommentReplyNotificationFieldsData_sticker_image _build() {
    final _$result = _$v ??
        new _$GWorkCommentReplyNotificationFieldsData_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentReplyNotificationFieldsData_sticker_image',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GWorkCommentReplyNotificationFieldsData_sticker_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentReplyNotificationFieldsData_sticker_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
