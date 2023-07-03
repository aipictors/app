// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_notifications.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerNotificationsData> _$gViewerNotificationsDataSerializer =
    new _$GViewerNotificationsDataSerializer();
Serializer<GViewerNotificationsData_viewer>
    _$gViewerNotificationsDataViewerSerializer =
    new _$GViewerNotificationsData_viewerSerializer();
Serializer<GViewerNotificationsData_viewer_notifications>
    _$gViewerNotificationsDataViewerNotificationsSerializer =
    new _$GViewerNotificationsData_viewer_notificationsSerializer();
Serializer<GViewerNotificationsData_viewer_notifications_work>
    _$gViewerNotificationsDataViewerNotificationsWorkSerializer =
    new _$GViewerNotificationsData_viewer_notifications_workSerializer();
Serializer<GViewerNotificationsData_viewer_notifications_work_thumbnailImage>
    _$gViewerNotificationsDataViewerNotificationsWorkThumbnailImageSerializer =
    new _$GViewerNotificationsData_viewer_notifications_work_thumbnailImageSerializer();
Serializer<GViewerNotificationsData_viewer_notifications_relatedUser>
    _$gViewerNotificationsDataViewerNotificationsRelatedUserSerializer =
    new _$GViewerNotificationsData_viewer_notifications_relatedUserSerializer();
Serializer<GViewerNotificationsData_viewer_notifications_relatedUser_iconImage>
    _$gViewerNotificationsDataViewerNotificationsRelatedUserIconImageSerializer =
    new _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImageSerializer();
Serializer<GViewerNotificationsData_viewer_notifications_sticker>
    _$gViewerNotificationsDataViewerNotificationsStickerSerializer =
    new _$GViewerNotificationsData_viewer_notifications_stickerSerializer();
Serializer<GViewerNotificationsData_viewer_notifications_sticker_image>
    _$gViewerNotificationsDataViewerNotificationsStickerImageSerializer =
    new _$GViewerNotificationsData_viewer_notifications_sticker_imageSerializer();

class _$GViewerNotificationsDataSerializer
    implements StructuredSerializer<GViewerNotificationsData> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData,
    _$GViewerNotificationsData
  ];
  @override
  final String wireName = 'GViewerNotificationsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerNotificationsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GViewerNotificationsData_viewer)));
    }
    return result;
  }

  @override
  GViewerNotificationsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerNotificationsDataBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GViewerNotificationsData_viewer))!
              as GViewerNotificationsData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData_viewerSerializer
    implements StructuredSerializer<GViewerNotificationsData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer,
    _$GViewerNotificationsData_viewer
  ];
  @override
  final String wireName = 'GViewerNotificationsData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerNotificationsData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'notifications',
      serializers.serialize(object.notifications,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GViewerNotificationsData_viewer_notifications)
          ])),
    ];

    return result;
  }

  @override
  GViewerNotificationsData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerNotificationsData_viewerBuilder();

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
        case 'notifications':
          result.notifications.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerNotificationsData_viewer_notifications)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData_viewer_notificationsSerializer
    implements
        StructuredSerializer<GViewerNotificationsData_viewer_notifications> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer_notifications,
    _$GViewerNotificationsData_viewer_notifications
  ];
  @override
  final String wireName = 'GViewerNotificationsData_viewer_notifications';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerNotificationsData_viewer_notifications object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(_i2.GNotificationType)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.workId;
    if (value != null) {
      result
        ..add('workId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.work;
    if (value != null) {
      result
        ..add('work')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GViewerNotificationsData_viewer_notifications_work)));
    }
    value = object.relatedUserId;
    if (value != null) {
      result
        ..add('relatedUserId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.relatedUser;
    if (value != null) {
      result
        ..add('relatedUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GViewerNotificationsData_viewer_notifications_relatedUser)));
    }
    value = object.stickerId;
    if (value != null) {
      result
        ..add('stickerId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GViewerNotificationsData_viewer_notifications_sticker)));
    }
    return result;
  }

  @override
  GViewerNotificationsData_viewer_notifications deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerNotificationsData_viewer_notificationsBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GNotificationType))!
              as _i2.GNotificationType;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'workId':
          result.workId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerNotificationsData_viewer_notifications_work))!
              as GViewerNotificationsData_viewer_notifications_work);
          break;
        case 'relatedUserId':
          result.relatedUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'relatedUser':
          result.relatedUser.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerNotificationsData_viewer_notifications_relatedUser))!
              as GViewerNotificationsData_viewer_notifications_relatedUser);
          break;
        case 'stickerId':
          result.stickerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerNotificationsData_viewer_notifications_sticker))!
              as GViewerNotificationsData_viewer_notifications_sticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData_viewer_notifications_workSerializer
    implements
        StructuredSerializer<
            GViewerNotificationsData_viewer_notifications_work> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer_notifications_work,
    _$GViewerNotificationsData_viewer_notifications_work
  ];
  @override
  final String wireName = 'GViewerNotificationsData_viewer_notifications_work';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerNotificationsData_viewer_notifications_work object,
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
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GViewerNotificationsData_viewer_notifications_work_thumbnailImage)));
    }
    return result;
  }

  @override
  GViewerNotificationsData_viewer_notifications_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerNotificationsData_viewer_notifications_workBuilder();

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
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerNotificationsData_viewer_notifications_work_thumbnailImage))!
              as GViewerNotificationsData_viewer_notifications_work_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData_viewer_notifications_work_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GViewerNotificationsData_viewer_notifications_work_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer_notifications_work_thumbnailImage,
    _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage
  ];
  @override
  final String wireName =
      'GViewerNotificationsData_viewer_notifications_work_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerNotificationsData_viewer_notifications_work_thumbnailImage object,
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
  GViewerNotificationsData_viewer_notifications_work_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder();

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

class _$GViewerNotificationsData_viewer_notifications_relatedUserSerializer
    implements
        StructuredSerializer<
            GViewerNotificationsData_viewer_notifications_relatedUser> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer_notifications_relatedUser,
    _$GViewerNotificationsData_viewer_notifications_relatedUser
  ];
  @override
  final String wireName =
      'GViewerNotificationsData_viewer_notifications_relatedUser';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerNotificationsData_viewer_notifications_relatedUser object,
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
                GViewerNotificationsData_viewer_notifications_relatedUser_iconImage)));
    }
    return result;
  }

  @override
  GViewerNotificationsData_viewer_notifications_relatedUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerNotificationsData_viewer_notifications_relatedUserBuilder();

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
                      GViewerNotificationsData_viewer_notifications_relatedUser_iconImage))!
              as GViewerNotificationsData_viewer_notifications_relatedUser_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImageSerializer
    implements
        StructuredSerializer<
            GViewerNotificationsData_viewer_notifications_relatedUser_iconImage> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer_notifications_relatedUser_iconImage,
    _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
  ];
  @override
  final String wireName =
      'GViewerNotificationsData_viewer_notifications_relatedUser_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
          object,
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
  GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder();

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

class _$GViewerNotificationsData_viewer_notifications_stickerSerializer
    implements
        StructuredSerializer<
            GViewerNotificationsData_viewer_notifications_sticker> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer_notifications_sticker,
    _$GViewerNotificationsData_viewer_notifications_sticker
  ];
  @override
  final String wireName =
      'GViewerNotificationsData_viewer_notifications_sticker';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerNotificationsData_viewer_notifications_sticker object,
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
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(
              GViewerNotificationsData_viewer_notifications_sticker_image)),
    ];

    return result;
  }

  @override
  GViewerNotificationsData_viewer_notifications_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerNotificationsData_viewer_notifications_stickerBuilder();

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
                      GViewerNotificationsData_viewer_notifications_sticker_image))!
              as GViewerNotificationsData_viewer_notifications_sticker_image);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData_viewer_notifications_sticker_imageSerializer
    implements
        StructuredSerializer<
            GViewerNotificationsData_viewer_notifications_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer_notifications_sticker_image,
    _$GViewerNotificationsData_viewer_notifications_sticker_image
  ];
  @override
  final String wireName =
      'GViewerNotificationsData_viewer_notifications_sticker_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerNotificationsData_viewer_notifications_sticker_image object,
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
  GViewerNotificationsData_viewer_notifications_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerNotificationsData_viewer_notifications_sticker_imageBuilder();

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

class _$GViewerNotificationsData extends GViewerNotificationsData {
  @override
  final String G__typename;
  @override
  final GViewerNotificationsData_viewer? viewer;

  factory _$GViewerNotificationsData(
          [void Function(GViewerNotificationsDataBuilder)? updates]) =>
      (new GViewerNotificationsDataBuilder()..update(updates))._build();

  _$GViewerNotificationsData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerNotificationsData', 'G__typename');
  }

  @override
  GViewerNotificationsData rebuild(
          void Function(GViewerNotificationsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsDataBuilder toBuilder() =>
      new GViewerNotificationsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData &&
        G__typename == other.G__typename &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerNotificationsData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerNotificationsDataBuilder
    implements
        Builder<GViewerNotificationsData, GViewerNotificationsDataBuilder> {
  _$GViewerNotificationsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerNotificationsData_viewerBuilder? _viewer;
  GViewerNotificationsData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerNotificationsData_viewerBuilder();
  set viewer(GViewerNotificationsData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerNotificationsDataBuilder() {
    GViewerNotificationsData._initializeBuilder(this);
  }

  GViewerNotificationsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData;
  }

  @override
  void update(void Function(GViewerNotificationsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData build() => _build();

  _$GViewerNotificationsData _build() {
    _$GViewerNotificationsData _$result;
    try {
      _$result = _$v ??
          new _$GViewerNotificationsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerNotificationsData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerNotificationsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer
    extends GViewerNotificationsData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerNotificationsData_viewer_notifications> notifications;

  factory _$GViewerNotificationsData_viewer(
          [void Function(GViewerNotificationsData_viewerBuilder)? updates]) =>
      (new GViewerNotificationsData_viewerBuilder()..update(updates))._build();

  _$GViewerNotificationsData_viewer._(
      {required this.G__typename, required this.notifications})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerNotificationsData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        notifications, r'GViewerNotificationsData_viewer', 'notifications');
  }

  @override
  GViewerNotificationsData_viewer rebuild(
          void Function(GViewerNotificationsData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewerBuilder toBuilder() =>
      new GViewerNotificationsData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData_viewer &&
        G__typename == other.G__typename &&
        notifications == other.notifications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerNotificationsData_viewer')
          ..add('G__typename', G__typename)
          ..add('notifications', notifications))
        .toString();
  }
}

class GViewerNotificationsData_viewerBuilder
    implements
        Builder<GViewerNotificationsData_viewer,
            GViewerNotificationsData_viewerBuilder> {
  _$GViewerNotificationsData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerNotificationsData_viewer_notifications>? _notifications;
  ListBuilder<GViewerNotificationsData_viewer_notifications>
      get notifications => _$this._notifications ??=
          new ListBuilder<GViewerNotificationsData_viewer_notifications>();
  set notifications(
          ListBuilder<GViewerNotificationsData_viewer_notifications>?
              notifications) =>
      _$this._notifications = notifications;

  GViewerNotificationsData_viewerBuilder() {
    GViewerNotificationsData_viewer._initializeBuilder(this);
  }

  GViewerNotificationsData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _notifications = $v.notifications.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData_viewer;
  }

  @override
  void update(void Function(GViewerNotificationsData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer build() => _build();

  _$GViewerNotificationsData_viewer _build() {
    _$GViewerNotificationsData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerNotificationsData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerNotificationsData_viewer', 'G__typename'),
              notifications: notifications.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notifications';
        notifications.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerNotificationsData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer_notifications
    extends GViewerNotificationsData_viewer_notifications {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final _i2.GNotificationType type;
  @override
  final int createdAt;
  @override
  final String message;
  @override
  final String? workId;
  @override
  final GViewerNotificationsData_viewer_notifications_work? work;
  @override
  final String? relatedUserId;
  @override
  final GViewerNotificationsData_viewer_notifications_relatedUser? relatedUser;
  @override
  final String? stickerId;
  @override
  final GViewerNotificationsData_viewer_notifications_sticker? sticker;

  factory _$GViewerNotificationsData_viewer_notifications(
          [void Function(GViewerNotificationsData_viewer_notificationsBuilder)?
              updates]) =>
      (new GViewerNotificationsData_viewer_notificationsBuilder()
            ..update(updates))
          ._build();

  _$GViewerNotificationsData_viewer_notifications._(
      {required this.G__typename,
      required this.id,
      required this.type,
      required this.createdAt,
      required this.message,
      this.workId,
      this.work,
      this.relatedUserId,
      this.relatedUser,
      this.stickerId,
      this.sticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerNotificationsData_viewer_notifications', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerNotificationsData_viewer_notifications', 'id');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GViewerNotificationsData_viewer_notifications', 'type');
    BuiltValueNullFieldError.checkNotNull(createdAt,
        r'GViewerNotificationsData_viewer_notifications', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        message, r'GViewerNotificationsData_viewer_notifications', 'message');
  }

  @override
  GViewerNotificationsData_viewer_notifications rebuild(
          void Function(GViewerNotificationsData_viewer_notificationsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewer_notificationsBuilder toBuilder() =>
      new GViewerNotificationsData_viewer_notificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData_viewer_notifications &&
        G__typename == other.G__typename &&
        id == other.id &&
        type == other.type &&
        createdAt == other.createdAt &&
        message == other.message &&
        workId == other.workId &&
        work == other.work &&
        relatedUserId == other.relatedUserId &&
        relatedUser == other.relatedUser &&
        stickerId == other.stickerId &&
        sticker == other.sticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jc(_$hash, relatedUserId.hashCode);
    _$hash = $jc(_$hash, relatedUser.hashCode);
    _$hash = $jc(_$hash, stickerId.hashCode);
    _$hash = $jc(_$hash, sticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerNotificationsData_viewer_notifications')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('type', type)
          ..add('createdAt', createdAt)
          ..add('message', message)
          ..add('workId', workId)
          ..add('work', work)
          ..add('relatedUserId', relatedUserId)
          ..add('relatedUser', relatedUser)
          ..add('stickerId', stickerId)
          ..add('sticker', sticker))
        .toString();
  }
}

class GViewerNotificationsData_viewer_notificationsBuilder
    implements
        Builder<GViewerNotificationsData_viewer_notifications,
            GViewerNotificationsData_viewer_notificationsBuilder> {
  _$GViewerNotificationsData_viewer_notifications? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  _i2.GNotificationType? _type;
  _i2.GNotificationType? get type => _$this._type;
  set type(_i2.GNotificationType? type) => _$this._type = type;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  GViewerNotificationsData_viewer_notifications_workBuilder? _work;
  GViewerNotificationsData_viewer_notifications_workBuilder get work =>
      _$this._work ??=
          new GViewerNotificationsData_viewer_notifications_workBuilder();
  set work(GViewerNotificationsData_viewer_notifications_workBuilder? work) =>
      _$this._work = work;

  String? _relatedUserId;
  String? get relatedUserId => _$this._relatedUserId;
  set relatedUserId(String? relatedUserId) =>
      _$this._relatedUserId = relatedUserId;

  GViewerNotificationsData_viewer_notifications_relatedUserBuilder?
      _relatedUser;
  GViewerNotificationsData_viewer_notifications_relatedUserBuilder
      get relatedUser => _$this._relatedUser ??=
          new GViewerNotificationsData_viewer_notifications_relatedUserBuilder();
  set relatedUser(
          GViewerNotificationsData_viewer_notifications_relatedUserBuilder?
              relatedUser) =>
      _$this._relatedUser = relatedUser;

  String? _stickerId;
  String? get stickerId => _$this._stickerId;
  set stickerId(String? stickerId) => _$this._stickerId = stickerId;

  GViewerNotificationsData_viewer_notifications_stickerBuilder? _sticker;
  GViewerNotificationsData_viewer_notifications_stickerBuilder get sticker =>
      _$this._sticker ??=
          new GViewerNotificationsData_viewer_notifications_stickerBuilder();
  set sticker(
          GViewerNotificationsData_viewer_notifications_stickerBuilder?
              sticker) =>
      _$this._sticker = sticker;

  GViewerNotificationsData_viewer_notificationsBuilder() {
    GViewerNotificationsData_viewer_notifications._initializeBuilder(this);
  }

  GViewerNotificationsData_viewer_notificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _type = $v.type;
      _createdAt = $v.createdAt;
      _message = $v.message;
      _workId = $v.workId;
      _work = $v.work?.toBuilder();
      _relatedUserId = $v.relatedUserId;
      _relatedUser = $v.relatedUser?.toBuilder();
      _stickerId = $v.stickerId;
      _sticker = $v.sticker?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsData_viewer_notifications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData_viewer_notifications;
  }

  @override
  void update(
      void Function(GViewerNotificationsData_viewer_notificationsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer_notifications build() => _build();

  _$GViewerNotificationsData_viewer_notifications _build() {
    _$GViewerNotificationsData_viewer_notifications _$result;
    try {
      _$result = _$v ??
          new _$GViewerNotificationsData_viewer_notifications._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GViewerNotificationsData_viewer_notifications',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerNotificationsData_viewer_notifications', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(type,
                  r'GViewerNotificationsData_viewer_notifications', 'type'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt,
                  r'GViewerNotificationsData_viewer_notifications',
                  'createdAt'),
              message: BuiltValueNullFieldError.checkNotNull(message,
                  r'GViewerNotificationsData_viewer_notifications', 'message'),
              workId: workId,
              work: _work?.build(),
              relatedUserId: relatedUserId,
              relatedUser: _relatedUser?.build(),
              stickerId: stickerId,
              sticker: _sticker?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        _work?.build();

        _$failedField = 'relatedUser';
        _relatedUser?.build();

        _$failedField = 'sticker';
        _sticker?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerNotificationsData_viewer_notifications',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer_notifications_work
    extends GViewerNotificationsData_viewer_notifications_work {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GViewerNotificationsData_viewer_notifications_work_thumbnailImage?
      thumbnailImage;

  factory _$GViewerNotificationsData_viewer_notifications_work(
          [void Function(
                  GViewerNotificationsData_viewer_notifications_workBuilder)?
              updates]) =>
      (new GViewerNotificationsData_viewer_notifications_workBuilder()
            ..update(updates))
          ._build();

  _$GViewerNotificationsData_viewer_notifications_work._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerNotificationsData_viewer_notifications_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerNotificationsData_viewer_notifications_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GViewerNotificationsData_viewer_notifications_work', 'title');
  }

  @override
  GViewerNotificationsData_viewer_notifications_work rebuild(
          void Function(
                  GViewerNotificationsData_viewer_notifications_workBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewer_notifications_workBuilder toBuilder() =>
      new GViewerNotificationsData_viewer_notifications_workBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData_viewer_notifications_work &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerNotificationsData_viewer_notifications_work')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GViewerNotificationsData_viewer_notifications_workBuilder
    implements
        Builder<GViewerNotificationsData_viewer_notifications_work,
            GViewerNotificationsData_viewer_notifications_workBuilder> {
  _$GViewerNotificationsData_viewer_notifications_work? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder?
      _thumbnailImage;
  GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder();
  set thumbnailImage(
          GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GViewerNotificationsData_viewer_notifications_workBuilder() {
    GViewerNotificationsData_viewer_notifications_work._initializeBuilder(this);
  }

  GViewerNotificationsData_viewer_notifications_workBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsData_viewer_notifications_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData_viewer_notifications_work;
  }

  @override
  void update(
      void Function(GViewerNotificationsData_viewer_notifications_workBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer_notifications_work build() => _build();

  _$GViewerNotificationsData_viewer_notifications_work _build() {
    _$GViewerNotificationsData_viewer_notifications_work _$result;
    try {
      _$result = _$v ??
          new _$GViewerNotificationsData_viewer_notifications_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GViewerNotificationsData_viewer_notifications_work',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(id,
                  r'GViewerNotificationsData_viewer_notifications_work', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title,
                  r'GViewerNotificationsData_viewer_notifications_work',
                  'title'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerNotificationsData_viewer_notifications_work',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage
    extends GViewerNotificationsData_viewer_notifications_work_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage(
          [void Function(
                  GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder)?
              updates]) =>
      (new GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerNotificationsData_viewer_notifications_work_thumbnailImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GViewerNotificationsData_viewer_notifications_work_thumbnailImage',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GViewerNotificationsData_viewer_notifications_work_thumbnailImage',
        'downloadURL');
  }

  @override
  GViewerNotificationsData_viewer_notifications_work_thumbnailImage rebuild(
          void Function(
                  GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder
      toBuilder() =>
          new GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GViewerNotificationsData_viewer_notifications_work_thumbnailImage &&
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
            r'GViewerNotificationsData_viewer_notifications_work_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder
    implements
        Builder<
            GViewerNotificationsData_viewer_notifications_work_thumbnailImage,
            GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder> {
  _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder() {
    GViewerNotificationsData_viewer_notifications_work_thumbnailImage
        ._initializeBuilder(this);
  }

  GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder
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
      GViewerNotificationsData_viewer_notifications_work_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage;
  }

  @override
  void update(
      void Function(
              GViewerNotificationsData_viewer_notifications_work_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer_notifications_work_thumbnailImage build() =>
      _build();

  _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GViewerNotificationsData_viewer_notifications_work_thumbnailImage
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerNotificationsData_viewer_notifications_work_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GViewerNotificationsData_viewer_notifications_work_thumbnailImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GViewerNotificationsData_viewer_notifications_work_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer_notifications_relatedUser
    extends GViewerNotificationsData_viewer_notifications_relatedUser {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GViewerNotificationsData_viewer_notifications_relatedUser_iconImage?
      iconImage;

  factory _$GViewerNotificationsData_viewer_notifications_relatedUser(
          [void Function(
                  GViewerNotificationsData_viewer_notifications_relatedUserBuilder)?
              updates]) =>
      (new GViewerNotificationsData_viewer_notifications_relatedUserBuilder()
            ..update(updates))
          ._build();

  _$GViewerNotificationsData_viewer_notifications_relatedUser._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerNotificationsData_viewer_notifications_relatedUser',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerNotificationsData_viewer_notifications_relatedUser', 'id');
    BuiltValueNullFieldError.checkNotNull(login,
        r'GViewerNotificationsData_viewer_notifications_relatedUser', 'login');
    BuiltValueNullFieldError.checkNotNull(name,
        r'GViewerNotificationsData_viewer_notifications_relatedUser', 'name');
  }

  @override
  GViewerNotificationsData_viewer_notifications_relatedUser rebuild(
          void Function(
                  GViewerNotificationsData_viewer_notifications_relatedUserBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewer_notifications_relatedUserBuilder
      toBuilder() =>
          new GViewerNotificationsData_viewer_notifications_relatedUserBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData_viewer_notifications_relatedUser &&
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
            r'GViewerNotificationsData_viewer_notifications_relatedUser')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GViewerNotificationsData_viewer_notifications_relatedUserBuilder
    implements
        Builder<GViewerNotificationsData_viewer_notifications_relatedUser,
            GViewerNotificationsData_viewer_notifications_relatedUserBuilder> {
  _$GViewerNotificationsData_viewer_notifications_relatedUser? _$v;

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

  GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder?
      _iconImage;
  GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder
      get iconImage => _$this._iconImage ??=
          new GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder();
  set iconImage(
          GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GViewerNotificationsData_viewer_notifications_relatedUserBuilder() {
    GViewerNotificationsData_viewer_notifications_relatedUser
        ._initializeBuilder(this);
  }

  GViewerNotificationsData_viewer_notifications_relatedUserBuilder get _$this {
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
  void replace(
      GViewerNotificationsData_viewer_notifications_relatedUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData_viewer_notifications_relatedUser;
  }

  @override
  void update(
      void Function(
              GViewerNotificationsData_viewer_notifications_relatedUserBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer_notifications_relatedUser build() => _build();

  _$GViewerNotificationsData_viewer_notifications_relatedUser _build() {
    _$GViewerNotificationsData_viewer_notifications_relatedUser _$result;
    try {
      _$result = _$v ??
          new _$GViewerNotificationsData_viewer_notifications_relatedUser._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GViewerNotificationsData_viewer_notifications_relatedUser',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(id,
                  r'GViewerNotificationsData_viewer_notifications_relatedUser', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login,
                  r'GViewerNotificationsData_viewer_notifications_relatedUser',
                  'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name,
                  r'GViewerNotificationsData_viewer_notifications_relatedUser',
                  'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerNotificationsData_viewer_notifications_relatedUser',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
    extends GViewerNotificationsData_viewer_notifications_relatedUser_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage(
          [void Function(
                  GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder)?
              updates]) =>
      (new GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerNotificationsData_viewer_notifications_relatedUser_iconImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GViewerNotificationsData_viewer_notifications_relatedUser_iconImage',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GViewerNotificationsData_viewer_notifications_relatedUser_iconImage',
        'downloadURL');
  }

  @override
  GViewerNotificationsData_viewer_notifications_relatedUser_iconImage rebuild(
          void Function(
                  GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder
      toBuilder() =>
          new GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GViewerNotificationsData_viewer_notifications_relatedUser_iconImage &&
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
            r'GViewerNotificationsData_viewer_notifications_relatedUser_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder
    implements
        Builder<
            GViewerNotificationsData_viewer_notifications_relatedUser_iconImage,
            GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder> {
  _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder() {
    GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
        ._initializeBuilder(this);
  }

  GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder
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
      GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage;
  }

  @override
  void update(
      void Function(
              GViewerNotificationsData_viewer_notifications_relatedUser_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer_notifications_relatedUser_iconImage build() =>
      _build();

  _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
      _build() {
    final _$result = _$v ??
        new _$GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerNotificationsData_viewer_notifications_relatedUser_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GViewerNotificationsData_viewer_notifications_relatedUser_iconImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GViewerNotificationsData_viewer_notifications_relatedUser_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer_notifications_sticker
    extends GViewerNotificationsData_viewer_notifications_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GViewerNotificationsData_viewer_notifications_sticker_image image;

  factory _$GViewerNotificationsData_viewer_notifications_sticker(
          [void Function(
                  GViewerNotificationsData_viewer_notifications_stickerBuilder)?
              updates]) =>
      (new GViewerNotificationsData_viewer_notifications_stickerBuilder()
            ..update(updates))
          ._build();

  _$GViewerNotificationsData_viewer_notifications_sticker._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerNotificationsData_viewer_notifications_sticker',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerNotificationsData_viewer_notifications_sticker', 'id');
    BuiltValueNullFieldError.checkNotNull(title,
        r'GViewerNotificationsData_viewer_notifications_sticker', 'title');
    BuiltValueNullFieldError.checkNotNull(image,
        r'GViewerNotificationsData_viewer_notifications_sticker', 'image');
  }

  @override
  GViewerNotificationsData_viewer_notifications_sticker rebuild(
          void Function(
                  GViewerNotificationsData_viewer_notifications_stickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewer_notifications_stickerBuilder toBuilder() =>
      new GViewerNotificationsData_viewer_notifications_stickerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData_viewer_notifications_sticker &&
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
            r'GViewerNotificationsData_viewer_notifications_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('image', image))
        .toString();
  }
}

class GViewerNotificationsData_viewer_notifications_stickerBuilder
    implements
        Builder<GViewerNotificationsData_viewer_notifications_sticker,
            GViewerNotificationsData_viewer_notifications_stickerBuilder> {
  _$GViewerNotificationsData_viewer_notifications_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GViewerNotificationsData_viewer_notifications_sticker_imageBuilder? _image;
  GViewerNotificationsData_viewer_notifications_sticker_imageBuilder
      get image => _$this._image ??=
          new GViewerNotificationsData_viewer_notifications_sticker_imageBuilder();
  set image(
          GViewerNotificationsData_viewer_notifications_sticker_imageBuilder?
              image) =>
      _$this._image = image;

  GViewerNotificationsData_viewer_notifications_stickerBuilder() {
    GViewerNotificationsData_viewer_notifications_sticker._initializeBuilder(
        this);
  }

  GViewerNotificationsData_viewer_notifications_stickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _image = $v.image.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsData_viewer_notifications_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData_viewer_notifications_sticker;
  }

  @override
  void update(
      void Function(
              GViewerNotificationsData_viewer_notifications_stickerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer_notifications_sticker build() => _build();

  _$GViewerNotificationsData_viewer_notifications_sticker _build() {
    _$GViewerNotificationsData_viewer_notifications_sticker _$result;
    try {
      _$result = _$v ??
          new _$GViewerNotificationsData_viewer_notifications_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GViewerNotificationsData_viewer_notifications_sticker',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id,
                  r'GViewerNotificationsData_viewer_notifications_sticker',
                  'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title,
                  r'GViewerNotificationsData_viewer_notifications_sticker',
                  'title'),
              image: image.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        image.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerNotificationsData_viewer_notifications_sticker',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer_notifications_sticker_image
    extends GViewerNotificationsData_viewer_notifications_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerNotificationsData_viewer_notifications_sticker_image(
          [void Function(
                  GViewerNotificationsData_viewer_notifications_sticker_imageBuilder)?
              updates]) =>
      (new GViewerNotificationsData_viewer_notifications_sticker_imageBuilder()
            ..update(updates))
          ._build();

  _$GViewerNotificationsData_viewer_notifications_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerNotificationsData_viewer_notifications_sticker_image',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(id,
        r'GViewerNotificationsData_viewer_notifications_sticker_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GViewerNotificationsData_viewer_notifications_sticker_image',
        'downloadURL');
  }

  @override
  GViewerNotificationsData_viewer_notifications_sticker_image rebuild(
          void Function(
                  GViewerNotificationsData_viewer_notifications_sticker_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewer_notifications_sticker_imageBuilder
      toBuilder() =>
          new GViewerNotificationsData_viewer_notifications_sticker_imageBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GViewerNotificationsData_viewer_notifications_sticker_image &&
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
            r'GViewerNotificationsData_viewer_notifications_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerNotificationsData_viewer_notifications_sticker_imageBuilder
    implements
        Builder<GViewerNotificationsData_viewer_notifications_sticker_image,
            GViewerNotificationsData_viewer_notifications_sticker_imageBuilder> {
  _$GViewerNotificationsData_viewer_notifications_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerNotificationsData_viewer_notifications_sticker_imageBuilder() {
    GViewerNotificationsData_viewer_notifications_sticker_image
        ._initializeBuilder(this);
  }

  GViewerNotificationsData_viewer_notifications_sticker_imageBuilder
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
      GViewerNotificationsData_viewer_notifications_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GViewerNotificationsData_viewer_notifications_sticker_image;
  }

  @override
  void update(
      void Function(
              GViewerNotificationsData_viewer_notifications_sticker_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer_notifications_sticker_image build() =>
      _build();

  _$GViewerNotificationsData_viewer_notifications_sticker_image _build() {
    final _$result = _$v ??
        new _$GViewerNotificationsData_viewer_notifications_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerNotificationsData_viewer_notifications_sticker_image',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GViewerNotificationsData_viewer_notifications_sticker_image',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GViewerNotificationsData_viewer_notifications_sticker_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
