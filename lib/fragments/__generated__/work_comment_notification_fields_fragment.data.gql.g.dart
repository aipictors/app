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
Serializer<GWorkCommentNotificationFieldsData_user>
    _$gWorkCommentNotificationFieldsDataUserSerializer =
    new _$GWorkCommentNotificationFieldsData_userSerializer();
Serializer<GWorkCommentNotificationFieldsData_sticker>
    _$gWorkCommentNotificationFieldsDataStickerSerializer =
    new _$GWorkCommentNotificationFieldsData_stickerSerializer();

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
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GWorkCommentNotificationFieldsData_work', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        imageWidth, r'GWorkCommentNotificationFieldsData_work', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(
        imageHeight, r'GWorkCommentNotificationFieldsData_work', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL,
        r'GWorkCommentNotificationFieldsData_work', 'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth,
        r'GWorkCommentNotificationFieldsData_work', 'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(
        largeThumbnailImageHeight,
        r'GWorkCommentNotificationFieldsData_work',
        'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL,
        r'GWorkCommentNotificationFieldsData_work', 'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth,
        r'GWorkCommentNotificationFieldsData_work', 'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(
        smallThumbnailImageHeight,
        r'GWorkCommentNotificationFieldsData_work',
        'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GWorkCommentNotificationFieldsData_work', 'imageAspectRatio');
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
            r'GWorkCommentNotificationFieldsData_work')
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
    final _$result = _$v ??
        new _$GWorkCommentNotificationFieldsData_work._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkCommentNotificationFieldsData_work', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentNotificationFieldsData_work', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GWorkCommentNotificationFieldsData_work', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GWorkCommentNotificationFieldsData_work', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GWorkCommentNotificationFieldsData_work', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GWorkCommentNotificationFieldsData_work', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GWorkCommentNotificationFieldsData_work', 'imageURL'),
            imageWidth: BuiltValueNullFieldError.checkNotNull(imageWidth, r'GWorkCommentNotificationFieldsData_work', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GWorkCommentNotificationFieldsData_work', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GWorkCommentNotificationFieldsData_work', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GWorkCommentNotificationFieldsData_work', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GWorkCommentNotificationFieldsData_work', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GWorkCommentNotificationFieldsData_work', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GWorkCommentNotificationFieldsData_work', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GWorkCommentNotificationFieldsData_work', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GWorkCommentNotificationFieldsData_work', 'imageAspectRatio'));
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
  final String? iconUrl;

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
      this.iconUrl})
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
            r'GWorkCommentNotificationFieldsData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconUrl', iconUrl))
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

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

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
      _iconUrl = $v.iconUrl;
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
    final _$result = _$v ??
        new _$GWorkCommentNotificationFieldsData_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GWorkCommentNotificationFieldsData_user', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentNotificationFieldsData_user', 'id'),
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GWorkCommentNotificationFieldsData_user', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GWorkCommentNotificationFieldsData_user', 'name'),
            iconUrl: iconUrl);
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
  final String? imageUrl;
  @override
  final int likesCount;
  @override
  final int downloadsCount;
  @override
  final int usesCount;

  factory _$GWorkCommentNotificationFieldsData_sticker(
          [void Function(GWorkCommentNotificationFieldsData_stickerBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsData_stickerBuilder()..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsData_sticker._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.imageUrl,
      required this.likesCount,
      required this.downloadsCount,
      required this.usesCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentNotificationFieldsData_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentNotificationFieldsData_sticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkCommentNotificationFieldsData_sticker', 'title');
    BuiltValueNullFieldError.checkNotNull(likesCount,
        r'GWorkCommentNotificationFieldsData_sticker', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(downloadsCount,
        r'GWorkCommentNotificationFieldsData_sticker', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(
        usesCount, r'GWorkCommentNotificationFieldsData_sticker', 'usesCount');
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
            r'GWorkCommentNotificationFieldsData_sticker')
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

  GWorkCommentNotificationFieldsData_stickerBuilder() {
    GWorkCommentNotificationFieldsData_sticker._initializeBuilder(this);
  }

  GWorkCommentNotificationFieldsData_stickerBuilder get _$this {
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
    final _$result = _$v ??
        new _$GWorkCommentNotificationFieldsData_sticker._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GWorkCommentNotificationFieldsData_sticker', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentNotificationFieldsData_sticker', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GWorkCommentNotificationFieldsData_sticker', 'title'),
            imageUrl: imageUrl,
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GWorkCommentNotificationFieldsData_sticker', 'likesCount'),
            downloadsCount: BuiltValueNullFieldError.checkNotNull(
                downloadsCount,
                r'GWorkCommentNotificationFieldsData_sticker',
                'downloadsCount'),
            usesCount: BuiltValueNullFieldError.checkNotNull(
                usesCount, r'GWorkCommentNotificationFieldsData_sticker', 'usesCount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
