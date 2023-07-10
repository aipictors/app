// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GAccessType _$gAccessTypePUBLIC = const GAccessType._('PUBLIC');
const GAccessType _$gAccessTypeSILENT = const GAccessType._('SILENT');
const GAccessType _$gAccessTypePRIVATE = const GAccessType._('PRIVATE');
const GAccessType _$gAccessTypeLIMITED = const GAccessType._('LIMITED');

GAccessType _$gAccessTypeValueOf(String name) {
  switch (name) {
    case 'PUBLIC':
      return _$gAccessTypePUBLIC;
    case 'SILENT':
      return _$gAccessTypeSILENT;
    case 'PRIVATE':
      return _$gAccessTypePRIVATE;
    case 'LIMITED':
      return _$gAccessTypeLIMITED;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GAccessType> _$gAccessTypeValues =
    new BuiltSet<GAccessType>(const <GAccessType>[
  _$gAccessTypePUBLIC,
  _$gAccessTypeSILENT,
  _$gAccessTypePRIVATE,
  _$gAccessTypeLIMITED,
]);

const GAwardType _$gAwardTypeMONTHLY = const GAwardType._('MONTHLY');
const GAwardType _$gAwardTypeWEEKLY = const GAwardType._('WEEKLY');
const GAwardType _$gAwardTypeDAILY = const GAwardType._('DAILY');
const GAwardType _$gAwardTypeDAILY_NO_THEME =
    const GAwardType._('DAILY_NO_THEME');

GAwardType _$gAwardTypeValueOf(String name) {
  switch (name) {
    case 'MONTHLY':
      return _$gAwardTypeMONTHLY;
    case 'WEEKLY':
      return _$gAwardTypeWEEKLY;
    case 'DAILY':
      return _$gAwardTypeDAILY;
    case 'DAILY_NO_THEME':
      return _$gAwardTypeDAILY_NO_THEME;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GAwardType> _$gAwardTypeValues =
    new BuiltSet<GAwardType>(const <GAwardType>[
  _$gAwardTypeMONTHLY,
  _$gAwardTypeWEEKLY,
  _$gAwardTypeDAILY,
  _$gAwardTypeDAILY_NO_THEME,
]);

const GCacheControlScope _$gCacheControlScopePUBLIC =
    const GCacheControlScope._('PUBLIC');
const GCacheControlScope _$gCacheControlScopePRIVATE =
    const GCacheControlScope._('PRIVATE');

GCacheControlScope _$gCacheControlScopeValueOf(String name) {
  switch (name) {
    case 'PUBLIC':
      return _$gCacheControlScopePUBLIC;
    case 'PRIVATE':
      return _$gCacheControlScopePRIVATE;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GCacheControlScope> _$gCacheControlScopeValues =
    new BuiltSet<GCacheControlScope>(const <GCacheControlScope>[
  _$gCacheControlScopePUBLIC,
  _$gCacheControlScopePRIVATE,
]);

const GContributorType _$gContributorTypeWIKI_EDITOR =
    const GContributorType._('WIKI_EDITOR');
const GContributorType _$gContributorTypeWEB_DEVELOPER =
    const GContributorType._('WEB_DEVELOPER');
const GContributorType _$gContributorTypeFLUTTER_DEVELOPER =
    const GContributorType._('FLUTTER_DEVELOPER');
const GContributorType _$gContributorTypePRODUCT_DESIGNER =
    const GContributorType._('PRODUCT_DESIGNER');
const GContributorType _$gContributorTypeSUPPORTER =
    const GContributorType._('SUPPORTER');

GContributorType _$gContributorTypeValueOf(String name) {
  switch (name) {
    case 'WIKI_EDITOR':
      return _$gContributorTypeWIKI_EDITOR;
    case 'WEB_DEVELOPER':
      return _$gContributorTypeWEB_DEVELOPER;
    case 'FLUTTER_DEVELOPER':
      return _$gContributorTypeFLUTTER_DEVELOPER;
    case 'PRODUCT_DESIGNER':
      return _$gContributorTypePRODUCT_DESIGNER;
    case 'SUPPORTER':
      return _$gContributorTypeSUPPORTER;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GContributorType> _$gContributorTypeValues =
    new BuiltSet<GContributorType>(const <GContributorType>[
  _$gContributorTypeWIKI_EDITOR,
  _$gContributorTypeWEB_DEVELOPER,
  _$gContributorTypeFLUTTER_DEVELOPER,
  _$gContributorTypePRODUCT_DESIGNER,
  _$gContributorTypeSUPPORTER,
]);

const Glink__Purpose _$glinkPurposeSECURITY =
    const Glink__Purpose._('SECURITY');
const Glink__Purpose _$glinkPurposeEXECUTION =
    const Glink__Purpose._('EXECUTION');

Glink__Purpose _$glinkPurposeValueOf(String name) {
  switch (name) {
    case 'SECURITY':
      return _$glinkPurposeSECURITY;
    case 'EXECUTION':
      return _$glinkPurposeEXECUTION;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Glink__Purpose> _$glinkPurposeValues =
    new BuiltSet<Glink__Purpose>(const <Glink__Purpose>[
  _$glinkPurposeSECURITY,
  _$glinkPurposeEXECUTION,
]);

const GNotificationType _$gNotificationTypeLIKE =
    const GNotificationType._('LIKE');
const GNotificationType _$gNotificationTypeCOMMENT =
    const GNotificationType._('COMMENT');
const GNotificationType _$gNotificationTypeCOMMENT_REPLY =
    const GNotificationType._('COMMENT_REPLY');
const GNotificationType _$gNotificationTypeFOLLOW =
    const GNotificationType._('FOLLOW');

GNotificationType _$gNotificationTypeValueOf(String name) {
  switch (name) {
    case 'LIKE':
      return _$gNotificationTypeLIKE;
    case 'COMMENT':
      return _$gNotificationTypeCOMMENT;
    case 'COMMENT_REPLY':
      return _$gNotificationTypeCOMMENT_REPLY;
    case 'FOLLOW':
      return _$gNotificationTypeFOLLOW;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GNotificationType> _$gNotificationTypeValues =
    new BuiltSet<GNotificationType>(const <GNotificationType>[
  _$gNotificationTypeLIKE,
  _$gNotificationTypeCOMMENT,
  _$gNotificationTypeCOMMENT_REPLY,
  _$gNotificationTypeFOLLOW,
]);

const GPostType _$gPostTypeWORK = const GPostType._('WORK');
const GPostType _$gPostTypeNOVEL = const GPostType._('NOVEL');
const GPostType _$gPostTypeNOTE = const GPostType._('NOTE');

GPostType _$gPostTypeValueOf(String name) {
  switch (name) {
    case 'WORK':
      return _$gPostTypeWORK;
    case 'NOVEL':
      return _$gPostTypeNOVEL;
    case 'NOTE':
      return _$gPostTypeNOTE;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GPostType> _$gPostTypeValues =
    new BuiltSet<GPostType>(const <GPostType>[
  _$gPostTypeWORK,
  _$gPostTypeNOVEL,
  _$gPostTypeNOTE,
]);

const GRating _$gRatingG = const GRating._('G');
const GRating _$gRatingR15 = const GRating._('R15');
const GRating _$gRatingR18 = const GRating._('R18');
const GRating _$gRatingR18G = const GRating._('R18G');

GRating _$gRatingValueOf(String name) {
  switch (name) {
    case 'G':
      return _$gRatingG;
    case 'R15':
      return _$gRatingR15;
    case 'R18':
      return _$gRatingR18;
    case 'R18G':
      return _$gRatingR18G;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GRating> _$gRatingValues = new BuiltSet<GRating>(const <GRating>[
  _$gRatingG,
  _$gRatingR15,
  _$gRatingR18,
  _$gRatingR18G,
]);

Serializer<GAccessType> _$gAccessTypeSerializer = new _$GAccessTypeSerializer();
Serializer<GAwardsWhereInput> _$gAwardsWhereInputSerializer =
    new _$GAwardsWhereInputSerializer();
Serializer<GAwardType> _$gAwardTypeSerializer = new _$GAwardTypeSerializer();
Serializer<GCacheControlScope> _$gCacheControlScopeSerializer =
    new _$GCacheControlScopeSerializer();
Serializer<GContributorType> _$gContributorTypeSerializer =
    new _$GContributorTypeSerializer();
Serializer<GCreateCommentInput> _$gCreateCommentInputSerializer =
    new _$GCreateCommentInputSerializer();
Serializer<GCreateFolderInput> _$gCreateFolderInputSerializer =
    new _$GCreateFolderInputSerializer();
Serializer<GCreateStickerInput> _$gCreateStickerInputSerializer =
    new _$GCreateStickerInputSerializer();
Serializer<GCreateUserInput> _$gCreateUserInputSerializer =
    new _$GCreateUserInputSerializer();
Serializer<GCreateWorkBookmarkInput> _$gCreateWorkBookmarkInputSerializer =
    new _$GCreateWorkBookmarkInputSerializer();
Serializer<GCreateWorkInput> _$gCreateWorkInputSerializer =
    new _$GCreateWorkInputSerializer();
Serializer<GCreateWorkLikeInput> _$gCreateWorkLikeInputSerializer =
    new _$GCreateWorkLikeInputSerializer();
Serializer<GDailyThemesWhereInput> _$gDailyThemesWhereInputSerializer =
    new _$GDailyThemesWhereInputSerializer();
Serializer<GDeleteCommentInput> _$gDeleteCommentInputSerializer =
    new _$GDeleteCommentInputSerializer();
Serializer<GDeleteFolderInput> _$gDeleteFolderInputSerializer =
    new _$GDeleteFolderInputSerializer();
Serializer<GDeleteStickerInput> _$gDeleteStickerInputSerializer =
    new _$GDeleteStickerInputSerializer();
Serializer<GDeleteWorkBookmarkInput> _$gDeleteWorkBookmarkInputSerializer =
    new _$GDeleteWorkBookmarkInputSerializer();
Serializer<GDeleteWorkInput> _$gDeleteWorkInputSerializer =
    new _$GDeleteWorkInputSerializer();
Serializer<GDeleteWorkLikeInput> _$gDeleteWorkLikeInputSerializer =
    new _$GDeleteWorkLikeInputSerializer();
Serializer<GFoldersWhereInput> _$gFoldersWhereInputSerializer =
    new _$GFoldersWhereInputSerializer();
Serializer<GFollowUserInput> _$gFollowUserInputSerializer =
    new _$GFollowUserInputSerializer();
Serializer<Glink__Purpose> _$glinkPurposeSerializer =
    new _$Glink__PurposeSerializer();
Serializer<GLoginWithPasswordInput> _$gLoginWithPasswordInputSerializer =
    new _$GLoginWithPasswordInputSerializer();
Serializer<GMuteTagInput> _$gMuteTagInputSerializer =
    new _$GMuteTagInputSerializer();
Serializer<GMuteUserInput> _$gMuteUserInputSerializer =
    new _$GMuteUserInputSerializer();
Serializer<GNotificationType> _$gNotificationTypeSerializer =
    new _$GNotificationTypeSerializer();
Serializer<GPopularWorksWhereInput> _$gPopularWorksWhereInputSerializer =
    new _$GPopularWorksWhereInputSerializer();
Serializer<GPostType> _$gPostTypeSerializer = new _$GPostTypeSerializer();
Serializer<GRating> _$gRatingSerializer = new _$GRatingSerializer();
Serializer<GStickersWhereInput> _$gStickersWhereInputSerializer =
    new _$GStickersWhereInputSerializer();
Serializer<GTagsWhereInput> _$gTagsWhereInputSerializer =
    new _$GTagsWhereInputSerializer();
Serializer<GUnfollowUserInput> _$gUnfollowUserInputSerializer =
    new _$GUnfollowUserInputSerializer();
Serializer<GUnmuteTagInput> _$gUnmuteTagInputSerializer =
    new _$GUnmuteTagInputSerializer();
Serializer<GUnmuteUserInput> _$gUnmuteUserInputSerializer =
    new _$GUnmuteUserInputSerializer();
Serializer<GUpdateFolderInput> _$gUpdateFolderInputSerializer =
    new _$GUpdateFolderInputSerializer();
Serializer<GUpdateStickerInput> _$gUpdateStickerInputSerializer =
    new _$GUpdateStickerInputSerializer();
Serializer<GUpdateUserProfileInput> _$gUpdateUserProfileInputSerializer =
    new _$GUpdateUserProfileInputSerializer();
Serializer<GUsersWhereInput> _$gUsersWhereInputSerializer =
    new _$GUsersWhereInputSerializer();
Serializer<GUserWorksWhereInput> _$gUserWorksWhereInputSerializer =
    new _$GUserWorksWhereInputSerializer();
Serializer<GWorkAwardsWhereInput> _$gWorkAwardsWhereInputSerializer =
    new _$GWorkAwardsWhereInputSerializer();
Serializer<GWorksWhereInput> _$gWorksWhereInputSerializer =
    new _$GWorksWhereInputSerializer();

class _$GAccessTypeSerializer implements PrimitiveSerializer<GAccessType> {
  @override
  final Iterable<Type> types = const <Type>[GAccessType];
  @override
  final String wireName = 'GAccessType';

  @override
  Object serialize(Serializers serializers, GAccessType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GAccessType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GAccessType.valueOf(serialized as String);
}

class _$GAwardsWhereInputSerializer
    implements StructuredSerializer<GAwardsWhereInput> {
  @override
  final Iterable<Type> types = const [GAwardsWhereInput, _$GAwardsWhereInput];
  @override
  final String wireName = 'GAwardsWhereInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAwardsWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAwardType)));
    }
    value = object.postType;
    if (value != null) {
      result
        ..add('postType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPostType)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.month;
    if (value != null) {
      result
        ..add('month')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GAwardsWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAwardsWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(GAwardType)) as GAwardType?;
          break;
        case 'postType':
          result.postType = serializers.deserialize(value,
              specifiedType: const FullType(GPostType)) as GPostType?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'month':
          result.month = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAwardTypeSerializer implements PrimitiveSerializer<GAwardType> {
  @override
  final Iterable<Type> types = const <Type>[GAwardType];
  @override
  final String wireName = 'GAwardType';

  @override
  Object serialize(Serializers serializers, GAwardType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GAwardType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GAwardType.valueOf(serialized as String);
}

class _$GCacheControlScopeSerializer
    implements PrimitiveSerializer<GCacheControlScope> {
  @override
  final Iterable<Type> types = const <Type>[GCacheControlScope];
  @override
  final String wireName = 'GCacheControlScope';

  @override
  Object serialize(Serializers serializers, GCacheControlScope object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GCacheControlScope deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GCacheControlScope.valueOf(serialized as String);
}

class _$GContributorTypeSerializer
    implements PrimitiveSerializer<GContributorType> {
  @override
  final Iterable<Type> types = const <Type>[GContributorType];
  @override
  final String wireName = 'GContributorType';

  @override
  Object serialize(Serializers serializers, GContributorType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GContributorType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GContributorType.valueOf(serialized as String);
}

class _$GCreateCommentInputSerializer
    implements StructuredSerializer<GCreateCommentInput> {
  @override
  final Iterable<Type> types = const [
    GCreateCommentInput,
    _$GCreateCommentInput
  ];
  @override
  final String wireName = 'GCreateCommentInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateCommentInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'commentId',
      serializers.serialize(object.commentId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateCommentInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateCommentInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'commentId':
          result.commentId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateFolderInputSerializer
    implements StructuredSerializer<GCreateFolderInput> {
  @override
  final Iterable<Type> types = const [GCreateFolderInput, _$GCreateFolderInput];
  @override
  final String wireName = 'GCreateFolderInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateFolderInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateFolderInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateFolderInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateStickerInputSerializer
    implements StructuredSerializer<GCreateStickerInput> {
  @override
  final Iterable<Type> types = const [
    GCreateStickerInput,
    _$GCreateStickerInput
  ];
  @override
  final String wireName = 'GCreateStickerInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateStickerInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateStickerInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateStickerInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateUserInputSerializer
    implements StructuredSerializer<GCreateUserInput> {
  @override
  final Iterable<Type> types = const [GCreateUserInput, _$GCreateUserInput];
  @override
  final String wireName = 'GCreateUserInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateUserInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'idToken',
      serializers.serialize(object.idToken,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateUserInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idToken':
          result.idToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkBookmarkInputSerializer
    implements StructuredSerializer<GCreateWorkBookmarkInput> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkBookmarkInput,
    _$GCreateWorkBookmarkInput
  ];
  @override
  final String wireName = 'GCreateWorkBookmarkInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkBookmarkInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'workId',
      serializers.serialize(object.workId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateWorkBookmarkInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkBookmarkInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'workId':
          result.workId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkInputSerializer
    implements StructuredSerializer<GCreateWorkInput> {
  @override
  final Iterable<Type> types = const [GCreateWorkInput, _$GCreateWorkInput];
  @override
  final String wireName = 'GCreateWorkInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateWorkInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateWorkInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkLikeInputSerializer
    implements StructuredSerializer<GCreateWorkLikeInput> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkLikeInput,
    _$GCreateWorkLikeInput
  ];
  @override
  final String wireName = 'GCreateWorkLikeInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkLikeInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'workId',
      serializers.serialize(object.workId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateWorkLikeInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkLikeInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'workId':
          result.workId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemesWhereInputSerializer
    implements StructuredSerializer<GDailyThemesWhereInput> {
  @override
  final Iterable<Type> types = const [
    GDailyThemesWhereInput,
    _$GDailyThemesWhereInput
  ];
  @override
  final String wireName = 'GDailyThemesWhereInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemesWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.month;
    if (value != null) {
      result
        ..add('month')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('startDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('endDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GDailyThemesWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemesWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'month':
          result.month = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteCommentInputSerializer
    implements StructuredSerializer<GDeleteCommentInput> {
  @override
  final Iterable<Type> types = const [
    GDeleteCommentInput,
    _$GDeleteCommentInput
  ];
  @override
  final String wireName = 'GDeleteCommentInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteCommentInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'commentId',
      serializers.serialize(object.commentId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDeleteCommentInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteCommentInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'commentId':
          result.commentId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteFolderInputSerializer
    implements StructuredSerializer<GDeleteFolderInput> {
  @override
  final Iterable<Type> types = const [GDeleteFolderInput, _$GDeleteFolderInput];
  @override
  final String wireName = 'GDeleteFolderInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteFolderInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'folderId',
      serializers.serialize(object.folderId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDeleteFolderInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteFolderInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'folderId':
          result.folderId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteStickerInputSerializer
    implements StructuredSerializer<GDeleteStickerInput> {
  @override
  final Iterable<Type> types = const [
    GDeleteStickerInput,
    _$GDeleteStickerInput
  ];
  @override
  final String wireName = 'GDeleteStickerInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteStickerInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'stickerId',
      serializers.serialize(object.stickerId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDeleteStickerInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteStickerInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stickerId':
          result.stickerId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteWorkBookmarkInputSerializer
    implements StructuredSerializer<GDeleteWorkBookmarkInput> {
  @override
  final Iterable<Type> types = const [
    GDeleteWorkBookmarkInput,
    _$GDeleteWorkBookmarkInput
  ];
  @override
  final String wireName = 'GDeleteWorkBookmarkInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteWorkBookmarkInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'workId',
      serializers.serialize(object.workId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDeleteWorkBookmarkInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteWorkBookmarkInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'workId':
          result.workId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteWorkInputSerializer
    implements StructuredSerializer<GDeleteWorkInput> {
  @override
  final Iterable<Type> types = const [GDeleteWorkInput, _$GDeleteWorkInput];
  @override
  final String wireName = 'GDeleteWorkInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDeleteWorkInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'workId',
      serializers.serialize(object.workId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDeleteWorkInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteWorkInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'workId':
          result.workId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteWorkLikeInputSerializer
    implements StructuredSerializer<GDeleteWorkLikeInput> {
  @override
  final Iterable<Type> types = const [
    GDeleteWorkLikeInput,
    _$GDeleteWorkLikeInput
  ];
  @override
  final String wireName = 'GDeleteWorkLikeInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteWorkLikeInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'workId',
      serializers.serialize(object.workId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDeleteWorkLikeInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteWorkLikeInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'workId':
          result.workId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFoldersWhereInputSerializer
    implements StructuredSerializer<GFoldersWhereInput> {
  @override
  final Iterable<Type> types = const [GFoldersWhereInput, _$GFoldersWhereInput];
  @override
  final String wireName = 'GFoldersWhereInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFoldersWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFoldersWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFoldersWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowUserInputSerializer
    implements StructuredSerializer<GFollowUserInput> {
  @override
  final Iterable<Type> types = const [GFollowUserInput, _$GFollowUserInput];
  @override
  final String wireName = 'GFollowUserInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFollowUserInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFollowUserInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowUserInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Glink__PurposeSerializer
    implements PrimitiveSerializer<Glink__Purpose> {
  @override
  final Iterable<Type> types = const <Type>[Glink__Purpose];
  @override
  final String wireName = 'Glink__Purpose';

  @override
  Object serialize(Serializers serializers, Glink__Purpose object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Glink__Purpose deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Glink__Purpose.valueOf(serialized as String);
}

class _$GLoginWithPasswordInputSerializer
    implements StructuredSerializer<GLoginWithPasswordInput> {
  @override
  final Iterable<Type> types = const [
    GLoginWithPasswordInput,
    _$GLoginWithPasswordInput
  ];
  @override
  final String wireName = 'GLoginWithPasswordInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoginWithPasswordInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GLoginWithPasswordInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoginWithPasswordInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteTagInputSerializer implements StructuredSerializer<GMuteTagInput> {
  @override
  final Iterable<Type> types = const [GMuteTagInput, _$GMuteTagInput];
  @override
  final String wireName = 'GMuteTagInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMuteTagInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'tagName',
      serializers.serialize(object.tagName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GMuteTagInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteTagInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tagName':
          result.tagName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteUserInputSerializer
    implements StructuredSerializer<GMuteUserInput> {
  @override
  final Iterable<Type> types = const [GMuteUserInput, _$GMuteUserInput];
  @override
  final String wireName = 'GMuteUserInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMuteUserInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GMuteUserInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteUserInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GNotificationTypeSerializer
    implements PrimitiveSerializer<GNotificationType> {
  @override
  final Iterable<Type> types = const <Type>[GNotificationType];
  @override
  final String wireName = 'GNotificationType';

  @override
  Object serialize(Serializers serializers, GNotificationType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GNotificationType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GNotificationType.valueOf(serialized as String);
}

class _$GPopularWorksWhereInputSerializer
    implements StructuredSerializer<GPopularWorksWhereInput> {
  @override
  final Iterable<Type> types = const [
    GPopularWorksWhereInput,
    _$GPopularWorksWhereInput
  ];
  @override
  final String wireName = 'GPopularWorksWhereInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPopularWorksWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GRating)));
    }
    return result;
  }

  @override
  GPopularWorksWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPopularWorksWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(GRating)) as GRating?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPostTypeSerializer implements PrimitiveSerializer<GPostType> {
  @override
  final Iterable<Type> types = const <Type>[GPostType];
  @override
  final String wireName = 'GPostType';

  @override
  Object serialize(Serializers serializers, GPostType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GPostType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GPostType.valueOf(serialized as String);
}

class _$GRatingSerializer implements PrimitiveSerializer<GRating> {
  @override
  final Iterable<Type> types = const <Type>[GRating];
  @override
  final String wireName = 'GRating';

  @override
  Object serialize(Serializers serializers, GRating object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GRating deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GRating.valueOf(serialized as String);
}

class _$GStickersWhereInputSerializer
    implements StructuredSerializer<GStickersWhereInput> {
  @override
  final Iterable<Type> types = const [
    GStickersWhereInput,
    _$GStickersWhereInput
  ];
  @override
  final String wireName = 'GStickersWhereInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickersWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GStickersWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickersWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GTagsWhereInputSerializer
    implements StructuredSerializer<GTagsWhereInput> {
  @override
  final Iterable<Type> types = const [GTagsWhereInput, _$GTagsWhereInput];
  @override
  final String wireName = 'GTagsWhereInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagsWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GTagsWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagsWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUnfollowUserInputSerializer
    implements StructuredSerializer<GUnfollowUserInput> {
  @override
  final Iterable<Type> types = const [GUnfollowUserInput, _$GUnfollowUserInput];
  @override
  final String wireName = 'GUnfollowUserInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUnfollowUserInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUnfollowUserInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUnfollowUserInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUnmuteTagInputSerializer
    implements StructuredSerializer<GUnmuteTagInput> {
  @override
  final Iterable<Type> types = const [GUnmuteTagInput, _$GUnmuteTagInput];
  @override
  final String wireName = 'GUnmuteTagInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUnmuteTagInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'tagName',
      serializers.serialize(object.tagName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUnmuteTagInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUnmuteTagInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tagName':
          result.tagName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUnmuteUserInputSerializer
    implements StructuredSerializer<GUnmuteUserInput> {
  @override
  final Iterable<Type> types = const [GUnmuteUserInput, _$GUnmuteUserInput];
  @override
  final String wireName = 'GUnmuteUserInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUnmuteUserInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUnmuteUserInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUnmuteUserInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateFolderInputSerializer
    implements StructuredSerializer<GUpdateFolderInput> {
  @override
  final Iterable<Type> types = const [GUpdateFolderInput, _$GUpdateFolderInput];
  @override
  final String wireName = 'GUpdateFolderInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateFolderInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'folderId',
      serializers.serialize(object.folderId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUpdateFolderInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateFolderInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'folderId':
          result.folderId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateStickerInputSerializer
    implements StructuredSerializer<GUpdateStickerInput> {
  @override
  final Iterable<Type> types = const [
    GUpdateStickerInput,
    _$GUpdateStickerInput
  ];
  @override
  final String wireName = 'GUpdateStickerInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateStickerInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'stickerId',
      serializers.serialize(object.stickerId,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUpdateStickerInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateStickerInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stickerId':
          result.stickerId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserProfileInputSerializer
    implements StructuredSerializer<GUpdateUserProfileInput> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileInput,
    _$GUpdateUserProfileInput
  ];
  @override
  final String wireName = 'GUpdateUserProfileInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserProfileInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUpdateUserProfileInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserProfileInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUsersWhereInputSerializer
    implements StructuredSerializer<GUsersWhereInput> {
  @override
  final Iterable<Type> types = const [GUsersWhereInput, _$GUsersWhereInput];
  @override
  final String wireName = 'GUsersWhereInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUsersWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUsersWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUsersWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserWorksWhereInputSerializer
    implements StructuredSerializer<GUserWorksWhereInput> {
  @override
  final Iterable<Type> types = const [
    GUserWorksWhereInput,
    _$GUserWorksWhereInput
  ];
  @override
  final String wireName = 'GUserWorksWhereInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserWorksWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUserWorksWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserWorksWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardsWhereInputSerializer
    implements StructuredSerializer<GWorkAwardsWhereInput> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardsWhereInput,
    _$GWorkAwardsWhereInput
  ];
  @override
  final String wireName = 'GWorkAwardsWhereInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardsWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAwardType)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.month;
    if (value != null) {
      result
        ..add('month')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weekIndex;
    if (value != null) {
      result
        ..add('weekIndex')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GWorkAwardsWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(GAwardType)) as GAwardType?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'month':
          result.month = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weekIndex':
          result.weekIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorksWhereInputSerializer
    implements StructuredSerializer<GWorksWhereInput> {
  @override
  final Iterable<Type> types = const [GWorksWhereInput, _$GWorksWhereInput];
  @override
  final String wireName = 'GWorksWhereInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorksWhereInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GRating)));
    }
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GWorksWhereInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorksWhereInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(GRating)) as GRating?;
          break;
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$G_Any extends G_Any {
  @override
  final String value;

  factory _$G_Any([void Function(G_AnyBuilder)? updates]) =>
      (new G_AnyBuilder()..update(updates))._build();

  _$G_Any._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'G_Any', 'value');
  }

  @override
  G_Any rebuild(void Function(G_AnyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  G_AnyBuilder toBuilder() => new G_AnyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is G_Any && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'G_Any')..add('value', value))
        .toString();
  }
}

class G_AnyBuilder implements Builder<G_Any, G_AnyBuilder> {
  _$G_Any? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  G_AnyBuilder();

  G_AnyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(G_Any other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$G_Any;
  }

  @override
  void update(void Function(G_AnyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  G_Any build() => _build();

  _$G_Any _build() {
    final _$result = _$v ??
        new _$G_Any._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'G_Any', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GAwardsWhereInput extends GAwardsWhereInput {
  @override
  final GAwardType? type;
  @override
  final GPostType? postType;
  @override
  final String? date;
  @override
  final int? year;
  @override
  final int? month;
  @override
  final int? day;

  factory _$GAwardsWhereInput(
          [void Function(GAwardsWhereInputBuilder)? updates]) =>
      (new GAwardsWhereInputBuilder()..update(updates))._build();

  _$GAwardsWhereInput._(
      {this.type, this.postType, this.date, this.year, this.month, this.day})
      : super._();

  @override
  GAwardsWhereInput rebuild(void Function(GAwardsWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAwardsWhereInputBuilder toBuilder() =>
      new GAwardsWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAwardsWhereInput &&
        type == other.type &&
        postType == other.postType &&
        date == other.date &&
        year == other.year &&
        month == other.month &&
        day == other.day;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, postType.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jc(_$hash, day.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAwardsWhereInput')
          ..add('type', type)
          ..add('postType', postType)
          ..add('date', date)
          ..add('year', year)
          ..add('month', month)
          ..add('day', day))
        .toString();
  }
}

class GAwardsWhereInputBuilder
    implements Builder<GAwardsWhereInput, GAwardsWhereInputBuilder> {
  _$GAwardsWhereInput? _$v;

  GAwardType? _type;
  GAwardType? get type => _$this._type;
  set type(GAwardType? type) => _$this._type = type;

  GPostType? _postType;
  GPostType? get postType => _$this._postType;
  set postType(GPostType? postType) => _$this._postType = postType;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  int? _month;
  int? get month => _$this._month;
  set month(int? month) => _$this._month = month;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  GAwardsWhereInputBuilder();

  GAwardsWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _postType = $v.postType;
      _date = $v.date;
      _year = $v.year;
      _month = $v.month;
      _day = $v.day;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAwardsWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAwardsWhereInput;
  }

  @override
  void update(void Function(GAwardsWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAwardsWhereInput build() => _build();

  _$GAwardsWhereInput _build() {
    final _$result = _$v ??
        new _$GAwardsWhereInput._(
            type: type,
            postType: postType,
            date: date,
            year: year,
            month: month,
            day: day);
    replace(_$result);
    return _$result;
  }
}

class _$GCreateCommentInput extends GCreateCommentInput {
  @override
  final String commentId;

  factory _$GCreateCommentInput(
          [void Function(GCreateCommentInputBuilder)? updates]) =>
      (new GCreateCommentInputBuilder()..update(updates))._build();

  _$GCreateCommentInput._({required this.commentId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        commentId, r'GCreateCommentInput', 'commentId');
  }

  @override
  GCreateCommentInput rebuild(
          void Function(GCreateCommentInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateCommentInputBuilder toBuilder() =>
      new GCreateCommentInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateCommentInput && commentId == other.commentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, commentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateCommentInput')
          ..add('commentId', commentId))
        .toString();
  }
}

class GCreateCommentInputBuilder
    implements Builder<GCreateCommentInput, GCreateCommentInputBuilder> {
  _$GCreateCommentInput? _$v;

  String? _commentId;
  String? get commentId => _$this._commentId;
  set commentId(String? commentId) => _$this._commentId = commentId;

  GCreateCommentInputBuilder();

  GCreateCommentInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _commentId = $v.commentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateCommentInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateCommentInput;
  }

  @override
  void update(void Function(GCreateCommentInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateCommentInput build() => _build();

  _$GCreateCommentInput _build() {
    final _$result = _$v ??
        new _$GCreateCommentInput._(
            commentId: BuiltValueNullFieldError.checkNotNull(
                commentId, r'GCreateCommentInput', 'commentId'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateFolderInput extends GCreateFolderInput {
  @override
  final String title;

  factory _$GCreateFolderInput(
          [void Function(GCreateFolderInputBuilder)? updates]) =>
      (new GCreateFolderInputBuilder()..update(updates))._build();

  _$GCreateFolderInput._({required this.title}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        title, r'GCreateFolderInput', 'title');
  }

  @override
  GCreateFolderInput rebuild(
          void Function(GCreateFolderInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateFolderInputBuilder toBuilder() =>
      new GCreateFolderInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateFolderInput && title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateFolderInput')
          ..add('title', title))
        .toString();
  }
}

class GCreateFolderInputBuilder
    implements Builder<GCreateFolderInput, GCreateFolderInputBuilder> {
  _$GCreateFolderInput? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GCreateFolderInputBuilder();

  GCreateFolderInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateFolderInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateFolderInput;
  }

  @override
  void update(void Function(GCreateFolderInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateFolderInput build() => _build();

  _$GCreateFolderInput _build() {
    final _$result = _$v ??
        new _$GCreateFolderInput._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GCreateFolderInput', 'title'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateStickerInput extends GCreateStickerInput {
  @override
  final String title;

  factory _$GCreateStickerInput(
          [void Function(GCreateStickerInputBuilder)? updates]) =>
      (new GCreateStickerInputBuilder()..update(updates))._build();

  _$GCreateStickerInput._({required this.title}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        title, r'GCreateStickerInput', 'title');
  }

  @override
  GCreateStickerInput rebuild(
          void Function(GCreateStickerInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateStickerInputBuilder toBuilder() =>
      new GCreateStickerInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateStickerInput && title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateStickerInput')
          ..add('title', title))
        .toString();
  }
}

class GCreateStickerInputBuilder
    implements Builder<GCreateStickerInput, GCreateStickerInputBuilder> {
  _$GCreateStickerInput? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GCreateStickerInputBuilder();

  GCreateStickerInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateStickerInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateStickerInput;
  }

  @override
  void update(void Function(GCreateStickerInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateStickerInput build() => _build();

  _$GCreateStickerInput _build() {
    final _$result = _$v ??
        new _$GCreateStickerInput._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GCreateStickerInput', 'title'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateUserInput extends GCreateUserInput {
  @override
  final String idToken;

  factory _$GCreateUserInput(
          [void Function(GCreateUserInputBuilder)? updates]) =>
      (new GCreateUserInputBuilder()..update(updates))._build();

  _$GCreateUserInput._({required this.idToken}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        idToken, r'GCreateUserInput', 'idToken');
  }

  @override
  GCreateUserInput rebuild(void Function(GCreateUserInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserInputBuilder toBuilder() =>
      new GCreateUserInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserInput && idToken == other.idToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, idToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateUserInput')
          ..add('idToken', idToken))
        .toString();
  }
}

class GCreateUserInputBuilder
    implements Builder<GCreateUserInput, GCreateUserInputBuilder> {
  _$GCreateUserInput? _$v;

  String? _idToken;
  String? get idToken => _$this._idToken;
  set idToken(String? idToken) => _$this._idToken = idToken;

  GCreateUserInputBuilder();

  GCreateUserInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idToken = $v.idToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserInput;
  }

  @override
  void update(void Function(GCreateUserInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserInput build() => _build();

  _$GCreateUserInput _build() {
    final _$result = _$v ??
        new _$GCreateUserInput._(
            idToken: BuiltValueNullFieldError.checkNotNull(
                idToken, r'GCreateUserInput', 'idToken'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkBookmarkInput extends GCreateWorkBookmarkInput {
  @override
  final String workId;

  factory _$GCreateWorkBookmarkInput(
          [void Function(GCreateWorkBookmarkInputBuilder)? updates]) =>
      (new GCreateWorkBookmarkInputBuilder()..update(updates))._build();

  _$GCreateWorkBookmarkInput._({required this.workId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        workId, r'GCreateWorkBookmarkInput', 'workId');
  }

  @override
  GCreateWorkBookmarkInput rebuild(
          void Function(GCreateWorkBookmarkInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkBookmarkInputBuilder toBuilder() =>
      new GCreateWorkBookmarkInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkBookmarkInput && workId == other.workId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkBookmarkInput')
          ..add('workId', workId))
        .toString();
  }
}

class GCreateWorkBookmarkInputBuilder
    implements
        Builder<GCreateWorkBookmarkInput, GCreateWorkBookmarkInputBuilder> {
  _$GCreateWorkBookmarkInput? _$v;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  GCreateWorkBookmarkInputBuilder();

  GCreateWorkBookmarkInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workId = $v.workId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkBookmarkInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkBookmarkInput;
  }

  @override
  void update(void Function(GCreateWorkBookmarkInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkBookmarkInput build() => _build();

  _$GCreateWorkBookmarkInput _build() {
    final _$result = _$v ??
        new _$GCreateWorkBookmarkInput._(
            workId: BuiltValueNullFieldError.checkNotNull(
                workId, r'GCreateWorkBookmarkInput', 'workId'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkInput extends GCreateWorkInput {
  @override
  final String title;

  factory _$GCreateWorkInput(
          [void Function(GCreateWorkInputBuilder)? updates]) =>
      (new GCreateWorkInputBuilder()..update(updates))._build();

  _$GCreateWorkInput._({required this.title}) : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'GCreateWorkInput', 'title');
  }

  @override
  GCreateWorkInput rebuild(void Function(GCreateWorkInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkInputBuilder toBuilder() =>
      new GCreateWorkInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkInput && title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkInput')
          ..add('title', title))
        .toString();
  }
}

class GCreateWorkInputBuilder
    implements Builder<GCreateWorkInput, GCreateWorkInputBuilder> {
  _$GCreateWorkInput? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GCreateWorkInputBuilder();

  GCreateWorkInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkInput;
  }

  @override
  void update(void Function(GCreateWorkInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkInput build() => _build();

  _$GCreateWorkInput _build() {
    final _$result = _$v ??
        new _$GCreateWorkInput._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GCreateWorkInput', 'title'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkLikeInput extends GCreateWorkLikeInput {
  @override
  final String workId;

  factory _$GCreateWorkLikeInput(
          [void Function(GCreateWorkLikeInputBuilder)? updates]) =>
      (new GCreateWorkLikeInputBuilder()..update(updates))._build();

  _$GCreateWorkLikeInput._({required this.workId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        workId, r'GCreateWorkLikeInput', 'workId');
  }

  @override
  GCreateWorkLikeInput rebuild(
          void Function(GCreateWorkLikeInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkLikeInputBuilder toBuilder() =>
      new GCreateWorkLikeInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkLikeInput && workId == other.workId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkLikeInput')
          ..add('workId', workId))
        .toString();
  }
}

class GCreateWorkLikeInputBuilder
    implements Builder<GCreateWorkLikeInput, GCreateWorkLikeInputBuilder> {
  _$GCreateWorkLikeInput? _$v;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  GCreateWorkLikeInputBuilder();

  GCreateWorkLikeInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workId = $v.workId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkLikeInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkLikeInput;
  }

  @override
  void update(void Function(GCreateWorkLikeInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkLikeInput build() => _build();

  _$GCreateWorkLikeInput _build() {
    final _$result = _$v ??
        new _$GCreateWorkLikeInput._(
            workId: BuiltValueNullFieldError.checkNotNull(
                workId, r'GCreateWorkLikeInput', 'workId'));
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemesWhereInput extends GDailyThemesWhereInput {
  @override
  final String? search;
  @override
  final int? year;
  @override
  final int? month;
  @override
  final int? day;
  @override
  final String? startDate;
  @override
  final String? endDate;

  factory _$GDailyThemesWhereInput(
          [void Function(GDailyThemesWhereInputBuilder)? updates]) =>
      (new GDailyThemesWhereInputBuilder()..update(updates))._build();

  _$GDailyThemesWhereInput._(
      {this.search,
      this.year,
      this.month,
      this.day,
      this.startDate,
      this.endDate})
      : super._();

  @override
  GDailyThemesWhereInput rebuild(
          void Function(GDailyThemesWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemesWhereInputBuilder toBuilder() =>
      new GDailyThemesWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemesWhereInput &&
        search == other.search &&
        year == other.year &&
        month == other.month &&
        day == other.day &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jc(_$hash, day.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemesWhereInput')
          ..add('search', search)
          ..add('year', year)
          ..add('month', month)
          ..add('day', day)
          ..add('startDate', startDate)
          ..add('endDate', endDate))
        .toString();
  }
}

class GDailyThemesWhereInputBuilder
    implements Builder<GDailyThemesWhereInput, GDailyThemesWhereInputBuilder> {
  _$GDailyThemesWhereInput? _$v;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  int? _month;
  int? get month => _$this._month;
  set month(int? month) => _$this._month = month;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  GDailyThemesWhereInputBuilder();

  GDailyThemesWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _search = $v.search;
      _year = $v.year;
      _month = $v.month;
      _day = $v.day;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemesWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemesWhereInput;
  }

  @override
  void update(void Function(GDailyThemesWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemesWhereInput build() => _build();

  _$GDailyThemesWhereInput _build() {
    final _$result = _$v ??
        new _$GDailyThemesWhereInput._(
            search: search,
            year: year,
            month: month,
            day: day,
            startDate: startDate,
            endDate: endDate);
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteCommentInput extends GDeleteCommentInput {
  @override
  final String commentId;

  factory _$GDeleteCommentInput(
          [void Function(GDeleteCommentInputBuilder)? updates]) =>
      (new GDeleteCommentInputBuilder()..update(updates))._build();

  _$GDeleteCommentInput._({required this.commentId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        commentId, r'GDeleteCommentInput', 'commentId');
  }

  @override
  GDeleteCommentInput rebuild(
          void Function(GDeleteCommentInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteCommentInputBuilder toBuilder() =>
      new GDeleteCommentInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteCommentInput && commentId == other.commentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, commentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteCommentInput')
          ..add('commentId', commentId))
        .toString();
  }
}

class GDeleteCommentInputBuilder
    implements Builder<GDeleteCommentInput, GDeleteCommentInputBuilder> {
  _$GDeleteCommentInput? _$v;

  String? _commentId;
  String? get commentId => _$this._commentId;
  set commentId(String? commentId) => _$this._commentId = commentId;

  GDeleteCommentInputBuilder();

  GDeleteCommentInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _commentId = $v.commentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteCommentInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteCommentInput;
  }

  @override
  void update(void Function(GDeleteCommentInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteCommentInput build() => _build();

  _$GDeleteCommentInput _build() {
    final _$result = _$v ??
        new _$GDeleteCommentInput._(
            commentId: BuiltValueNullFieldError.checkNotNull(
                commentId, r'GDeleteCommentInput', 'commentId'));
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteFolderInput extends GDeleteFolderInput {
  @override
  final String folderId;

  factory _$GDeleteFolderInput(
          [void Function(GDeleteFolderInputBuilder)? updates]) =>
      (new GDeleteFolderInputBuilder()..update(updates))._build();

  _$GDeleteFolderInput._({required this.folderId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        folderId, r'GDeleteFolderInput', 'folderId');
  }

  @override
  GDeleteFolderInput rebuild(
          void Function(GDeleteFolderInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteFolderInputBuilder toBuilder() =>
      new GDeleteFolderInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteFolderInput && folderId == other.folderId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, folderId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteFolderInput')
          ..add('folderId', folderId))
        .toString();
  }
}

class GDeleteFolderInputBuilder
    implements Builder<GDeleteFolderInput, GDeleteFolderInputBuilder> {
  _$GDeleteFolderInput? _$v;

  String? _folderId;
  String? get folderId => _$this._folderId;
  set folderId(String? folderId) => _$this._folderId = folderId;

  GDeleteFolderInputBuilder();

  GDeleteFolderInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folderId = $v.folderId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteFolderInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteFolderInput;
  }

  @override
  void update(void Function(GDeleteFolderInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteFolderInput build() => _build();

  _$GDeleteFolderInput _build() {
    final _$result = _$v ??
        new _$GDeleteFolderInput._(
            folderId: BuiltValueNullFieldError.checkNotNull(
                folderId, r'GDeleteFolderInput', 'folderId'));
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteStickerInput extends GDeleteStickerInput {
  @override
  final String stickerId;

  factory _$GDeleteStickerInput(
          [void Function(GDeleteStickerInputBuilder)? updates]) =>
      (new GDeleteStickerInputBuilder()..update(updates))._build();

  _$GDeleteStickerInput._({required this.stickerId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        stickerId, r'GDeleteStickerInput', 'stickerId');
  }

  @override
  GDeleteStickerInput rebuild(
          void Function(GDeleteStickerInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteStickerInputBuilder toBuilder() =>
      new GDeleteStickerInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteStickerInput && stickerId == other.stickerId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stickerId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteStickerInput')
          ..add('stickerId', stickerId))
        .toString();
  }
}

class GDeleteStickerInputBuilder
    implements Builder<GDeleteStickerInput, GDeleteStickerInputBuilder> {
  _$GDeleteStickerInput? _$v;

  String? _stickerId;
  String? get stickerId => _$this._stickerId;
  set stickerId(String? stickerId) => _$this._stickerId = stickerId;

  GDeleteStickerInputBuilder();

  GDeleteStickerInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stickerId = $v.stickerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteStickerInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteStickerInput;
  }

  @override
  void update(void Function(GDeleteStickerInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteStickerInput build() => _build();

  _$GDeleteStickerInput _build() {
    final _$result = _$v ??
        new _$GDeleteStickerInput._(
            stickerId: BuiltValueNullFieldError.checkNotNull(
                stickerId, r'GDeleteStickerInput', 'stickerId'));
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteWorkBookmarkInput extends GDeleteWorkBookmarkInput {
  @override
  final String workId;

  factory _$GDeleteWorkBookmarkInput(
          [void Function(GDeleteWorkBookmarkInputBuilder)? updates]) =>
      (new GDeleteWorkBookmarkInputBuilder()..update(updates))._build();

  _$GDeleteWorkBookmarkInput._({required this.workId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        workId, r'GDeleteWorkBookmarkInput', 'workId');
  }

  @override
  GDeleteWorkBookmarkInput rebuild(
          void Function(GDeleteWorkBookmarkInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteWorkBookmarkInputBuilder toBuilder() =>
      new GDeleteWorkBookmarkInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteWorkBookmarkInput && workId == other.workId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteWorkBookmarkInput')
          ..add('workId', workId))
        .toString();
  }
}

class GDeleteWorkBookmarkInputBuilder
    implements
        Builder<GDeleteWorkBookmarkInput, GDeleteWorkBookmarkInputBuilder> {
  _$GDeleteWorkBookmarkInput? _$v;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  GDeleteWorkBookmarkInputBuilder();

  GDeleteWorkBookmarkInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workId = $v.workId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteWorkBookmarkInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteWorkBookmarkInput;
  }

  @override
  void update(void Function(GDeleteWorkBookmarkInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteWorkBookmarkInput build() => _build();

  _$GDeleteWorkBookmarkInput _build() {
    final _$result = _$v ??
        new _$GDeleteWorkBookmarkInput._(
            workId: BuiltValueNullFieldError.checkNotNull(
                workId, r'GDeleteWorkBookmarkInput', 'workId'));
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteWorkInput extends GDeleteWorkInput {
  @override
  final String workId;

  factory _$GDeleteWorkInput(
          [void Function(GDeleteWorkInputBuilder)? updates]) =>
      (new GDeleteWorkInputBuilder()..update(updates))._build();

  _$GDeleteWorkInput._({required this.workId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        workId, r'GDeleteWorkInput', 'workId');
  }

  @override
  GDeleteWorkInput rebuild(void Function(GDeleteWorkInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteWorkInputBuilder toBuilder() =>
      new GDeleteWorkInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteWorkInput && workId == other.workId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteWorkInput')
          ..add('workId', workId))
        .toString();
  }
}

class GDeleteWorkInputBuilder
    implements Builder<GDeleteWorkInput, GDeleteWorkInputBuilder> {
  _$GDeleteWorkInput? _$v;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  GDeleteWorkInputBuilder();

  GDeleteWorkInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workId = $v.workId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteWorkInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteWorkInput;
  }

  @override
  void update(void Function(GDeleteWorkInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteWorkInput build() => _build();

  _$GDeleteWorkInput _build() {
    final _$result = _$v ??
        new _$GDeleteWorkInput._(
            workId: BuiltValueNullFieldError.checkNotNull(
                workId, r'GDeleteWorkInput', 'workId'));
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteWorkLikeInput extends GDeleteWorkLikeInput {
  @override
  final String workId;

  factory _$GDeleteWorkLikeInput(
          [void Function(GDeleteWorkLikeInputBuilder)? updates]) =>
      (new GDeleteWorkLikeInputBuilder()..update(updates))._build();

  _$GDeleteWorkLikeInput._({required this.workId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        workId, r'GDeleteWorkLikeInput', 'workId');
  }

  @override
  GDeleteWorkLikeInput rebuild(
          void Function(GDeleteWorkLikeInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteWorkLikeInputBuilder toBuilder() =>
      new GDeleteWorkLikeInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteWorkLikeInput && workId == other.workId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteWorkLikeInput')
          ..add('workId', workId))
        .toString();
  }
}

class GDeleteWorkLikeInputBuilder
    implements Builder<GDeleteWorkLikeInput, GDeleteWorkLikeInputBuilder> {
  _$GDeleteWorkLikeInput? _$v;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  GDeleteWorkLikeInputBuilder();

  GDeleteWorkLikeInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workId = $v.workId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteWorkLikeInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteWorkLikeInput;
  }

  @override
  void update(void Function(GDeleteWorkLikeInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteWorkLikeInput build() => _build();

  _$GDeleteWorkLikeInput _build() {
    final _$result = _$v ??
        new _$GDeleteWorkLikeInput._(
            workId: BuiltValueNullFieldError.checkNotNull(
                workId, r'GDeleteWorkLikeInput', 'workId'));
    replace(_$result);
    return _$result;
  }
}

class _$Gfederation__FieldSet extends Gfederation__FieldSet {
  @override
  final String value;

  factory _$Gfederation__FieldSet(
          [void Function(Gfederation__FieldSetBuilder)? updates]) =>
      (new Gfederation__FieldSetBuilder()..update(updates))._build();

  _$Gfederation__FieldSet._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'Gfederation__FieldSet', 'value');
  }

  @override
  Gfederation__FieldSet rebuild(
          void Function(Gfederation__FieldSetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Gfederation__FieldSetBuilder toBuilder() =>
      new Gfederation__FieldSetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Gfederation__FieldSet && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Gfederation__FieldSet')
          ..add('value', value))
        .toString();
  }
}

class Gfederation__FieldSetBuilder
    implements Builder<Gfederation__FieldSet, Gfederation__FieldSetBuilder> {
  _$Gfederation__FieldSet? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  Gfederation__FieldSetBuilder();

  Gfederation__FieldSetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Gfederation__FieldSet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Gfederation__FieldSet;
  }

  @override
  void update(void Function(Gfederation__FieldSetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Gfederation__FieldSet build() => _build();

  _$Gfederation__FieldSet _build() {
    final _$result = _$v ??
        new _$Gfederation__FieldSet._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'Gfederation__FieldSet', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GFoldersWhereInput extends GFoldersWhereInput {
  @override
  final String? search;

  factory _$GFoldersWhereInput(
          [void Function(GFoldersWhereInputBuilder)? updates]) =>
      (new GFoldersWhereInputBuilder()..update(updates))._build();

  _$GFoldersWhereInput._({this.search}) : super._();

  @override
  GFoldersWhereInput rebuild(
          void Function(GFoldersWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFoldersWhereInputBuilder toBuilder() =>
      new GFoldersWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFoldersWhereInput && search == other.search;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFoldersWhereInput')
          ..add('search', search))
        .toString();
  }
}

class GFoldersWhereInputBuilder
    implements Builder<GFoldersWhereInput, GFoldersWhereInputBuilder> {
  _$GFoldersWhereInput? _$v;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  GFoldersWhereInputBuilder();

  GFoldersWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFoldersWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFoldersWhereInput;
  }

  @override
  void update(void Function(GFoldersWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFoldersWhereInput build() => _build();

  _$GFoldersWhereInput _build() {
    final _$result = _$v ?? new _$GFoldersWhereInput._(search: search);
    replace(_$result);
    return _$result;
  }
}

class _$GFollowUserInput extends GFollowUserInput {
  @override
  final String userId;

  factory _$GFollowUserInput(
          [void Function(GFollowUserInputBuilder)? updates]) =>
      (new GFollowUserInputBuilder()..update(updates))._build();

  _$GFollowUserInput._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GFollowUserInput', 'userId');
  }

  @override
  GFollowUserInput rebuild(void Function(GFollowUserInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowUserInputBuilder toBuilder() =>
      new GFollowUserInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowUserInput && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFollowUserInput')
          ..add('userId', userId))
        .toString();
  }
}

class GFollowUserInputBuilder
    implements Builder<GFollowUserInput, GFollowUserInputBuilder> {
  _$GFollowUserInput? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GFollowUserInputBuilder();

  GFollowUserInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowUserInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFollowUserInput;
  }

  @override
  void update(void Function(GFollowUserInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFollowUserInput build() => _build();

  _$GFollowUserInput _build() {
    final _$result = _$v ??
        new _$GFollowUserInput._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GFollowUserInput', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$Glink__Import extends Glink__Import {
  @override
  final String value;

  factory _$Glink__Import([void Function(Glink__ImportBuilder)? updates]) =>
      (new Glink__ImportBuilder()..update(updates))._build();

  _$Glink__Import._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'Glink__Import', 'value');
  }

  @override
  Glink__Import rebuild(void Function(Glink__ImportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Glink__ImportBuilder toBuilder() => new Glink__ImportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Glink__Import && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Glink__Import')..add('value', value))
        .toString();
  }
}

class Glink__ImportBuilder
    implements Builder<Glink__Import, Glink__ImportBuilder> {
  _$Glink__Import? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  Glink__ImportBuilder();

  Glink__ImportBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Glink__Import other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Glink__Import;
  }

  @override
  void update(void Function(Glink__ImportBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Glink__Import build() => _build();

  _$Glink__Import _build() {
    final _$result = _$v ??
        new _$Glink__Import._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'Glink__Import', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GLoginWithPasswordInput extends GLoginWithPasswordInput {
  @override
  final String login;
  @override
  final String password;

  factory _$GLoginWithPasswordInput(
          [void Function(GLoginWithPasswordInputBuilder)? updates]) =>
      (new GLoginWithPasswordInputBuilder()..update(updates))._build();

  _$GLoginWithPasswordInput._({required this.login, required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        login, r'GLoginWithPasswordInput', 'login');
    BuiltValueNullFieldError.checkNotNull(
        password, r'GLoginWithPasswordInput', 'password');
  }

  @override
  GLoginWithPasswordInput rebuild(
          void Function(GLoginWithPasswordInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoginWithPasswordInputBuilder toBuilder() =>
      new GLoginWithPasswordInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoginWithPasswordInput &&
        login == other.login &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GLoginWithPasswordInput')
          ..add('login', login)
          ..add('password', password))
        .toString();
  }
}

class GLoginWithPasswordInputBuilder
    implements
        Builder<GLoginWithPasswordInput, GLoginWithPasswordInputBuilder> {
  _$GLoginWithPasswordInput? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  GLoginWithPasswordInputBuilder();

  GLoginWithPasswordInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoginWithPasswordInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoginWithPasswordInput;
  }

  @override
  void update(void Function(GLoginWithPasswordInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLoginWithPasswordInput build() => _build();

  _$GLoginWithPasswordInput _build() {
    final _$result = _$v ??
        new _$GLoginWithPasswordInput._(
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GLoginWithPasswordInput', 'login'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'GLoginWithPasswordInput', 'password'));
    replace(_$result);
    return _$result;
  }
}

class _$GMuteTagInput extends GMuteTagInput {
  @override
  final String tagName;

  factory _$GMuteTagInput([void Function(GMuteTagInputBuilder)? updates]) =>
      (new GMuteTagInputBuilder()..update(updates))._build();

  _$GMuteTagInput._({required this.tagName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(tagName, r'GMuteTagInput', 'tagName');
  }

  @override
  GMuteTagInput rebuild(void Function(GMuteTagInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteTagInputBuilder toBuilder() => new GMuteTagInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteTagInput && tagName == other.tagName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tagName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMuteTagInput')
          ..add('tagName', tagName))
        .toString();
  }
}

class GMuteTagInputBuilder
    implements Builder<GMuteTagInput, GMuteTagInputBuilder> {
  _$GMuteTagInput? _$v;

  String? _tagName;
  String? get tagName => _$this._tagName;
  set tagName(String? tagName) => _$this._tagName = tagName;

  GMuteTagInputBuilder();

  GMuteTagInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tagName = $v.tagName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteTagInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteTagInput;
  }

  @override
  void update(void Function(GMuteTagInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteTagInput build() => _build();

  _$GMuteTagInput _build() {
    final _$result = _$v ??
        new _$GMuteTagInput._(
            tagName: BuiltValueNullFieldError.checkNotNull(
                tagName, r'GMuteTagInput', 'tagName'));
    replace(_$result);
    return _$result;
  }
}

class _$GMuteUserInput extends GMuteUserInput {
  @override
  final String userId;

  factory _$GMuteUserInput([void Function(GMuteUserInputBuilder)? updates]) =>
      (new GMuteUserInputBuilder()..update(updates))._build();

  _$GMuteUserInput._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'GMuteUserInput', 'userId');
  }

  @override
  GMuteUserInput rebuild(void Function(GMuteUserInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteUserInputBuilder toBuilder() =>
      new GMuteUserInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteUserInput && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMuteUserInput')
          ..add('userId', userId))
        .toString();
  }
}

class GMuteUserInputBuilder
    implements Builder<GMuteUserInput, GMuteUserInputBuilder> {
  _$GMuteUserInput? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GMuteUserInputBuilder();

  GMuteUserInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteUserInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteUserInput;
  }

  @override
  void update(void Function(GMuteUserInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteUserInput build() => _build();

  _$GMuteUserInput _build() {
    final _$result = _$v ??
        new _$GMuteUserInput._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GMuteUserInput', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GPopularWorksWhereInput extends GPopularWorksWhereInput {
  @override
  final String? date;
  @override
  final GRating? rating;

  factory _$GPopularWorksWhereInput(
          [void Function(GPopularWorksWhereInputBuilder)? updates]) =>
      (new GPopularWorksWhereInputBuilder()..update(updates))._build();

  _$GPopularWorksWhereInput._({this.date, this.rating}) : super._();

  @override
  GPopularWorksWhereInput rebuild(
          void Function(GPopularWorksWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPopularWorksWhereInputBuilder toBuilder() =>
      new GPopularWorksWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPopularWorksWhereInput &&
        date == other.date &&
        rating == other.rating;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPopularWorksWhereInput')
          ..add('date', date)
          ..add('rating', rating))
        .toString();
  }
}

class GPopularWorksWhereInputBuilder
    implements
        Builder<GPopularWorksWhereInput, GPopularWorksWhereInputBuilder> {
  _$GPopularWorksWhereInput? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  GRating? _rating;
  GRating? get rating => _$this._rating;
  set rating(GRating? rating) => _$this._rating = rating;

  GPopularWorksWhereInputBuilder();

  GPopularWorksWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _rating = $v.rating;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPopularWorksWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPopularWorksWhereInput;
  }

  @override
  void update(void Function(GPopularWorksWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPopularWorksWhereInput build() => _build();

  _$GPopularWorksWhereInput _build() {
    final _$result =
        _$v ?? new _$GPopularWorksWhereInput._(date: date, rating: rating);
    replace(_$result);
    return _$result;
  }
}

class _$GStickersWhereInput extends GStickersWhereInput {
  @override
  final String? search;

  factory _$GStickersWhereInput(
          [void Function(GStickersWhereInputBuilder)? updates]) =>
      (new GStickersWhereInputBuilder()..update(updates))._build();

  _$GStickersWhereInput._({this.search}) : super._();

  @override
  GStickersWhereInput rebuild(
          void Function(GStickersWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickersWhereInputBuilder toBuilder() =>
      new GStickersWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickersWhereInput && search == other.search;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickersWhereInput')
          ..add('search', search))
        .toString();
  }
}

class GStickersWhereInputBuilder
    implements Builder<GStickersWhereInput, GStickersWhereInputBuilder> {
  _$GStickersWhereInput? _$v;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  GStickersWhereInputBuilder();

  GStickersWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickersWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickersWhereInput;
  }

  @override
  void update(void Function(GStickersWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickersWhereInput build() => _build();

  _$GStickersWhereInput _build() {
    final _$result = _$v ?? new _$GStickersWhereInput._(search: search);
    replace(_$result);
    return _$result;
  }
}

class _$GTagsWhereInput extends GTagsWhereInput {
  @override
  final String? search;

  factory _$GTagsWhereInput([void Function(GTagsWhereInputBuilder)? updates]) =>
      (new GTagsWhereInputBuilder()..update(updates))._build();

  _$GTagsWhereInput._({this.search}) : super._();

  @override
  GTagsWhereInput rebuild(void Function(GTagsWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagsWhereInputBuilder toBuilder() =>
      new GTagsWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagsWhereInput && search == other.search;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagsWhereInput')
          ..add('search', search))
        .toString();
  }
}

class GTagsWhereInputBuilder
    implements Builder<GTagsWhereInput, GTagsWhereInputBuilder> {
  _$GTagsWhereInput? _$v;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  GTagsWhereInputBuilder();

  GTagsWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagsWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagsWhereInput;
  }

  @override
  void update(void Function(GTagsWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagsWhereInput build() => _build();

  _$GTagsWhereInput _build() {
    final _$result = _$v ?? new _$GTagsWhereInput._(search: search);
    replace(_$result);
    return _$result;
  }
}

class _$GUnfollowUserInput extends GUnfollowUserInput {
  @override
  final String userId;

  factory _$GUnfollowUserInput(
          [void Function(GUnfollowUserInputBuilder)? updates]) =>
      (new GUnfollowUserInputBuilder()..update(updates))._build();

  _$GUnfollowUserInput._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GUnfollowUserInput', 'userId');
  }

  @override
  GUnfollowUserInput rebuild(
          void Function(GUnfollowUserInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUnfollowUserInputBuilder toBuilder() =>
      new GUnfollowUserInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUnfollowUserInput && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUnfollowUserInput')
          ..add('userId', userId))
        .toString();
  }
}

class GUnfollowUserInputBuilder
    implements Builder<GUnfollowUserInput, GUnfollowUserInputBuilder> {
  _$GUnfollowUserInput? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GUnfollowUserInputBuilder();

  GUnfollowUserInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUnfollowUserInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUnfollowUserInput;
  }

  @override
  void update(void Function(GUnfollowUserInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUnfollowUserInput build() => _build();

  _$GUnfollowUserInput _build() {
    final _$result = _$v ??
        new _$GUnfollowUserInput._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GUnfollowUserInput', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GUnmuteTagInput extends GUnmuteTagInput {
  @override
  final String tagName;

  factory _$GUnmuteTagInput([void Function(GUnmuteTagInputBuilder)? updates]) =>
      (new GUnmuteTagInputBuilder()..update(updates))._build();

  _$GUnmuteTagInput._({required this.tagName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        tagName, r'GUnmuteTagInput', 'tagName');
  }

  @override
  GUnmuteTagInput rebuild(void Function(GUnmuteTagInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUnmuteTagInputBuilder toBuilder() =>
      new GUnmuteTagInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUnmuteTagInput && tagName == other.tagName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tagName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUnmuteTagInput')
          ..add('tagName', tagName))
        .toString();
  }
}

class GUnmuteTagInputBuilder
    implements Builder<GUnmuteTagInput, GUnmuteTagInputBuilder> {
  _$GUnmuteTagInput? _$v;

  String? _tagName;
  String? get tagName => _$this._tagName;
  set tagName(String? tagName) => _$this._tagName = tagName;

  GUnmuteTagInputBuilder();

  GUnmuteTagInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tagName = $v.tagName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUnmuteTagInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUnmuteTagInput;
  }

  @override
  void update(void Function(GUnmuteTagInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUnmuteTagInput build() => _build();

  _$GUnmuteTagInput _build() {
    final _$result = _$v ??
        new _$GUnmuteTagInput._(
            tagName: BuiltValueNullFieldError.checkNotNull(
                tagName, r'GUnmuteTagInput', 'tagName'));
    replace(_$result);
    return _$result;
  }
}

class _$GUnmuteUserInput extends GUnmuteUserInput {
  @override
  final String userId;

  factory _$GUnmuteUserInput(
          [void Function(GUnmuteUserInputBuilder)? updates]) =>
      (new GUnmuteUserInputBuilder()..update(updates))._build();

  _$GUnmuteUserInput._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GUnmuteUserInput', 'userId');
  }

  @override
  GUnmuteUserInput rebuild(void Function(GUnmuteUserInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUnmuteUserInputBuilder toBuilder() =>
      new GUnmuteUserInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUnmuteUserInput && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUnmuteUserInput')
          ..add('userId', userId))
        .toString();
  }
}

class GUnmuteUserInputBuilder
    implements Builder<GUnmuteUserInput, GUnmuteUserInputBuilder> {
  _$GUnmuteUserInput? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GUnmuteUserInputBuilder();

  GUnmuteUserInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUnmuteUserInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUnmuteUserInput;
  }

  @override
  void update(void Function(GUnmuteUserInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUnmuteUserInput build() => _build();

  _$GUnmuteUserInput _build() {
    final _$result = _$v ??
        new _$GUnmuteUserInput._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GUnmuteUserInput', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateFolderInput extends GUpdateFolderInput {
  @override
  final String folderId;

  factory _$GUpdateFolderInput(
          [void Function(GUpdateFolderInputBuilder)? updates]) =>
      (new GUpdateFolderInputBuilder()..update(updates))._build();

  _$GUpdateFolderInput._({required this.folderId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        folderId, r'GUpdateFolderInput', 'folderId');
  }

  @override
  GUpdateFolderInput rebuild(
          void Function(GUpdateFolderInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateFolderInputBuilder toBuilder() =>
      new GUpdateFolderInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateFolderInput && folderId == other.folderId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, folderId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateFolderInput')
          ..add('folderId', folderId))
        .toString();
  }
}

class GUpdateFolderInputBuilder
    implements Builder<GUpdateFolderInput, GUpdateFolderInputBuilder> {
  _$GUpdateFolderInput? _$v;

  String? _folderId;
  String? get folderId => _$this._folderId;
  set folderId(String? folderId) => _$this._folderId = folderId;

  GUpdateFolderInputBuilder();

  GUpdateFolderInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folderId = $v.folderId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateFolderInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateFolderInput;
  }

  @override
  void update(void Function(GUpdateFolderInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateFolderInput build() => _build();

  _$GUpdateFolderInput _build() {
    final _$result = _$v ??
        new _$GUpdateFolderInput._(
            folderId: BuiltValueNullFieldError.checkNotNull(
                folderId, r'GUpdateFolderInput', 'folderId'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateStickerInput extends GUpdateStickerInput {
  @override
  final String stickerId;
  @override
  final String title;

  factory _$GUpdateStickerInput(
          [void Function(GUpdateStickerInputBuilder)? updates]) =>
      (new GUpdateStickerInputBuilder()..update(updates))._build();

  _$GUpdateStickerInput._({required this.stickerId, required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        stickerId, r'GUpdateStickerInput', 'stickerId');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUpdateStickerInput', 'title');
  }

  @override
  GUpdateStickerInput rebuild(
          void Function(GUpdateStickerInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateStickerInputBuilder toBuilder() =>
      new GUpdateStickerInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateStickerInput &&
        stickerId == other.stickerId &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stickerId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateStickerInput')
          ..add('stickerId', stickerId)
          ..add('title', title))
        .toString();
  }
}

class GUpdateStickerInputBuilder
    implements Builder<GUpdateStickerInput, GUpdateStickerInputBuilder> {
  _$GUpdateStickerInput? _$v;

  String? _stickerId;
  String? get stickerId => _$this._stickerId;
  set stickerId(String? stickerId) => _$this._stickerId = stickerId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GUpdateStickerInputBuilder();

  GUpdateStickerInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stickerId = $v.stickerId;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateStickerInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateStickerInput;
  }

  @override
  void update(void Function(GUpdateStickerInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateStickerInput build() => _build();

  _$GUpdateStickerInput _build() {
    final _$result = _$v ??
        new _$GUpdateStickerInput._(
            stickerId: BuiltValueNullFieldError.checkNotNull(
                stickerId, r'GUpdateStickerInput', 'stickerId'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GUpdateStickerInput', 'title'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserProfileInput extends GUpdateUserProfileInput {
  @override
  final String userId;

  factory _$GUpdateUserProfileInput(
          [void Function(GUpdateUserProfileInputBuilder)? updates]) =>
      (new GUpdateUserProfileInputBuilder()..update(updates))._build();

  _$GUpdateUserProfileInput._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GUpdateUserProfileInput', 'userId');
  }

  @override
  GUpdateUserProfileInput rebuild(
          void Function(GUpdateUserProfileInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileInputBuilder toBuilder() =>
      new GUpdateUserProfileInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserProfileInput && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateUserProfileInput')
          ..add('userId', userId))
        .toString();
  }
}

class GUpdateUserProfileInputBuilder
    implements
        Builder<GUpdateUserProfileInput, GUpdateUserProfileInputBuilder> {
  _$GUpdateUserProfileInput? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GUpdateUserProfileInputBuilder();

  GUpdateUserProfileInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserProfileInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserProfileInput;
  }

  @override
  void update(void Function(GUpdateUserProfileInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserProfileInput build() => _build();

  _$GUpdateUserProfileInput _build() {
    final _$result = _$v ??
        new _$GUpdateUserProfileInput._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GUpdateUserProfileInput', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GUsersWhereInput extends GUsersWhereInput {
  @override
  final String? search;

  factory _$GUsersWhereInput(
          [void Function(GUsersWhereInputBuilder)? updates]) =>
      (new GUsersWhereInputBuilder()..update(updates))._build();

  _$GUsersWhereInput._({this.search}) : super._();

  @override
  GUsersWhereInput rebuild(void Function(GUsersWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUsersWhereInputBuilder toBuilder() =>
      new GUsersWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersWhereInput && search == other.search;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUsersWhereInput')
          ..add('search', search))
        .toString();
  }
}

class GUsersWhereInputBuilder
    implements Builder<GUsersWhereInput, GUsersWhereInputBuilder> {
  _$GUsersWhereInput? _$v;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  GUsersWhereInputBuilder();

  GUsersWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUsersWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUsersWhereInput;
  }

  @override
  void update(void Function(GUsersWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersWhereInput build() => _build();

  _$GUsersWhereInput _build() {
    final _$result = _$v ?? new _$GUsersWhereInput._(search: search);
    replace(_$result);
    return _$result;
  }
}

class _$GUserWorksWhereInput extends GUserWorksWhereInput {
  @override
  final String? search;

  factory _$GUserWorksWhereInput(
          [void Function(GUserWorksWhereInputBuilder)? updates]) =>
      (new GUserWorksWhereInputBuilder()..update(updates))._build();

  _$GUserWorksWhereInput._({this.search}) : super._();

  @override
  GUserWorksWhereInput rebuild(
          void Function(GUserWorksWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserWorksWhereInputBuilder toBuilder() =>
      new GUserWorksWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserWorksWhereInput && search == other.search;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserWorksWhereInput')
          ..add('search', search))
        .toString();
  }
}

class GUserWorksWhereInputBuilder
    implements Builder<GUserWorksWhereInput, GUserWorksWhereInputBuilder> {
  _$GUserWorksWhereInput? _$v;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  GUserWorksWhereInputBuilder();

  GUserWorksWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserWorksWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserWorksWhereInput;
  }

  @override
  void update(void Function(GUserWorksWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserWorksWhereInput build() => _build();

  _$GUserWorksWhereInput _build() {
    final _$result = _$v ?? new _$GUserWorksWhereInput._(search: search);
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardsWhereInput extends GWorkAwardsWhereInput {
  @override
  final GAwardType? type;
  @override
  final String? date;
  @override
  final int? year;
  @override
  final int? month;
  @override
  final int? day;
  @override
  final int? weekIndex;

  factory _$GWorkAwardsWhereInput(
          [void Function(GWorkAwardsWhereInputBuilder)? updates]) =>
      (new GWorkAwardsWhereInputBuilder()..update(updates))._build();

  _$GWorkAwardsWhereInput._(
      {this.type, this.date, this.year, this.month, this.day, this.weekIndex})
      : super._();

  @override
  GWorkAwardsWhereInput rebuild(
          void Function(GWorkAwardsWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsWhereInputBuilder toBuilder() =>
      new GWorkAwardsWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsWhereInput &&
        type == other.type &&
        date == other.date &&
        year == other.year &&
        month == other.month &&
        day == other.day &&
        weekIndex == other.weekIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jc(_$hash, day.hashCode);
    _$hash = $jc(_$hash, weekIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkAwardsWhereInput')
          ..add('type', type)
          ..add('date', date)
          ..add('year', year)
          ..add('month', month)
          ..add('day', day)
          ..add('weekIndex', weekIndex))
        .toString();
  }
}

class GWorkAwardsWhereInputBuilder
    implements Builder<GWorkAwardsWhereInput, GWorkAwardsWhereInputBuilder> {
  _$GWorkAwardsWhereInput? _$v;

  GAwardType? _type;
  GAwardType? get type => _$this._type;
  set type(GAwardType? type) => _$this._type = type;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  int? _month;
  int? get month => _$this._month;
  set month(int? month) => _$this._month = month;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  int? _weekIndex;
  int? get weekIndex => _$this._weekIndex;
  set weekIndex(int? weekIndex) => _$this._weekIndex = weekIndex;

  GWorkAwardsWhereInputBuilder();

  GWorkAwardsWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _date = $v.date;
      _year = $v.year;
      _month = $v.month;
      _day = $v.day;
      _weekIndex = $v.weekIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkAwardsWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsWhereInput;
  }

  @override
  void update(void Function(GWorkAwardsWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsWhereInput build() => _build();

  _$GWorkAwardsWhereInput _build() {
    final _$result = _$v ??
        new _$GWorkAwardsWhereInput._(
            type: type,
            date: date,
            year: year,
            month: month,
            day: day,
            weekIndex: weekIndex);
    replace(_$result);
    return _$result;
  }
}

class _$GWorksWhereInput extends GWorksWhereInput {
  @override
  final GRating? rating;
  @override
  final String? search;

  factory _$GWorksWhereInput(
          [void Function(GWorksWhereInputBuilder)? updates]) =>
      (new GWorksWhereInputBuilder()..update(updates))._build();

  _$GWorksWhereInput._({this.rating, this.search}) : super._();

  @override
  GWorksWhereInput rebuild(void Function(GWorksWhereInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorksWhereInputBuilder toBuilder() =>
      new GWorksWhereInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorksWhereInput &&
        rating == other.rating &&
        search == other.search;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorksWhereInput')
          ..add('rating', rating)
          ..add('search', search))
        .toString();
  }
}

class GWorksWhereInputBuilder
    implements Builder<GWorksWhereInput, GWorksWhereInputBuilder> {
  _$GWorksWhereInput? _$v;

  GRating? _rating;
  GRating? get rating => _$this._rating;
  set rating(GRating? rating) => _$this._rating = rating;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  GWorksWhereInputBuilder();

  GWorksWhereInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rating = $v.rating;
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorksWhereInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorksWhereInput;
  }

  @override
  void update(void Function(GWorksWhereInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorksWhereInput build() => _build();

  _$GWorksWhereInput _build() {
    final _$result =
        _$v ?? new _$GWorksWhereInput._(rating: rating, search: search);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
