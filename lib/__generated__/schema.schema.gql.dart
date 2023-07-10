// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;

part 'schema.schema.gql.g.dart';

abstract class G_Any implements Built<G_Any, G_AnyBuilder> {
  G_Any._();

  factory G_Any([String? value]) =>
      _$G_Any((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<G_Any> get serializer => _i1.DefaultScalarSerializer<G_Any>(
      (Object serialized) => G_Any((serialized as String?)));
}

class GAccessType extends EnumClass {
  const GAccessType._(String name) : super(name);

  static const GAccessType PUBLIC = _$gAccessTypePUBLIC;

  static const GAccessType SILENT = _$gAccessTypeSILENT;

  static const GAccessType PRIVATE = _$gAccessTypePRIVATE;

  static const GAccessType LIMITED = _$gAccessTypeLIMITED;

  static Serializer<GAccessType> get serializer => _$gAccessTypeSerializer;
  static BuiltSet<GAccessType> get values => _$gAccessTypeValues;
  static GAccessType valueOf(String name) => _$gAccessTypeValueOf(name);
}

abstract class GAwardsWhereInput
    implements Built<GAwardsWhereInput, GAwardsWhereInputBuilder> {
  GAwardsWhereInput._();

  factory GAwardsWhereInput([Function(GAwardsWhereInputBuilder b) updates]) =
      _$GAwardsWhereInput;

  GAwardType? get type;
  GPostType? get postType;
  String? get date;
  int? get year;
  int? get month;
  int? get day;
  static Serializer<GAwardsWhereInput> get serializer =>
      _$gAwardsWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GAwardsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAwardsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GAwardsWhereInput.serializer,
        json,
      );
}

class GAwardType extends EnumClass {
  const GAwardType._(String name) : super(name);

  static const GAwardType MONTHLY = _$gAwardTypeMONTHLY;

  static const GAwardType WEEKLY = _$gAwardTypeWEEKLY;

  static const GAwardType DAILY = _$gAwardTypeDAILY;

  static const GAwardType DAILY_NO_THEME = _$gAwardTypeDAILY_NO_THEME;

  static Serializer<GAwardType> get serializer => _$gAwardTypeSerializer;
  static BuiltSet<GAwardType> get values => _$gAwardTypeValues;
  static GAwardType valueOf(String name) => _$gAwardTypeValueOf(name);
}

class GCacheControlScope extends EnumClass {
  const GCacheControlScope._(String name) : super(name);

  static const GCacheControlScope PUBLIC = _$gCacheControlScopePUBLIC;

  static const GCacheControlScope PRIVATE = _$gCacheControlScopePRIVATE;

  static Serializer<GCacheControlScope> get serializer =>
      _$gCacheControlScopeSerializer;
  static BuiltSet<GCacheControlScope> get values => _$gCacheControlScopeValues;
  static GCacheControlScope valueOf(String name) =>
      _$gCacheControlScopeValueOf(name);
}

class GContributorType extends EnumClass {
  const GContributorType._(String name) : super(name);

  static const GContributorType WIKI_EDITOR = _$gContributorTypeWIKI_EDITOR;

  static const GContributorType WEB_DEVELOPER = _$gContributorTypeWEB_DEVELOPER;

  static const GContributorType FLUTTER_DEVELOPER =
      _$gContributorTypeFLUTTER_DEVELOPER;

  static const GContributorType PRODUCT_DESIGNER =
      _$gContributorTypePRODUCT_DESIGNER;

  static const GContributorType SUPPORTER = _$gContributorTypeSUPPORTER;

  static Serializer<GContributorType> get serializer =>
      _$gContributorTypeSerializer;
  static BuiltSet<GContributorType> get values => _$gContributorTypeValues;
  static GContributorType valueOf(String name) =>
      _$gContributorTypeValueOf(name);
}

abstract class GCreateFolderInput
    implements Built<GCreateFolderInput, GCreateFolderInputBuilder> {
  GCreateFolderInput._();

  factory GCreateFolderInput([Function(GCreateFolderInputBuilder b) updates]) =
      _$GCreateFolderInput;

  String get title;
  static Serializer<GCreateFolderInput> get serializer =>
      _$gCreateFolderInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateFolderInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateFolderInput.serializer,
        json,
      );
}

abstract class GCreateResponseCommentInput
    implements
        Built<GCreateResponseCommentInput, GCreateResponseCommentInputBuilder> {
  GCreateResponseCommentInput._();

  factory GCreateResponseCommentInput(
          [Function(GCreateResponseCommentInputBuilder b) updates]) =
      _$GCreateResponseCommentInput;

  String get commentId;
  String get text;
  static Serializer<GCreateResponseCommentInput> get serializer =>
      _$gCreateResponseCommentInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateResponseCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateResponseCommentInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateResponseCommentInput.serializer,
        json,
      );
}

abstract class GCreateStickerInput
    implements Built<GCreateStickerInput, GCreateStickerInputBuilder> {
  GCreateStickerInput._();

  factory GCreateStickerInput(
      [Function(GCreateStickerInputBuilder b) updates]) = _$GCreateStickerInput;

  String get title;
  static Serializer<GCreateStickerInput> get serializer =>
      _$gCreateStickerInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateStickerInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateStickerInput.serializer,
        json,
      );
}

abstract class GCreateUserInput
    implements Built<GCreateUserInput, GCreateUserInputBuilder> {
  GCreateUserInput._();

  factory GCreateUserInput([Function(GCreateUserInputBuilder b) updates]) =
      _$GCreateUserInput;

  String get idToken;
  static Serializer<GCreateUserInput> get serializer =>
      _$gCreateUserInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateUserInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateUserInput.serializer,
        json,
      );
}

abstract class GCreateWorkBookmarkInput
    implements
        Built<GCreateWorkBookmarkInput, GCreateWorkBookmarkInputBuilder> {
  GCreateWorkBookmarkInput._();

  factory GCreateWorkBookmarkInput(
          [Function(GCreateWorkBookmarkInputBuilder b) updates]) =
      _$GCreateWorkBookmarkInput;

  String get workId;
  static Serializer<GCreateWorkBookmarkInput> get serializer =>
      _$gCreateWorkBookmarkInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateWorkBookmarkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkBookmarkInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateWorkBookmarkInput.serializer,
        json,
      );
}

abstract class GCreateWorkCommentInput
    implements Built<GCreateWorkCommentInput, GCreateWorkCommentInputBuilder> {
  GCreateWorkCommentInput._();

  factory GCreateWorkCommentInput(
          [Function(GCreateWorkCommentInputBuilder b) updates]) =
      _$GCreateWorkCommentInput;

  String get workId;
  String get text;
  static Serializer<GCreateWorkCommentInput> get serializer =>
      _$gCreateWorkCommentInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateWorkCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkCommentInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateWorkCommentInput.serializer,
        json,
      );
}

abstract class GCreateWorkInput
    implements Built<GCreateWorkInput, GCreateWorkInputBuilder> {
  GCreateWorkInput._();

  factory GCreateWorkInput([Function(GCreateWorkInputBuilder b) updates]) =
      _$GCreateWorkInput;

  String get title;
  static Serializer<GCreateWorkInput> get serializer =>
      _$gCreateWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateWorkInput.serializer,
        json,
      );
}

abstract class GCreateWorkLikeInput
    implements Built<GCreateWorkLikeInput, GCreateWorkLikeInputBuilder> {
  GCreateWorkLikeInput._();

  factory GCreateWorkLikeInput(
          [Function(GCreateWorkLikeInputBuilder b) updates]) =
      _$GCreateWorkLikeInput;

  String get workId;
  static Serializer<GCreateWorkLikeInput> get serializer =>
      _$gCreateWorkLikeInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateWorkLikeInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkLikeInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateWorkLikeInput.serializer,
        json,
      );
}

abstract class GDailyThemesWhereInput
    implements Built<GDailyThemesWhereInput, GDailyThemesWhereInputBuilder> {
  GDailyThemesWhereInput._();

  factory GDailyThemesWhereInput(
          [Function(GDailyThemesWhereInputBuilder b) updates]) =
      _$GDailyThemesWhereInput;

  String? get search;
  int? get year;
  int? get month;
  int? get day;
  String? get startDate;
  String? get endDate;
  static Serializer<GDailyThemesWhereInput> get serializer =>
      _$gDailyThemesWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDailyThemesWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemesWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDailyThemesWhereInput.serializer,
        json,
      );
}

abstract class GDeleteCommentInput
    implements Built<GDeleteCommentInput, GDeleteCommentInputBuilder> {
  GDeleteCommentInput._();

  factory GDeleteCommentInput(
      [Function(GDeleteCommentInputBuilder b) updates]) = _$GDeleteCommentInput;

  String get commentId;
  static Serializer<GDeleteCommentInput> get serializer =>
      _$gDeleteCommentInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteCommentInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteCommentInput.serializer,
        json,
      );
}

abstract class GDeleteFolderInput
    implements Built<GDeleteFolderInput, GDeleteFolderInputBuilder> {
  GDeleteFolderInput._();

  factory GDeleteFolderInput([Function(GDeleteFolderInputBuilder b) updates]) =
      _$GDeleteFolderInput;

  String get folderId;
  static Serializer<GDeleteFolderInput> get serializer =>
      _$gDeleteFolderInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteFolderInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteFolderInput.serializer,
        json,
      );
}

abstract class GDeleteStickerInput
    implements Built<GDeleteStickerInput, GDeleteStickerInputBuilder> {
  GDeleteStickerInput._();

  factory GDeleteStickerInput(
      [Function(GDeleteStickerInputBuilder b) updates]) = _$GDeleteStickerInput;

  String get stickerId;
  static Serializer<GDeleteStickerInput> get serializer =>
      _$gDeleteStickerInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteStickerInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteStickerInput.serializer,
        json,
      );
}

abstract class GDeleteWorkBookmarkInput
    implements
        Built<GDeleteWorkBookmarkInput, GDeleteWorkBookmarkInputBuilder> {
  GDeleteWorkBookmarkInput._();

  factory GDeleteWorkBookmarkInput(
          [Function(GDeleteWorkBookmarkInputBuilder b) updates]) =
      _$GDeleteWorkBookmarkInput;

  String get workId;
  static Serializer<GDeleteWorkBookmarkInput> get serializer =>
      _$gDeleteWorkBookmarkInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteWorkBookmarkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteWorkBookmarkInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteWorkBookmarkInput.serializer,
        json,
      );
}

abstract class GDeleteWorkInput
    implements Built<GDeleteWorkInput, GDeleteWorkInputBuilder> {
  GDeleteWorkInput._();

  factory GDeleteWorkInput([Function(GDeleteWorkInputBuilder b) updates]) =
      _$GDeleteWorkInput;

  String get workId;
  static Serializer<GDeleteWorkInput> get serializer =>
      _$gDeleteWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteWorkInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteWorkInput.serializer,
        json,
      );
}

abstract class GDeleteWorkLikeInput
    implements Built<GDeleteWorkLikeInput, GDeleteWorkLikeInputBuilder> {
  GDeleteWorkLikeInput._();

  factory GDeleteWorkLikeInput(
          [Function(GDeleteWorkLikeInputBuilder b) updates]) =
      _$GDeleteWorkLikeInput;

  String get workId;
  static Serializer<GDeleteWorkLikeInput> get serializer =>
      _$gDeleteWorkLikeInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteWorkLikeInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteWorkLikeInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteWorkLikeInput.serializer,
        json,
      );
}

abstract class Gfederation__FieldSet
    implements Built<Gfederation__FieldSet, Gfederation__FieldSetBuilder> {
  Gfederation__FieldSet._();

  factory Gfederation__FieldSet([String? value]) =>
      _$Gfederation__FieldSet((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<Gfederation__FieldSet> get serializer =>
      _i1.DefaultScalarSerializer<Gfederation__FieldSet>((Object serialized) =>
          Gfederation__FieldSet((serialized as String?)));
}

abstract class GFoldersWhereInput
    implements Built<GFoldersWhereInput, GFoldersWhereInputBuilder> {
  GFoldersWhereInput._();

  factory GFoldersWhereInput([Function(GFoldersWhereInputBuilder b) updates]) =
      _$GFoldersWhereInput;

  String? get search;
  static Serializer<GFoldersWhereInput> get serializer =>
      _$gFoldersWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFoldersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFoldersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFoldersWhereInput.serializer,
        json,
      );
}

abstract class GFollowUserInput
    implements Built<GFollowUserInput, GFollowUserInputBuilder> {
  GFollowUserInput._();

  factory GFollowUserInput([Function(GFollowUserInputBuilder b) updates]) =
      _$GFollowUserInput;

  String get userId;
  static Serializer<GFollowUserInput> get serializer =>
      _$gFollowUserInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFollowUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFollowUserInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFollowUserInput.serializer,
        json,
      );
}

abstract class Glink__Import
    implements Built<Glink__Import, Glink__ImportBuilder> {
  Glink__Import._();

  factory Glink__Import([String? value]) =>
      _$Glink__Import((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<Glink__Import> get serializer =>
      _i1.DefaultScalarSerializer<Glink__Import>(
          (Object serialized) => Glink__Import((serialized as String?)));
}

class Glink__Purpose extends EnumClass {
  const Glink__Purpose._(String name) : super(name);

  static const Glink__Purpose SECURITY = _$glinkPurposeSECURITY;

  static const Glink__Purpose EXECUTION = _$glinkPurposeEXECUTION;

  static Serializer<Glink__Purpose> get serializer => _$glinkPurposeSerializer;
  static BuiltSet<Glink__Purpose> get values => _$glinkPurposeValues;
  static Glink__Purpose valueOf(String name) => _$glinkPurposeValueOf(name);
}

abstract class GLoginWithPasswordInput
    implements Built<GLoginWithPasswordInput, GLoginWithPasswordInputBuilder> {
  GLoginWithPasswordInput._();

  factory GLoginWithPasswordInput(
          [Function(GLoginWithPasswordInputBuilder b) updates]) =
      _$GLoginWithPasswordInput;

  String get login;
  String get password;
  static Serializer<GLoginWithPasswordInput> get serializer =>
      _$gLoginWithPasswordInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GLoginWithPasswordInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLoginWithPasswordInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GLoginWithPasswordInput.serializer,
        json,
      );
}

abstract class GMuteTagInput
    implements Built<GMuteTagInput, GMuteTagInputBuilder> {
  GMuteTagInput._();

  factory GMuteTagInput([Function(GMuteTagInputBuilder b) updates]) =
      _$GMuteTagInput;

  String get tagName;
  static Serializer<GMuteTagInput> get serializer => _$gMuteTagInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GMuteTagInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMuteTagInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GMuteTagInput.serializer,
        json,
      );
}

abstract class GMuteUserInput
    implements Built<GMuteUserInput, GMuteUserInputBuilder> {
  GMuteUserInput._();

  factory GMuteUserInput([Function(GMuteUserInputBuilder b) updates]) =
      _$GMuteUserInput;

  String get userId;
  static Serializer<GMuteUserInput> get serializer =>
      _$gMuteUserInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GMuteUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMuteUserInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GMuteUserInput.serializer,
        json,
      );
}

class GNotificationType extends EnumClass {
  const GNotificationType._(String name) : super(name);

  static const GNotificationType LIKE = _$gNotificationTypeLIKE;

  static const GNotificationType COMMENT = _$gNotificationTypeCOMMENT;

  static const GNotificationType COMMENT_REPLY =
      _$gNotificationTypeCOMMENT_REPLY;

  static const GNotificationType FOLLOW = _$gNotificationTypeFOLLOW;

  static Serializer<GNotificationType> get serializer =>
      _$gNotificationTypeSerializer;
  static BuiltSet<GNotificationType> get values => _$gNotificationTypeValues;
  static GNotificationType valueOf(String name) =>
      _$gNotificationTypeValueOf(name);
}

abstract class GPopularWorksWhereInput
    implements Built<GPopularWorksWhereInput, GPopularWorksWhereInputBuilder> {
  GPopularWorksWhereInput._();

  factory GPopularWorksWhereInput(
          [Function(GPopularWorksWhereInputBuilder b) updates]) =
      _$GPopularWorksWhereInput;

  String? get date;
  GRating? get rating;
  static Serializer<GPopularWorksWhereInput> get serializer =>
      _$gPopularWorksWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPopularWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPopularWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPopularWorksWhereInput.serializer,
        json,
      );
}

class GPostType extends EnumClass {
  const GPostType._(String name) : super(name);

  static const GPostType WORK = _$gPostTypeWORK;

  static const GPostType NOVEL = _$gPostTypeNOVEL;

  static const GPostType NOTE = _$gPostTypeNOTE;

  static Serializer<GPostType> get serializer => _$gPostTypeSerializer;
  static BuiltSet<GPostType> get values => _$gPostTypeValues;
  static GPostType valueOf(String name) => _$gPostTypeValueOf(name);
}

class GRating extends EnumClass {
  const GRating._(String name) : super(name);

  static const GRating G = _$gRatingG;

  static const GRating R15 = _$gRatingR15;

  static const GRating R18 = _$gRatingR18;

  static const GRating R18G = _$gRatingR18G;

  static Serializer<GRating> get serializer => _$gRatingSerializer;
  static BuiltSet<GRating> get values => _$gRatingValues;
  static GRating valueOf(String name) => _$gRatingValueOf(name);
}

abstract class GStickersWhereInput
    implements Built<GStickersWhereInput, GStickersWhereInputBuilder> {
  GStickersWhereInput._();

  factory GStickersWhereInput(
      [Function(GStickersWhereInputBuilder b) updates]) = _$GStickersWhereInput;

  String? get search;
  static Serializer<GStickersWhereInput> get serializer =>
      _$gStickersWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GStickersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GStickersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GStickersWhereInput.serializer,
        json,
      );
}

abstract class GTagsWhereInput
    implements Built<GTagsWhereInput, GTagsWhereInputBuilder> {
  GTagsWhereInput._();

  factory GTagsWhereInput([Function(GTagsWhereInputBuilder b) updates]) =
      _$GTagsWhereInput;

  String? get search;
  static Serializer<GTagsWhereInput> get serializer =>
      _$gTagsWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GTagsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTagsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GTagsWhereInput.serializer,
        json,
      );
}

abstract class GUnfollowUserInput
    implements Built<GUnfollowUserInput, GUnfollowUserInputBuilder> {
  GUnfollowUserInput._();

  factory GUnfollowUserInput([Function(GUnfollowUserInputBuilder b) updates]) =
      _$GUnfollowUserInput;

  String get userId;
  static Serializer<GUnfollowUserInput> get serializer =>
      _$gUnfollowUserInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUnfollowUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnfollowUserInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUnfollowUserInput.serializer,
        json,
      );
}

abstract class GUnmuteTagInput
    implements Built<GUnmuteTagInput, GUnmuteTagInputBuilder> {
  GUnmuteTagInput._();

  factory GUnmuteTagInput([Function(GUnmuteTagInputBuilder b) updates]) =
      _$GUnmuteTagInput;

  String get tagName;
  static Serializer<GUnmuteTagInput> get serializer =>
      _$gUnmuteTagInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUnmuteTagInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnmuteTagInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUnmuteTagInput.serializer,
        json,
      );
}

abstract class GUnmuteUserInput
    implements Built<GUnmuteUserInput, GUnmuteUserInputBuilder> {
  GUnmuteUserInput._();

  factory GUnmuteUserInput([Function(GUnmuteUserInputBuilder b) updates]) =
      _$GUnmuteUserInput;

  String get userId;
  static Serializer<GUnmuteUserInput> get serializer =>
      _$gUnmuteUserInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUnmuteUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnmuteUserInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUnmuteUserInput.serializer,
        json,
      );
}

abstract class GUpdateFolderInput
    implements Built<GUpdateFolderInput, GUpdateFolderInputBuilder> {
  GUpdateFolderInput._();

  factory GUpdateFolderInput([Function(GUpdateFolderInputBuilder b) updates]) =
      _$GUpdateFolderInput;

  String get folderId;
  static Serializer<GUpdateFolderInput> get serializer =>
      _$gUpdateFolderInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateFolderInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateFolderInput.serializer,
        json,
      );
}

abstract class GUpdateStickerInput
    implements Built<GUpdateStickerInput, GUpdateStickerInputBuilder> {
  GUpdateStickerInput._();

  factory GUpdateStickerInput(
      [Function(GUpdateStickerInputBuilder b) updates]) = _$GUpdateStickerInput;

  String get stickerId;
  String get title;
  static Serializer<GUpdateStickerInput> get serializer =>
      _$gUpdateStickerInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateStickerInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateStickerInput.serializer,
        json,
      );
}

abstract class GUpdateUserProfileInput
    implements Built<GUpdateUserProfileInput, GUpdateUserProfileInputBuilder> {
  GUpdateUserProfileInput._();

  factory GUpdateUserProfileInput(
          [Function(GUpdateUserProfileInputBuilder b) updates]) =
      _$GUpdateUserProfileInput;

  String get userId;
  static Serializer<GUpdateUserProfileInput> get serializer =>
      _$gUpdateUserProfileInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateUserProfileInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserProfileInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateUserProfileInput.serializer,
        json,
      );
}

abstract class GUsersWhereInput
    implements Built<GUsersWhereInput, GUsersWhereInputBuilder> {
  GUsersWhereInput._();

  factory GUsersWhereInput([Function(GUsersWhereInputBuilder b) updates]) =
      _$GUsersWhereInput;

  String? get search;
  static Serializer<GUsersWhereInput> get serializer =>
      _$gUsersWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUsersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUsersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUsersWhereInput.serializer,
        json,
      );
}

abstract class GUserWorksWhereInput
    implements Built<GUserWorksWhereInput, GUserWorksWhereInputBuilder> {
  GUserWorksWhereInput._();

  factory GUserWorksWhereInput(
          [Function(GUserWorksWhereInputBuilder b) updates]) =
      _$GUserWorksWhereInput;

  String? get search;
  static Serializer<GUserWorksWhereInput> get serializer =>
      _$gUserWorksWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUserWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUserWorksWhereInput.serializer,
        json,
      );
}

abstract class GWorkAwardsWhereInput
    implements Built<GWorkAwardsWhereInput, GWorkAwardsWhereInputBuilder> {
  GWorkAwardsWhereInput._();

  factory GWorkAwardsWhereInput(
          [Function(GWorkAwardsWhereInputBuilder b) updates]) =
      _$GWorkAwardsWhereInput;

  GAwardType? get type;
  String? get date;
  int? get year;
  int? get month;
  int? get day;
  int? get weekIndex;
  static Serializer<GWorkAwardsWhereInput> get serializer =>
      _$gWorkAwardsWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GWorkAwardsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkAwardsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GWorkAwardsWhereInput.serializer,
        json,
      );
}

abstract class GWorksWhereInput
    implements Built<GWorksWhereInput, GWorksWhereInputBuilder> {
  GWorksWhereInput._();

  factory GWorksWhereInput([Function(GWorksWhereInputBuilder b) updates]) =
      _$GWorksWhereInput;

  GRating? get rating;
  String? get search;
  static Serializer<GWorksWhereInput> get serializer =>
      _$gWorksWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GWorksWhereInput.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {
  '_Entity': {
    'CommentNode',
    'ContributorNode',
    'DailyThemeNode',
    'FolderLikeNode',
    'FolderNode',
    'FriendshipNode',
    'ImageNode',
    'MutedTagNode',
    'MutedUserNode',
    'NotificationNode',
    'StickerNode',
    'SubWorkNode',
    'TagNode',
    'UserNode',
    'UserSettingNode',
    'WorkAwardNode',
    'WorkBookmarkNode',
    'WorkEventNode',
    'WorkLikeNode',
    'WorkNode',
    'WorkViewerNode',
  },
  'Node': {
    'CommentNode',
    'ContributorNode',
    'DailyThemeNode',
    'FolderLikeNode',
    'FolderNode',
    'FriendshipNode',
    'ImageNode',
    'MutedTagNode',
    'MutedUserNode',
    'NotificationNode',
    'StickerNode',
    'SubWorkNode',
    'TagNode',
    'UserNode',
    'UserSettingNode',
    'WorkAwardNode',
    'WorkBookmarkNode',
    'WorkEventNode',
    'WorkLikeNode',
    'WorkNode',
    'WorkViewerNode',
  },
};
