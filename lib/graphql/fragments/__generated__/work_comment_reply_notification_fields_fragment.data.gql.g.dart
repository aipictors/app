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
Serializer<GWorkCommentReplyNotificationFieldsData_user>
    _$gWorkCommentReplyNotificationFieldsDataUserSerializer =
    new _$GWorkCommentReplyNotificationFieldsData_userSerializer();
Serializer<GWorkCommentReplyNotificationFieldsData_sticker>
    _$gWorkCommentReplyNotificationFieldsDataStickerSerializer =
    new _$GWorkCommentReplyNotificationFieldsData_stickerSerializer();

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
      'imageURL',
      serializers.serialize(object.imageURL,
          specifiedType: const FullType(String)),
      'imageWidth',
      serializers.serialize(object.imageWidth,
          specifiedType: const FullType(int)),
      'imageHeight',
      serializers.serialize(object.imageHeight,
          specifiedType: const FullType(int)),
      'largeThumbnailImageURL',
      serializers.serialize(object.largeThumbnailImageURL,
          specifiedType: const FullType(String)),
      'largeThumbnailImageWidth',
      serializers.serialize(object.largeThumbnailImageWidth,
          specifiedType: const FullType(int)),
      'largeThumbnailImageHeight',
      serializers.serialize(object.largeThumbnailImageHeight,
          specifiedType: const FullType(int)),
      'smallThumbnailImageURL',
      serializers.serialize(object.smallThumbnailImageURL,
          specifiedType: const FullType(String)),
      'smallThumbnailImageWidth',
      serializers.serialize(object.smallThumbnailImageWidth,
          specifiedType: const FullType(int)),
      'smallThumbnailImageHeight',
      serializers.serialize(object.smallThumbnailImageHeight,
          specifiedType: const FullType(int)),
      'imageAspectRatio',
      serializers.serialize(object.imageAspectRatio,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.thumbnailImagePosition;
    if (value != null) {
      result
        ..add('thumbnailImagePosition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'imageWidth':
          result.imageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'imageHeight':
          result.imageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'largeThumbnailImageURL':
          result.largeThumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'largeThumbnailImageWidth':
          result.largeThumbnailImageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'largeThumbnailImageHeight':
          result.largeThumbnailImageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'smallThumbnailImageURL':
          result.smallThumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'smallThumbnailImageWidth':
          result.smallThumbnailImageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'smallThumbnailImageHeight':
          result.smallThumbnailImageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'thumbnailImagePosition':
          result.thumbnailImagePosition = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'imageAspectRatio':
          result.imageAspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
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
    value = object.iconUrl;
    if (value != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'downloadsCount',
      serializers.serialize(object.downloadsCount,
          specifiedType: const FullType(int)),
      'usesCount',
      serializers.serialize(object.usesCount,
          specifiedType: const FullType(int)),
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
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'downloadsCount':
          result.downloadsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'usesCount':
          result.usesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
  final String imageURL;
  @override
  final int imageWidth;
  @override
  final int imageHeight;
  @override
  final String largeThumbnailImageURL;
  @override
  final int largeThumbnailImageWidth;
  @override
  final int largeThumbnailImageHeight;
  @override
  final String smallThumbnailImageURL;
  @override
  final int smallThumbnailImageWidth;
  @override
  final int smallThumbnailImageHeight;
  @override
  final double? thumbnailImagePosition;
  @override
  final double imageAspectRatio;

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
      required this.imageURL,
      required this.imageWidth,
      required this.imageHeight,
      required this.largeThumbnailImageURL,
      required this.largeThumbnailImageWidth,
      required this.largeThumbnailImageHeight,
      required this.smallThumbnailImageURL,
      required this.smallThumbnailImageWidth,
      required this.smallThumbnailImageHeight,
      this.thumbnailImagePosition,
      required this.imageAspectRatio})
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
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GWorkCommentReplyNotificationFieldsData_work', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(imageWidth,
        r'GWorkCommentReplyNotificationFieldsData_work', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(imageHeight,
        r'GWorkCommentReplyNotificationFieldsData_work', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(
        largeThumbnailImageURL,
        r'GWorkCommentReplyNotificationFieldsData_work',
        'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(
        largeThumbnailImageWidth,
        r'GWorkCommentReplyNotificationFieldsData_work',
        'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(
        largeThumbnailImageHeight,
        r'GWorkCommentReplyNotificationFieldsData_work',
        'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(
        smallThumbnailImageURL,
        r'GWorkCommentReplyNotificationFieldsData_work',
        'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(
        smallThumbnailImageWidth,
        r'GWorkCommentReplyNotificationFieldsData_work',
        'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(
        smallThumbnailImageHeight,
        r'GWorkCommentReplyNotificationFieldsData_work',
        'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GWorkCommentReplyNotificationFieldsData_work', 'imageAspectRatio');
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
        imageURL == other.imageURL &&
        imageWidth == other.imageWidth &&
        imageHeight == other.imageHeight &&
        largeThumbnailImageURL == other.largeThumbnailImageURL &&
        largeThumbnailImageWidth == other.largeThumbnailImageWidth &&
        largeThumbnailImageHeight == other.largeThumbnailImageHeight &&
        smallThumbnailImageURL == other.smallThumbnailImageURL &&
        smallThumbnailImageWidth == other.smallThumbnailImageWidth &&
        smallThumbnailImageHeight == other.smallThumbnailImageHeight &&
        thumbnailImagePosition == other.thumbnailImagePosition &&
        imageAspectRatio == other.imageAspectRatio;
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
    _$hash = $jc(_$hash, imageURL.hashCode);
    _$hash = $jc(_$hash, imageWidth.hashCode);
    _$hash = $jc(_$hash, imageHeight.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageWidth.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageHeight.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageWidth.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageHeight.hashCode);
    _$hash = $jc(_$hash, thumbnailImagePosition.hashCode);
    _$hash = $jc(_$hash, imageAspectRatio.hashCode);
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
          ..add('imageURL', imageURL)
          ..add('imageWidth', imageWidth)
          ..add('imageHeight', imageHeight)
          ..add('largeThumbnailImageURL', largeThumbnailImageURL)
          ..add('largeThumbnailImageWidth', largeThumbnailImageWidth)
          ..add('largeThumbnailImageHeight', largeThumbnailImageHeight)
          ..add('smallThumbnailImageURL', smallThumbnailImageURL)
          ..add('smallThumbnailImageWidth', smallThumbnailImageWidth)
          ..add('smallThumbnailImageHeight', smallThumbnailImageHeight)
          ..add('thumbnailImagePosition', thumbnailImagePosition)
          ..add('imageAspectRatio', imageAspectRatio))
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

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

  int? _imageWidth;
  int? get imageWidth => _$this._imageWidth;
  set imageWidth(int? imageWidth) => _$this._imageWidth = imageWidth;

  int? _imageHeight;
  int? get imageHeight => _$this._imageHeight;
  set imageHeight(int? imageHeight) => _$this._imageHeight = imageHeight;

  String? _largeThumbnailImageURL;
  String? get largeThumbnailImageURL => _$this._largeThumbnailImageURL;
  set largeThumbnailImageURL(String? largeThumbnailImageURL) =>
      _$this._largeThumbnailImageURL = largeThumbnailImageURL;

  int? _largeThumbnailImageWidth;
  int? get largeThumbnailImageWidth => _$this._largeThumbnailImageWidth;
  set largeThumbnailImageWidth(int? largeThumbnailImageWidth) =>
      _$this._largeThumbnailImageWidth = largeThumbnailImageWidth;

  int? _largeThumbnailImageHeight;
  int? get largeThumbnailImageHeight => _$this._largeThumbnailImageHeight;
  set largeThumbnailImageHeight(int? largeThumbnailImageHeight) =>
      _$this._largeThumbnailImageHeight = largeThumbnailImageHeight;

  String? _smallThumbnailImageURL;
  String? get smallThumbnailImageURL => _$this._smallThumbnailImageURL;
  set smallThumbnailImageURL(String? smallThumbnailImageURL) =>
      _$this._smallThumbnailImageURL = smallThumbnailImageURL;

  int? _smallThumbnailImageWidth;
  int? get smallThumbnailImageWidth => _$this._smallThumbnailImageWidth;
  set smallThumbnailImageWidth(int? smallThumbnailImageWidth) =>
      _$this._smallThumbnailImageWidth = smallThumbnailImageWidth;

  int? _smallThumbnailImageHeight;
  int? get smallThumbnailImageHeight => _$this._smallThumbnailImageHeight;
  set smallThumbnailImageHeight(int? smallThumbnailImageHeight) =>
      _$this._smallThumbnailImageHeight = smallThumbnailImageHeight;

  double? _thumbnailImagePosition;
  double? get thumbnailImagePosition => _$this._thumbnailImagePosition;
  set thumbnailImagePosition(double? thumbnailImagePosition) =>
      _$this._thumbnailImagePosition = thumbnailImagePosition;

  double? _imageAspectRatio;
  double? get imageAspectRatio => _$this._imageAspectRatio;
  set imageAspectRatio(double? imageAspectRatio) =>
      _$this._imageAspectRatio = imageAspectRatio;

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
      _imageURL = $v.imageURL;
      _imageWidth = $v.imageWidth;
      _imageHeight = $v.imageHeight;
      _largeThumbnailImageURL = $v.largeThumbnailImageURL;
      _largeThumbnailImageWidth = $v.largeThumbnailImageWidth;
      _largeThumbnailImageHeight = $v.largeThumbnailImageHeight;
      _smallThumbnailImageURL = $v.smallThumbnailImageURL;
      _smallThumbnailImageWidth = $v.smallThumbnailImageWidth;
      _smallThumbnailImageHeight = $v.smallThumbnailImageHeight;
      _thumbnailImagePosition = $v.thumbnailImagePosition;
      _imageAspectRatio = $v.imageAspectRatio;
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
    final _$result = _$v ??
        new _$GWorkCommentReplyNotificationFieldsData_work._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkCommentReplyNotificationFieldsData_work', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentReplyNotificationFieldsData_work', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GWorkCommentReplyNotificationFieldsData_work', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GWorkCommentReplyNotificationFieldsData_work', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GWorkCommentReplyNotificationFieldsData_work', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GWorkCommentReplyNotificationFieldsData_work', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GWorkCommentReplyNotificationFieldsData_work', 'imageURL'),
            imageWidth: BuiltValueNullFieldError.checkNotNull(imageWidth, r'GWorkCommentReplyNotificationFieldsData_work', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GWorkCommentReplyNotificationFieldsData_work', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GWorkCommentReplyNotificationFieldsData_work', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GWorkCommentReplyNotificationFieldsData_work', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GWorkCommentReplyNotificationFieldsData_work', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GWorkCommentReplyNotificationFieldsData_work', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GWorkCommentReplyNotificationFieldsData_work', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GWorkCommentReplyNotificationFieldsData_work', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GWorkCommentReplyNotificationFieldsData_work', 'imageAspectRatio'));
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
  final String? iconUrl;

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
      this.iconUrl})
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
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
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
          ..add('iconUrl', iconUrl))
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

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

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
      _iconUrl = $v.iconUrl;
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
    final _$result = _$v ??
        new _$GWorkCommentReplyNotificationFieldsData_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GWorkCommentReplyNotificationFieldsData_user', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentReplyNotificationFieldsData_user', 'id'),
            login: BuiltValueNullFieldError.checkNotNull(login,
                r'GWorkCommentReplyNotificationFieldsData_user', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GWorkCommentReplyNotificationFieldsData_user', 'name'),
            iconUrl: iconUrl);
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
  final String? imageUrl;
  @override
  final int likesCount;
  @override
  final int downloadsCount;
  @override
  final int usesCount;

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
      this.imageUrl,
      required this.likesCount,
      required this.downloadsCount,
      required this.usesCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentReplyNotificationFieldsData_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentReplyNotificationFieldsData_sticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkCommentReplyNotificationFieldsData_sticker', 'title');
    BuiltValueNullFieldError.checkNotNull(likesCount,
        r'GWorkCommentReplyNotificationFieldsData_sticker', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(downloadsCount,
        r'GWorkCommentReplyNotificationFieldsData_sticker', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(usesCount,
        r'GWorkCommentReplyNotificationFieldsData_sticker', 'usesCount');
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
        imageUrl == other.imageUrl &&
        likesCount == other.likesCount &&
        downloadsCount == other.downloadsCount &&
        usesCount == other.usesCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, downloadsCount.hashCode);
    _$hash = $jc(_$hash, usesCount.hashCode);
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
          ..add('imageUrl', imageUrl)
          ..add('likesCount', likesCount)
          ..add('downloadsCount', downloadsCount)
          ..add('usesCount', usesCount))
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

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _downloadsCount;
  int? get downloadsCount => _$this._downloadsCount;
  set downloadsCount(int? downloadsCount) =>
      _$this._downloadsCount = downloadsCount;

  int? _usesCount;
  int? get usesCount => _$this._usesCount;
  set usesCount(int? usesCount) => _$this._usesCount = usesCount;

  GWorkCommentReplyNotificationFieldsData_stickerBuilder() {
    GWorkCommentReplyNotificationFieldsData_sticker._initializeBuilder(this);
  }

  GWorkCommentReplyNotificationFieldsData_stickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _imageUrl = $v.imageUrl;
      _likesCount = $v.likesCount;
      _downloadsCount = $v.downloadsCount;
      _usesCount = $v.usesCount;
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
    final _$result = _$v ??
        new _$GWorkCommentReplyNotificationFieldsData_sticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentReplyNotificationFieldsData_sticker',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentReplyNotificationFieldsData_sticker', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GWorkCommentReplyNotificationFieldsData_sticker', 'title'),
            imageUrl: imageUrl,
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GWorkCommentReplyNotificationFieldsData_sticker', 'likesCount'),
            downloadsCount: BuiltValueNullFieldError.checkNotNull(
                downloadsCount,
                r'GWorkCommentReplyNotificationFieldsData_sticker',
                'downloadsCount'),
            usesCount: BuiltValueNullFieldError.checkNotNull(
                usesCount, r'GWorkCommentReplyNotificationFieldsData_sticker', 'usesCount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
