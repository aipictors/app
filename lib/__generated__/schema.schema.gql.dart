// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'schema.schema.gql.g.dart';

abstract class GAcceptPromptonRequestInput
    implements
        Built<GAcceptPromptonRequestInput, GAcceptPromptonRequestInputBuilder> {
  GAcceptPromptonRequestInput._();

  factory GAcceptPromptonRequestInput(
          [Function(GAcceptPromptonRequestInputBuilder b) updates]) =
      _$GAcceptPromptonRequestInput;

  String get requestId;
  static Serializer<GAcceptPromptonRequestInput> get serializer =>
      _$gAcceptPromptonRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAcceptPromptonRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAcceptPromptonRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAcceptPromptonRequestInput.serializer,
        json,
      );
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

abstract class GAddPromptonTagToWorkInput
    implements
        Built<GAddPromptonTagToWorkInput, GAddPromptonTagToWorkInputBuilder> {
  GAddPromptonTagToWorkInput._();

  factory GAddPromptonTagToWorkInput(
          [Function(GAddPromptonTagToWorkInputBuilder b) updates]) =
      _$GAddPromptonTagToWorkInput;

  String get workId;
  String get tagNameJA;
  static Serializer<GAddPromptonTagToWorkInput> get serializer =>
      _$gAddPromptonTagToWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddPromptonTagToWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddPromptonTagToWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddPromptonTagToWorkInput.serializer,
        json,
      );
}

abstract class GAddPromptonWorkToFolderInput
    implements
        Built<GAddPromptonWorkToFolderInput,
            GAddPromptonWorkToFolderInputBuilder> {
  GAddPromptonWorkToFolderInput._();

  factory GAddPromptonWorkToFolderInput(
          [Function(GAddPromptonWorkToFolderInputBuilder b) updates]) =
      _$GAddPromptonWorkToFolderInput;

  String get folderId;
  String get workId;
  static Serializer<GAddPromptonWorkToFolderInput> get serializer =>
      _$gAddPromptonWorkToFolderInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddPromptonWorkToFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddPromptonWorkToFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddPromptonWorkToFolderInput.serializer,
        json,
      );
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAwardsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAwardsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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

abstract class GBlockPromptonUserInput
    implements Built<GBlockPromptonUserInput, GBlockPromptonUserInputBuilder> {
  GBlockPromptonUserInput._();

  factory GBlockPromptonUserInput(
          [Function(GBlockPromptonUserInputBuilder b) updates]) =
      _$GBlockPromptonUserInput;

  String get userId;
  static Serializer<GBlockPromptonUserInput> get serializer =>
      _$gBlockPromptonUserInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBlockPromptonUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBlockPromptonUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBlockPromptonUserInput.serializer,
        json,
      );
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

abstract class GCancelPromptonRequestInput
    implements
        Built<GCancelPromptonRequestInput, GCancelPromptonRequestInputBuilder> {
  GCancelPromptonRequestInput._();

  factory GCancelPromptonRequestInput(
          [Function(GCancelPromptonRequestInputBuilder b) updates]) =
      _$GCancelPromptonRequestInput;

  String get requestId;
  static Serializer<GCancelPromptonRequestInput> get serializer =>
      _$gCancelPromptonRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelPromptonRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCancelPromptonRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelPromptonRequestInput.serializer,
        json,
      );
}

abstract class GChangePromptonFolderToPaidInput
    implements
        Built<GChangePromptonFolderToPaidInput,
            GChangePromptonFolderToPaidInputBuilder> {
  GChangePromptonFolderToPaidInput._();

  factory GChangePromptonFolderToPaidInput(
          [Function(GChangePromptonFolderToPaidInputBuilder b) updates]) =
      _$GChangePromptonFolderToPaidInput;

  String get folderId;
  int get price;
  bool get featureCommercialUse;
  static Serializer<GChangePromptonFolderToPaidInput> get serializer =>
      _$gChangePromptonFolderToPaidInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChangePromptonFolderToPaidInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GChangePromptonFolderToPaidInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChangePromptonFolderToPaidInput.serializer,
        json,
      );
}

abstract class GClosePromptonRequestInput
    implements
        Built<GClosePromptonRequestInput, GClosePromptonRequestInputBuilder> {
  GClosePromptonRequestInput._();

  factory GClosePromptonRequestInput(
          [Function(GClosePromptonRequestInputBuilder b) updates]) =
      _$GClosePromptonRequestInput;

  String get requestId;
  static Serializer<GClosePromptonRequestInput> get serializer =>
      _$gClosePromptonRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GClosePromptonRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GClosePromptonRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GClosePromptonRequestInput.serializer,
        json,
      );
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateFolderInput.serializer,
        json,
      );
}

abstract class GCreatePromptonChatMessageInput
    implements
        Built<GCreatePromptonChatMessageInput,
            GCreatePromptonChatMessageInputBuilder> {
  GCreatePromptonChatMessageInput._();

  factory GCreatePromptonChatMessageInput(
          [Function(GCreatePromptonChatMessageInputBuilder b) updates]) =
      _$GCreatePromptonChatMessageInput;

  String get text;
  static Serializer<GCreatePromptonChatMessageInput> get serializer =>
      _$gCreatePromptonChatMessageInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonChatMessageInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonChatMessageInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonChatMessageInput.serializer,
        json,
      );
}

abstract class GCreatePromptonCoffeeRequestInput
    implements
        Built<GCreatePromptonCoffeeRequestInput,
            GCreatePromptonCoffeeRequestInputBuilder> {
  GCreatePromptonCoffeeRequestInput._();

  factory GCreatePromptonCoffeeRequestInput(
          [Function(GCreatePromptonCoffeeRequestInputBuilder b) updates]) =
      _$GCreatePromptonCoffeeRequestInput;

  String get note;
  String get recipientId;
  static Serializer<GCreatePromptonCoffeeRequestInput> get serializer =>
      _$gCreatePromptonCoffeeRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonCoffeeRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonCoffeeRequestInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonCoffeeRequestInput.serializer,
        json,
      );
}

abstract class GCreatePromptonDeliverableInput
    implements
        Built<GCreatePromptonDeliverableInput,
            GCreatePromptonDeliverableInputBuilder> {
  GCreatePromptonDeliverableInput._();

  factory GCreatePromptonDeliverableInput(
          [Function(GCreatePromptonDeliverableInputBuilder b) updates]) =
      _$GCreatePromptonDeliverableInput;

  String get requestId;
  String get fileId;
  String? get name;
  String? get description;
  String get fileType;
  static Serializer<GCreatePromptonDeliverableInput> get serializer =>
      _$gCreatePromptonDeliverableInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonDeliverableInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonDeliverableInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonDeliverableInput.serializer,
        json,
      );
}

abstract class GCreatePromptonFileInput
    implements
        Built<GCreatePromptonFileInput, GCreatePromptonFileInputBuilder> {
  GCreatePromptonFileInput._();

  factory GCreatePromptonFileInput(
          [Function(GCreatePromptonFileInputBuilder b) updates]) =
      _$GCreatePromptonFileInput;

  String get fileId;
  String get fileType;
  int? get width;
  int? get height;
  String get path;
  static Serializer<GCreatePromptonFileInput> get serializer =>
      _$gCreatePromptonFileInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonFileInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonFileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonFileInput.serializer,
        json,
      );
}

abstract class GCreatePromptonFolderInput
    implements
        Built<GCreatePromptonFolderInput, GCreatePromptonFolderInputBuilder> {
  GCreatePromptonFolderInput._();

  factory GCreatePromptonFolderInput(
          [Function(GCreatePromptonFolderInputBuilder b) updates]) =
      _$GCreatePromptonFolderInput;

  String get name;
  String get description;
  bool get isPublic;
  static Serializer<GCreatePromptonFolderInput> get serializer =>
      _$gCreatePromptonFolderInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonFolderInput.serializer,
        json,
      );
}

abstract class GCreatePromptonFolderKeyInput
    implements
        Built<GCreatePromptonFolderKeyInput,
            GCreatePromptonFolderKeyInputBuilder> {
  GCreatePromptonFolderKeyInput._();

  factory GCreatePromptonFolderKeyInput(
          [Function(GCreatePromptonFolderKeyInputBuilder b) updates]) =
      _$GCreatePromptonFolderKeyInput;

  String get folderId;
  static Serializer<GCreatePromptonFolderKeyInput> get serializer =>
      _$gCreatePromptonFolderKeyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonFolderKeyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonFolderKeyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonFolderKeyInput.serializer,
        json,
      );
}

abstract class GCreatePromptonFolderViewInput
    implements
        Built<GCreatePromptonFolderViewInput,
            GCreatePromptonFolderViewInputBuilder> {
  GCreatePromptonFolderViewInput._();

  factory GCreatePromptonFolderViewInput(
          [Function(GCreatePromptonFolderViewInputBuilder b) updates]) =
      _$GCreatePromptonFolderViewInput;

  String get folderId;
  static Serializer<GCreatePromptonFolderViewInput> get serializer =>
      _$gCreatePromptonFolderViewInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonFolderViewInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonFolderViewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonFolderViewInput.serializer,
        json,
      );
}

abstract class GCreatePromptonInquiryInput
    implements
        Built<GCreatePromptonInquiryInput, GCreatePromptonInquiryInputBuilder> {
  GCreatePromptonInquiryInput._();

  factory GCreatePromptonInquiryInput(
          [Function(GCreatePromptonInquiryInputBuilder b) updates]) =
      _$GCreatePromptonInquiryInput;

  String get name;
  String? get companyName;
  String get email;
  String? get phoneNumber;
  String get body;
  static Serializer<GCreatePromptonInquiryInput> get serializer =>
      _$gCreatePromptonInquiryInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonInquiryInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonInquiryInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonInquiryInput.serializer,
        json,
      );
}

abstract class GCreatePromptonPaymentMethodInput
    implements
        Built<GCreatePromptonPaymentMethodInput,
            GCreatePromptonPaymentMethodInputBuilder> {
  GCreatePromptonPaymentMethodInput._();

  factory GCreatePromptonPaymentMethodInput(
          [Function(GCreatePromptonPaymentMethodInputBuilder b) updates]) =
      _$GCreatePromptonPaymentMethodInput;

  String? get redirectURL;
  static Serializer<GCreatePromptonPaymentMethodInput> get serializer =>
      _$gCreatePromptonPaymentMethodInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonPaymentMethodInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonPaymentMethodInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonPaymentMethodInput.serializer,
        json,
      );
}

abstract class GCreatePromptonPlanInput
    implements
        Built<GCreatePromptonPlanInput, GCreatePromptonPlanInputBuilder> {
  GCreatePromptonPlanInput._();

  factory GCreatePromptonPlanInput(
          [Function(GCreatePromptonPlanInputBuilder b) updates]) =
      _$GCreatePromptonPlanInput;

  String get category;
  String get name;
  String get description;
  String get message;
  int get unitPrice;
  int get minimumQuantity;
  int get maximumQuantity;
  BuiltList<String> get styleSlugs;
  BuiltList<String> get objectSlugs;
  bool get featurePrivate;
  bool get featureCopyrightFree;
  bool get featureCommercialUse;
  bool get featureFanFiction;
  String? get imageFileId;
  static Serializer<GCreatePromptonPlanInput> get serializer =>
      _$gCreatePromptonPlanInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonPlanInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonPlanInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonPlanInput.serializer,
        json,
      );
}

abstract class GCreatePromptonPlanRequestInput
    implements
        Built<GCreatePromptonPlanRequestInput,
            GCreatePromptonPlanRequestInputBuilder> {
  GCreatePromptonPlanRequestInput._();

  factory GCreatePromptonPlanRequestInput(
          [Function(GCreatePromptonPlanRequestInputBuilder b) updates]) =
      _$GCreatePromptonPlanRequestInput;

  String get planId;
  int get quantity;
  String get note;
  String get recipientId;
  BuiltList<String> get fileIds;
  static Serializer<GCreatePromptonPlanRequestInput> get serializer =>
      _$gCreatePromptonPlanRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonPlanRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonPlanRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonPlanRequestInput.serializer,
        json,
      );
}

abstract class GCreatePromptonPlanViewInput
    implements
        Built<GCreatePromptonPlanViewInput,
            GCreatePromptonPlanViewInputBuilder> {
  GCreatePromptonPlanViewInput._();

  factory GCreatePromptonPlanViewInput(
          [Function(GCreatePromptonPlanViewInputBuilder b) updates]) =
      _$GCreatePromptonPlanViewInput;

  String get planId;
  static Serializer<GCreatePromptonPlanViewInput> get serializer =>
      _$gCreatePromptonPlanViewInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonPlanViewInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonPlanViewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonPlanViewInput.serializer,
        json,
      );
}

abstract class GCreatePromptonProfileBlockInput
    implements
        Built<GCreatePromptonProfileBlockInput,
            GCreatePromptonProfileBlockInputBuilder> {
  GCreatePromptonProfileBlockInput._();

  factory GCreatePromptonProfileBlockInput(
          [Function(GCreatePromptonProfileBlockInputBuilder b) updates]) =
      _$GCreatePromptonProfileBlockInput;

  String? get siteURL;
  String? get title;
  String? get description;
  static Serializer<GCreatePromptonProfileBlockInput> get serializer =>
      _$gCreatePromptonProfileBlockInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonProfileBlockInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonProfileBlockInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonProfileBlockInput.serializer,
        json,
      );
}

abstract class GCreatePromptonPromptCategoryInput
    implements
        Built<GCreatePromptonPromptCategoryInput,
            GCreatePromptonPromptCategoryInputBuilder> {
  GCreatePromptonPromptCategoryInput._();

  factory GCreatePromptonPromptCategoryInput(
          [Function(GCreatePromptonPromptCategoryInputBuilder b) updates]) =
      _$GCreatePromptonPromptCategoryInput;

  String get name;
  String? get description;
  String get slug;
  static Serializer<GCreatePromptonPromptCategoryInput> get serializer =>
      _$gCreatePromptonPromptCategoryInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonPromptCategoryInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonPromptCategoryInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonPromptCategoryInput.serializer,
        json,
      );
}

abstract class GCreatePromptonPromptInput
    implements
        Built<GCreatePromptonPromptInput, GCreatePromptonPromptInputBuilder> {
  GCreatePromptonPromptInput._();

  factory GCreatePromptonPromptInput(
          [Function(GCreatePromptonPromptInputBuilder b) updates]) =
      _$GCreatePromptonPromptInput;

  String? get name;
  String? get description;
  String get text;
  bool get isNsfw;
  bool get isBase;
  bool get isSingle;
  static Serializer<GCreatePromptonPromptInput> get serializer =>
      _$gCreatePromptonPromptInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonPromptInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonPromptInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonPromptInput.serializer,
        json,
      );
}

abstract class GCreatePromptonPromptWorkInput
    implements
        Built<GCreatePromptonPromptWorkInput,
            GCreatePromptonPromptWorkInputBuilder> {
  GCreatePromptonPromptWorkInput._();

  factory GCreatePromptonPromptWorkInput(
          [Function(GCreatePromptonPromptWorkInputBuilder b) updates]) =
      _$GCreatePromptonPromptWorkInput;

  String get fileId;
  String get fileName;
  bool get isPublic;
  String get promptId;
  static Serializer<GCreatePromptonPromptWorkInput> get serializer =>
      _$gCreatePromptonPromptWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonPromptWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonPromptWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonPromptWorkInput.serializer,
        json,
      );
}

abstract class GCreatePromptonReactionInput
    implements
        Built<GCreatePromptonReactionInput,
            GCreatePromptonReactionInputBuilder> {
  GCreatePromptonReactionInput._();

  factory GCreatePromptonReactionInput(
          [Function(GCreatePromptonReactionInputBuilder b) updates]) =
      _$GCreatePromptonReactionInput;

  String get workId;
  String get text;
  static Serializer<GCreatePromptonReactionInput> get serializer =>
      _$gCreatePromptonReactionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonReactionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonReactionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonReactionInput.serializer,
        json,
      );
}

abstract class GCreatePromptonThumbnailFileInput
    implements
        Built<GCreatePromptonThumbnailFileInput,
            GCreatePromptonThumbnailFileInputBuilder> {
  GCreatePromptonThumbnailFileInput._();

  factory GCreatePromptonThumbnailFileInput(
          [Function(GCreatePromptonThumbnailFileInputBuilder b) updates]) =
      _$GCreatePromptonThumbnailFileInput;

  String get fileId;
  String get originalFileId;
  static Serializer<GCreatePromptonThumbnailFileInput> get serializer =>
      _$gCreatePromptonThumbnailFileInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonThumbnailFileInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonThumbnailFileInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonThumbnailFileInput.serializer,
        json,
      );
}

abstract class GCreatePromptonUserInput
    implements
        Built<GCreatePromptonUserInput, GCreatePromptonUserInputBuilder> {
  GCreatePromptonUserInput._();

  factory GCreatePromptonUserInput(
          [Function(GCreatePromptonUserInputBuilder b) updates]) =
      _$GCreatePromptonUserInput;

  String get name;
  static Serializer<GCreatePromptonUserInput> get serializer =>
      _$gCreatePromptonUserInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonUserInput.serializer,
        json,
      );
}

abstract class GCreatePromptonUserViewInput
    implements
        Built<GCreatePromptonUserViewInput,
            GCreatePromptonUserViewInputBuilder> {
  GCreatePromptonUserViewInput._();

  factory GCreatePromptonUserViewInput(
          [Function(GCreatePromptonUserViewInputBuilder b) updates]) =
      _$GCreatePromptonUserViewInput;

  String get userId;
  static Serializer<GCreatePromptonUserViewInput> get serializer =>
      _$gCreatePromptonUserViewInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonUserViewInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonUserViewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonUserViewInput.serializer,
        json,
      );
}

abstract class GCreatePromptonWorkBookmarkInput
    implements
        Built<GCreatePromptonWorkBookmarkInput,
            GCreatePromptonWorkBookmarkInputBuilder> {
  GCreatePromptonWorkBookmarkInput._();

  factory GCreatePromptonWorkBookmarkInput(
          [Function(GCreatePromptonWorkBookmarkInputBuilder b) updates]) =
      _$GCreatePromptonWorkBookmarkInput;

  String get workId;
  static Serializer<GCreatePromptonWorkBookmarkInput> get serializer =>
      _$gCreatePromptonWorkBookmarkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonWorkBookmarkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonWorkBookmarkInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonWorkBookmarkInput.serializer,
        json,
      );
}

abstract class GCreatePromptonWorkInput
    implements
        Built<GCreatePromptonWorkInput, GCreatePromptonWorkInputBuilder> {
  GCreatePromptonWorkInput._();

  factory GCreatePromptonWorkInput(
          [Function(GCreatePromptonWorkInputBuilder b) updates]) =
      _$GCreatePromptonWorkInput;

  String get fileId;
  String get fileName;
  String? get folderId;
  String? get tagNameJA;
  String get fileType;
  static Serializer<GCreatePromptonWorkInput> get serializer =>
      _$gCreatePromptonWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonWorkInput.serializer,
        json,
      );
}

abstract class GCreatePromptonWorkLikeInput
    implements
        Built<GCreatePromptonWorkLikeInput,
            GCreatePromptonWorkLikeInputBuilder> {
  GCreatePromptonWorkLikeInput._();

  factory GCreatePromptonWorkLikeInput(
          [Function(GCreatePromptonWorkLikeInputBuilder b) updates]) =
      _$GCreatePromptonWorkLikeInput;

  String get workId;
  static Serializer<GCreatePromptonWorkLikeInput> get serializer =>
      _$gCreatePromptonWorkLikeInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonWorkLikeInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonWorkLikeInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonWorkLikeInput.serializer,
        json,
      );
}

abstract class GCreatePromptonWorkViewInput
    implements
        Built<GCreatePromptonWorkViewInput,
            GCreatePromptonWorkViewInputBuilder> {
  GCreatePromptonWorkViewInput._();

  factory GCreatePromptonWorkViewInput(
          [Function(GCreatePromptonWorkViewInputBuilder b) updates]) =
      _$GCreatePromptonWorkViewInput;

  String get workId;
  static Serializer<GCreatePromptonWorkViewInput> get serializer =>
      _$gCreatePromptonWorkViewInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonWorkViewInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreatePromptonWorkViewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonWorkViewInput.serializer,
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateResponseCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateResponseCommentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateStickerInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkBookmarkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkBookmarkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkCommentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkLikeInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkLikeInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemesWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemesWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemesWhereInput.serializer,
        json,
      );
}

abstract class GDecrementPromptonPlanSort
    implements
        Built<GDecrementPromptonPlanSort, GDecrementPromptonPlanSortBuilder> {
  GDecrementPromptonPlanSort._();

  factory GDecrementPromptonPlanSort(
          [Function(GDecrementPromptonPlanSortBuilder b) updates]) =
      _$GDecrementPromptonPlanSort;

  String get planId;
  static Serializer<GDecrementPromptonPlanSort> get serializer =>
      _$gDecrementPromptonPlanSortSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDecrementPromptonPlanSort.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDecrementPromptonPlanSort? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDecrementPromptonPlanSort.serializer,
        json,
      );
}

abstract class GDecrementPromptonProfileBlockIndexInput
    implements
        Built<GDecrementPromptonProfileBlockIndexInput,
            GDecrementPromptonProfileBlockIndexInputBuilder> {
  GDecrementPromptonProfileBlockIndexInput._();

  factory GDecrementPromptonProfileBlockIndexInput(
      [Function(GDecrementPromptonProfileBlockIndexInputBuilder b)
          updates]) = _$GDecrementPromptonProfileBlockIndexInput;

  String get profileBlockId;
  static Serializer<GDecrementPromptonProfileBlockIndexInput> get serializer =>
      _$gDecrementPromptonProfileBlockIndexInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDecrementPromptonProfileBlockIndexInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDecrementPromptonProfileBlockIndexInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDecrementPromptonProfileBlockIndexInput.serializer,
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteCommentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteFolderInput.serializer,
        json,
      );
}

abstract class GDeletePromptonFolderInput
    implements
        Built<GDeletePromptonFolderInput, GDeletePromptonFolderInputBuilder> {
  GDeletePromptonFolderInput._();

  factory GDeletePromptonFolderInput(
          [Function(GDeletePromptonFolderInputBuilder b) updates]) =
      _$GDeletePromptonFolderInput;

  String get folderId;
  static Serializer<GDeletePromptonFolderInput> get serializer =>
      _$gDeletePromptonFolderInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonFolderInput.serializer,
        json,
      );
}

abstract class GDeletePromptonIntegrationInput
    implements
        Built<GDeletePromptonIntegrationInput,
            GDeletePromptonIntegrationInputBuilder> {
  GDeletePromptonIntegrationInput._();

  factory GDeletePromptonIntegrationInput(
          [Function(GDeletePromptonIntegrationInputBuilder b) updates]) =
      _$GDeletePromptonIntegrationInput;

  String get integrationId;
  static Serializer<GDeletePromptonIntegrationInput> get serializer =>
      _$gDeletePromptonIntegrationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonIntegrationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonIntegrationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonIntegrationInput.serializer,
        json,
      );
}

abstract class GDeletePromptonPlanInput
    implements
        Built<GDeletePromptonPlanInput, GDeletePromptonPlanInputBuilder> {
  GDeletePromptonPlanInput._();

  factory GDeletePromptonPlanInput(
          [Function(GDeletePromptonPlanInputBuilder b) updates]) =
      _$GDeletePromptonPlanInput;

  String get planId;
  static Serializer<GDeletePromptonPlanInput> get serializer =>
      _$gDeletePromptonPlanInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonPlanInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonPlanInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonPlanInput.serializer,
        json,
      );
}

abstract class GDeletePromptonProfileBlockInput
    implements
        Built<GDeletePromptonProfileBlockInput,
            GDeletePromptonProfileBlockInputBuilder> {
  GDeletePromptonProfileBlockInput._();

  factory GDeletePromptonProfileBlockInput(
          [Function(GDeletePromptonProfileBlockInputBuilder b) updates]) =
      _$GDeletePromptonProfileBlockInput;

  String get profileBlockId;
  static Serializer<GDeletePromptonProfileBlockInput> get serializer =>
      _$gDeletePromptonProfileBlockInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonProfileBlockInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonProfileBlockInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonProfileBlockInput.serializer,
        json,
      );
}

abstract class GDeletePromptonPromptCategoryInput
    implements
        Built<GDeletePromptonPromptCategoryInput,
            GDeletePromptonPromptCategoryInputBuilder> {
  GDeletePromptonPromptCategoryInput._();

  factory GDeletePromptonPromptCategoryInput(
          [Function(GDeletePromptonPromptCategoryInputBuilder b) updates]) =
      _$GDeletePromptonPromptCategoryInput;

  String get promptCategoryId;
  static Serializer<GDeletePromptonPromptCategoryInput> get serializer =>
      _$gDeletePromptonPromptCategoryInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonPromptCategoryInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonPromptCategoryInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonPromptCategoryInput.serializer,
        json,
      );
}

abstract class GDeletePromptonPromptInput
    implements
        Built<GDeletePromptonPromptInput, GDeletePromptonPromptInputBuilder> {
  GDeletePromptonPromptInput._();

  factory GDeletePromptonPromptInput(
          [Function(GDeletePromptonPromptInputBuilder b) updates]) =
      _$GDeletePromptonPromptInput;

  String get promptId;
  static Serializer<GDeletePromptonPromptInput> get serializer =>
      _$gDeletePromptonPromptInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonPromptInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonPromptInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonPromptInput.serializer,
        json,
      );
}

abstract class GDeletePromptonReactionInput
    implements
        Built<GDeletePromptonReactionInput,
            GDeletePromptonReactionInputBuilder> {
  GDeletePromptonReactionInput._();

  factory GDeletePromptonReactionInput(
          [Function(GDeletePromptonReactionInputBuilder b) updates]) =
      _$GDeletePromptonReactionInput;

  String get workId;
  String get text;
  static Serializer<GDeletePromptonReactionInput> get serializer =>
      _$gDeletePromptonReactionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonReactionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonReactionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonReactionInput.serializer,
        json,
      );
}

abstract class GDeletePromptonWorkBookmarkInput
    implements
        Built<GDeletePromptonWorkBookmarkInput,
            GDeletePromptonWorkBookmarkInputBuilder> {
  GDeletePromptonWorkBookmarkInput._();

  factory GDeletePromptonWorkBookmarkInput(
          [Function(GDeletePromptonWorkBookmarkInputBuilder b) updates]) =
      _$GDeletePromptonWorkBookmarkInput;

  String get workId;
  static Serializer<GDeletePromptonWorkBookmarkInput> get serializer =>
      _$gDeletePromptonWorkBookmarkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonWorkBookmarkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonWorkBookmarkInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonWorkBookmarkInput.serializer,
        json,
      );
}

abstract class GDeletePromptonWorkInput
    implements
        Built<GDeletePromptonWorkInput, GDeletePromptonWorkInputBuilder> {
  GDeletePromptonWorkInput._();

  factory GDeletePromptonWorkInput(
          [Function(GDeletePromptonWorkInputBuilder b) updates]) =
      _$GDeletePromptonWorkInput;

  String get workId;
  static Serializer<GDeletePromptonWorkInput> get serializer =>
      _$gDeletePromptonWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonWorkInput.serializer,
        json,
      );
}

abstract class GDeletePromptonWorkLikeInput
    implements
        Built<GDeletePromptonWorkLikeInput,
            GDeletePromptonWorkLikeInputBuilder> {
  GDeletePromptonWorkLikeInput._();

  factory GDeletePromptonWorkLikeInput(
          [Function(GDeletePromptonWorkLikeInputBuilder b) updates]) =
      _$GDeletePromptonWorkLikeInput;

  String get workId;
  static Serializer<GDeletePromptonWorkLikeInput> get serializer =>
      _$gDeletePromptonWorkLikeInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePromptonWorkLikeInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeletePromptonWorkLikeInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePromptonWorkLikeInput.serializer,
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteStickerInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteWorkBookmarkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteWorkBookmarkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteWorkLikeInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteWorkLikeInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteWorkLikeInput.serializer,
        json,
      );
}

abstract class GFlipPromptonFolderWorkIndexInput
    implements
        Built<GFlipPromptonFolderWorkIndexInput,
            GFlipPromptonFolderWorkIndexInputBuilder> {
  GFlipPromptonFolderWorkIndexInput._();

  factory GFlipPromptonFolderWorkIndexInput(
          [Function(GFlipPromptonFolderWorkIndexInputBuilder b) updates]) =
      _$GFlipPromptonFolderWorkIndexInput;

  String get folderId;
  String get workId;
  String get nextWorkId;
  static Serializer<GFlipPromptonFolderWorkIndexInput> get serializer =>
      _$gFlipPromptonFolderWorkIndexInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFlipPromptonFolderWorkIndexInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFlipPromptonFolderWorkIndexInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFlipPromptonFolderWorkIndexInput.serializer,
        json,
      );
}

class GFolderMode extends EnumClass {
  const GFolderMode._(String name) : super(name);

  static const GFolderMode NORMAL = _$gFolderModeNORMAL;

  static const GFolderMode COMIC_VERTICAL = _$gFolderModeCOMIC_VERTICAL;

  static const GFolderMode COMIC_HORIZONTAL = _$gFolderModeCOMIC_HORIZONTAL;

  static Serializer<GFolderMode> get serializer => _$gFolderModeSerializer;
  static BuiltSet<GFolderMode> get values => _$gFolderModeValues;
  static GFolderMode valueOf(String name) => _$gFolderModeValueOf(name);
}

abstract class GFoldersWhereInput
    implements Built<GFoldersWhereInput, GFoldersWhereInputBuilder> {
  GFoldersWhereInput._();

  factory GFoldersWhereInput([Function(GFoldersWhereInputBuilder b) updates]) =
      _$GFoldersWhereInput;

  String? get search;
  static Serializer<GFoldersWhereInput> get serializer =>
      _$gFoldersWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFoldersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFoldersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFoldersWhereInput.serializer,
        json,
      );
}

abstract class GFollowPromptonUserInput
    implements
        Built<GFollowPromptonUserInput, GFollowPromptonUserInputBuilder> {
  GFollowPromptonUserInput._();

  factory GFollowPromptonUserInput(
          [Function(GFollowPromptonUserInputBuilder b) updates]) =
      _$GFollowPromptonUserInput;

  String get userId;
  static Serializer<GFollowPromptonUserInput> get serializer =>
      _$gFollowPromptonUserInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowPromptonUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFollowPromptonUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowPromptonUserInput.serializer,
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFollowUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowUserInput.serializer,
        json,
      );
}

abstract class GIncrementPromptonProfileBlockIndexInput
    implements
        Built<GIncrementPromptonProfileBlockIndexInput,
            GIncrementPromptonProfileBlockIndexInputBuilder> {
  GIncrementPromptonProfileBlockIndexInput._();

  factory GIncrementPromptonProfileBlockIndexInput(
      [Function(GIncrementPromptonProfileBlockIndexInputBuilder b)
          updates]) = _$GIncrementPromptonProfileBlockIndexInput;

  String get profileBlockId;
  static Serializer<GIncrementPromptonProfileBlockIndexInput> get serializer =>
      _$gIncrementPromptonProfileBlockIndexInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIncrementPromptonProfileBlockIndexInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIncrementPromptonProfileBlockIndexInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIncrementPromptonProfileBlockIndexInput.serializer,
        json,
      );
}

abstract class GLoginPromptonInput
    implements Built<GLoginPromptonInput, GLoginPromptonInputBuilder> {
  GLoginPromptonInput._();

  factory GLoginPromptonInput(
      [Function(GLoginPromptonInputBuilder b) updates]) = _$GLoginPromptonInput;

  String get token;
  static Serializer<GLoginPromptonInput> get serializer =>
      _$gLoginPromptonInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLoginPromptonInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLoginPromptonInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLoginPromptonInput.serializer,
        json,
      );
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLoginWithPasswordInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLoginWithPasswordInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLoginWithPasswordInput.serializer,
        json,
      );
}

abstract class GMarkPromptonFolderAsPrivateInput
    implements
        Built<GMarkPromptonFolderAsPrivateInput,
            GMarkPromptonFolderAsPrivateInputBuilder> {
  GMarkPromptonFolderAsPrivateInput._();

  factory GMarkPromptonFolderAsPrivateInput(
          [Function(GMarkPromptonFolderAsPrivateInputBuilder b) updates]) =
      _$GMarkPromptonFolderAsPrivateInput;

  String get folderId;
  static Serializer<GMarkPromptonFolderAsPrivateInput> get serializer =>
      _$gMarkPromptonFolderAsPrivateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarkPromptonFolderAsPrivateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMarkPromptonFolderAsPrivateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarkPromptonFolderAsPrivateInput.serializer,
        json,
      );
}

abstract class GMarkPromptonFolderAsPublicInput
    implements
        Built<GMarkPromptonFolderAsPublicInput,
            GMarkPromptonFolderAsPublicInputBuilder> {
  GMarkPromptonFolderAsPublicInput._();

  factory GMarkPromptonFolderAsPublicInput(
          [Function(GMarkPromptonFolderAsPublicInputBuilder b) updates]) =
      _$GMarkPromptonFolderAsPublicInput;

  String get folderId;
  static Serializer<GMarkPromptonFolderAsPublicInput> get serializer =>
      _$gMarkPromptonFolderAsPublicInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarkPromptonFolderAsPublicInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMarkPromptonFolderAsPublicInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarkPromptonFolderAsPublicInput.serializer,
        json,
      );
}

abstract class GMarkPromptonPlanAsPrivateInput
    implements
        Built<GMarkPromptonPlanAsPrivateInput,
            GMarkPromptonPlanAsPrivateInputBuilder> {
  GMarkPromptonPlanAsPrivateInput._();

  factory GMarkPromptonPlanAsPrivateInput(
          [Function(GMarkPromptonPlanAsPrivateInputBuilder b) updates]) =
      _$GMarkPromptonPlanAsPrivateInput;

  String get planId;
  static Serializer<GMarkPromptonPlanAsPrivateInput> get serializer =>
      _$gMarkPromptonPlanAsPrivateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarkPromptonPlanAsPrivateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMarkPromptonPlanAsPrivateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarkPromptonPlanAsPrivateInput.serializer,
        json,
      );
}

abstract class GMarkPromptonPlanAsPublicInput
    implements
        Built<GMarkPromptonPlanAsPublicInput,
            GMarkPromptonPlanAsPublicInputBuilder> {
  GMarkPromptonPlanAsPublicInput._();

  factory GMarkPromptonPlanAsPublicInput(
          [Function(GMarkPromptonPlanAsPublicInputBuilder b) updates]) =
      _$GMarkPromptonPlanAsPublicInput;

  String get planId;
  static Serializer<GMarkPromptonPlanAsPublicInput> get serializer =>
      _$gMarkPromptonPlanAsPublicInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarkPromptonPlanAsPublicInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMarkPromptonPlanAsPublicInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarkPromptonPlanAsPublicInput.serializer,
        json,
      );
}

abstract class GMarkPromptonWorkAsPrivateInput
    implements
        Built<GMarkPromptonWorkAsPrivateInput,
            GMarkPromptonWorkAsPrivateInputBuilder> {
  GMarkPromptonWorkAsPrivateInput._();

  factory GMarkPromptonWorkAsPrivateInput(
          [Function(GMarkPromptonWorkAsPrivateInputBuilder b) updates]) =
      _$GMarkPromptonWorkAsPrivateInput;

  String get workId;
  static Serializer<GMarkPromptonWorkAsPrivateInput> get serializer =>
      _$gMarkPromptonWorkAsPrivateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarkPromptonWorkAsPrivateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMarkPromptonWorkAsPrivateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarkPromptonWorkAsPrivateInput.serializer,
        json,
      );
}

abstract class GMarkPromptonWorkAsPublicInput
    implements
        Built<GMarkPromptonWorkAsPublicInput,
            GMarkPromptonWorkAsPublicInputBuilder> {
  GMarkPromptonWorkAsPublicInput._();

  factory GMarkPromptonWorkAsPublicInput(
          [Function(GMarkPromptonWorkAsPublicInputBuilder b) updates]) =
      _$GMarkPromptonWorkAsPublicInput;

  String get workId;
  static Serializer<GMarkPromptonWorkAsPublicInput> get serializer =>
      _$gMarkPromptonWorkAsPublicInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarkPromptonWorkAsPublicInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMarkPromptonWorkAsPublicInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarkPromptonWorkAsPublicInput.serializer,
        json,
      );
}

abstract class GMarkPromptonWorkAsUserHeaderInput
    implements
        Built<GMarkPromptonWorkAsUserHeaderInput,
            GMarkPromptonWorkAsUserHeaderInputBuilder> {
  GMarkPromptonWorkAsUserHeaderInput._();

  factory GMarkPromptonWorkAsUserHeaderInput(
          [Function(GMarkPromptonWorkAsUserHeaderInputBuilder b) updates]) =
      _$GMarkPromptonWorkAsUserHeaderInput;

  String get workId;
  static Serializer<GMarkPromptonWorkAsUserHeaderInput> get serializer =>
      _$gMarkPromptonWorkAsUserHeaderInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarkPromptonWorkAsUserHeaderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMarkPromptonWorkAsUserHeaderInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarkPromptonWorkAsUserHeaderInput.serializer,
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMuteTagInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMuteTagInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMuteUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMuteUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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

abstract class GPinPromptonWorkInput
    implements Built<GPinPromptonWorkInput, GPinPromptonWorkInputBuilder> {
  GPinPromptonWorkInput._();

  factory GPinPromptonWorkInput(
          [Function(GPinPromptonWorkInputBuilder b) updates]) =
      _$GPinPromptonWorkInput;

  String get workId;
  static Serializer<GPinPromptonWorkInput> get serializer =>
      _$gPinPromptonWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPinPromptonWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPinPromptonWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPinPromptonWorkInput.serializer,
        json,
      );
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPopularWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPopularWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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

abstract class GPromptonFoldersWhereInput
    implements
        Built<GPromptonFoldersWhereInput, GPromptonFoldersWhereInputBuilder> {
  GPromptonFoldersWhereInput._();

  factory GPromptonFoldersWhereInput(
          [Function(GPromptonFoldersWhereInputBuilder b) updates]) =
      _$GPromptonFoldersWhereInput;

  String? get userId;
  static Serializer<GPromptonFoldersWhereInput> get serializer =>
      _$gPromptonFoldersWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonFoldersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonFoldersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonFoldersWhereInput.serializer,
        json,
      );
}

abstract class GPromptonLabelsWhereInput
    implements
        Built<GPromptonLabelsWhereInput, GPromptonLabelsWhereInputBuilder> {
  GPromptonLabelsWhereInput._();

  factory GPromptonLabelsWhereInput(
          [Function(GPromptonLabelsWhereInputBuilder b) updates]) =
      _$GPromptonLabelsWhereInput;

  String? get search;
  static Serializer<GPromptonLabelsWhereInput> get serializer =>
      _$gPromptonLabelsWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonLabelsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonLabelsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonLabelsWhereInput.serializer,
        json,
      );
}

abstract class GPromptonPlansWhereInput
    implements
        Built<GPromptonPlansWhereInput, GPromptonPlansWhereInputBuilder> {
  GPromptonPlansWhereInput._();

  factory GPromptonPlansWhereInput(
          [Function(GPromptonPlansWhereInputBuilder b) updates]) =
      _$GPromptonPlansWhereInput;

  String? get search;
  String? get objectSlug;
  bool? get isUnique;
  static Serializer<GPromptonPlansWhereInput> get serializer =>
      _$gPromptonPlansWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonPlansWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonPlansWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonPlansWhereInput.serializer,
        json,
      );
}

abstract class GPromptonRequestsWhereInput
    implements
        Built<GPromptonRequestsWhereInput, GPromptonRequestsWhereInputBuilder> {
  GPromptonRequestsWhereInput._();

  factory GPromptonRequestsWhereInput(
          [Function(GPromptonRequestsWhereInputBuilder b) updates]) =
      _$GPromptonRequestsWhereInput;

  String? get status;
  static Serializer<GPromptonRequestsWhereInput> get serializer =>
      _$gPromptonRequestsWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonRequestsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonRequestsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonRequestsWhereInput.serializer,
        json,
      );
}

abstract class GPromptonTagsWhereInput
    implements Built<GPromptonTagsWhereInput, GPromptonTagsWhereInputBuilder> {
  GPromptonTagsWhereInput._();

  factory GPromptonTagsWhereInput(
          [Function(GPromptonTagsWhereInputBuilder b) updates]) =
      _$GPromptonTagsWhereInput;

  String? get search;
  bool? get isPinned;
  static Serializer<GPromptonTagsWhereInput> get serializer =>
      _$gPromptonTagsWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonTagsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonTagsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonTagsWhereInput.serializer,
        json,
      );
}

abstract class GPromptonUsersWhereInput
    implements
        Built<GPromptonUsersWhereInput, GPromptonUsersWhereInputBuilder> {
  GPromptonUsersWhereInput._();

  factory GPromptonUsersWhereInput(
          [Function(GPromptonUsersWhereInputBuilder b) updates]) =
      _$GPromptonUsersWhereInput;

  String? get search;
  static Serializer<GPromptonUsersWhereInput> get serializer =>
      _$gPromptonUsersWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonUsersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonUsersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonUsersWhereInput.serializer,
        json,
      );
}

abstract class GPromptonUserWorksWhereInput
    implements
        Built<GPromptonUserWorksWhereInput,
            GPromptonUserWorksWhereInputBuilder> {
  GPromptonUserWorksWhereInput._();

  factory GPromptonUserWorksWhereInput(
          [Function(GPromptonUserWorksWhereInputBuilder b) updates]) =
      _$GPromptonUserWorksWhereInput;

  bool? get isUncategorized;
  static Serializer<GPromptonUserWorksWhereInput> get serializer =>
      _$gPromptonUserWorksWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonUserWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonUserWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonUserWorksWhereInput.serializer,
        json,
      );
}

abstract class GPromptonViewerWorksWhereInput
    implements
        Built<GPromptonViewerWorksWhereInput,
            GPromptonViewerWorksWhereInputBuilder> {
  GPromptonViewerWorksWhereInput._();

  factory GPromptonViewerWorksWhereInput(
          [Function(GPromptonViewerWorksWhereInputBuilder b) updates]) =
      _$GPromptonViewerWorksWhereInput;

  bool? get isUncategorized;
  static Serializer<GPromptonViewerWorksWhereInput> get serializer =>
      _$gPromptonViewerWorksWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonViewerWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonViewerWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonViewerWorksWhereInput.serializer,
        json,
      );
}

abstract class GPromptonWorksWhereInput
    implements
        Built<GPromptonWorksWhereInput, GPromptonWorksWhereInputBuilder> {
  GPromptonWorksWhereInput._();

  factory GPromptonWorksWhereInput(
          [Function(GPromptonWorksWhereInputBuilder b) updates]) =
      _$GPromptonWorksWhereInput;

  BuiltList<String>? get tagSlugs;
  String? get search;
  String? get color;
  static Serializer<GPromptonWorksWhereInput> get serializer =>
      _$gPromptonWorksWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromptonWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromptonWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromptonWorksWhereInput.serializer,
        json,
      );
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

abstract class GRejectPromptonRequestInput
    implements
        Built<GRejectPromptonRequestInput, GRejectPromptonRequestInputBuilder> {
  GRejectPromptonRequestInput._();

  factory GRejectPromptonRequestInput(
          [Function(GRejectPromptonRequestInputBuilder b) updates]) =
      _$GRejectPromptonRequestInput;

  String get requestId;
  static Serializer<GRejectPromptonRequestInput> get serializer =>
      _$gRejectPromptonRequestInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRejectPromptonRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRejectPromptonRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRejectPromptonRequestInput.serializer,
        json,
      );
}

abstract class GRemovePromptonTagFromWorkInput
    implements
        Built<GRemovePromptonTagFromWorkInput,
            GRemovePromptonTagFromWorkInputBuilder> {
  GRemovePromptonTagFromWorkInput._();

  factory GRemovePromptonTagFromWorkInput(
          [Function(GRemovePromptonTagFromWorkInputBuilder b) updates]) =
      _$GRemovePromptonTagFromWorkInput;

  String get workId;
  String get tagId;
  static Serializer<GRemovePromptonTagFromWorkInput> get serializer =>
      _$gRemovePromptonTagFromWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemovePromptonTagFromWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRemovePromptonTagFromWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemovePromptonTagFromWorkInput.serializer,
        json,
      );
}

abstract class GRemovePromptonWorkFromFolderInput
    implements
        Built<GRemovePromptonWorkFromFolderInput,
            GRemovePromptonWorkFromFolderInputBuilder> {
  GRemovePromptonWorkFromFolderInput._();

  factory GRemovePromptonWorkFromFolderInput(
          [Function(GRemovePromptonWorkFromFolderInputBuilder b) updates]) =
      _$GRemovePromptonWorkFromFolderInput;

  String get folderId;
  String get workId;
  static Serializer<GRemovePromptonWorkFromFolderInput> get serializer =>
      _$gRemovePromptonWorkFromFolderInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemovePromptonWorkFromFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRemovePromptonWorkFromFolderInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemovePromptonWorkFromFolderInput.serializer,
        json,
      );
}

abstract class GStickersWhereInput
    implements Built<GStickersWhereInput, GStickersWhereInputBuilder> {
  GStickersWhereInput._();

  factory GStickersWhereInput(
      [Function(GStickersWhereInputBuilder b) updates]) = _$GStickersWhereInput;

  String? get search;
  static Serializer<GStickersWhereInput> get serializer =>
      _$gStickersWhereInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GStickersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTagsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagsWhereInput.serializer,
        json,
      );
}

abstract class GTestPromptonIntegrationInput
    implements
        Built<GTestPromptonIntegrationInput,
            GTestPromptonIntegrationInputBuilder> {
  GTestPromptonIntegrationInput._();

  factory GTestPromptonIntegrationInput(
          [Function(GTestPromptonIntegrationInputBuilder b) updates]) =
      _$GTestPromptonIntegrationInput;

  String get integrationId;
  static Serializer<GTestPromptonIntegrationInput> get serializer =>
      _$gTestPromptonIntegrationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTestPromptonIntegrationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTestPromptonIntegrationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTestPromptonIntegrationInput.serializer,
        json,
      );
}

abstract class GUnfollowPromptonUserInput
    implements
        Built<GUnfollowPromptonUserInput, GUnfollowPromptonUserInputBuilder> {
  GUnfollowPromptonUserInput._();

  factory GUnfollowPromptonUserInput(
          [Function(GUnfollowPromptonUserInputBuilder b) updates]) =
      _$GUnfollowPromptonUserInput;

  String get userId;
  static Serializer<GUnfollowPromptonUserInput> get serializer =>
      _$gUnfollowPromptonUserInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnfollowPromptonUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnfollowPromptonUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnfollowPromptonUserInput.serializer,
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnfollowUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnfollowUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnmuteTagInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnmuteTagInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnmuteUserInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnmuteUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnmuteUserInput.serializer,
        json,
      );
}

abstract class GUnpinPromptonWorkInput
    implements Built<GUnpinPromptonWorkInput, GUnpinPromptonWorkInputBuilder> {
  GUnpinPromptonWorkInput._();

  factory GUnpinPromptonWorkInput(
          [Function(GUnpinPromptonWorkInputBuilder b) updates]) =
      _$GUnpinPromptonWorkInput;

  String get workId;
  static Serializer<GUnpinPromptonWorkInput> get serializer =>
      _$gUnpinPromptonWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnpinPromptonWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnpinPromptonWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnpinPromptonWorkInput.serializer,
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateFolderInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonFolderInput
    implements
        Built<GUpdatePromptonFolderInput, GUpdatePromptonFolderInputBuilder> {
  GUpdatePromptonFolderInput._();

  factory GUpdatePromptonFolderInput(
          [Function(GUpdatePromptonFolderInputBuilder b) updates]) =
      _$GUpdatePromptonFolderInput;

  String get folderId;
  String get name;
  String get description;
  String? get imageFileId;
  static Serializer<GUpdatePromptonFolderInput> get serializer =>
      _$gUpdatePromptonFolderInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonFolderInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonFolderSortInput
    implements
        Built<GUpdatePromptonFolderSortInput,
            GUpdatePromptonFolderSortInputBuilder> {
  GUpdatePromptonFolderSortInput._();

  factory GUpdatePromptonFolderSortInput(
          [Function(GUpdatePromptonFolderSortInputBuilder b) updates]) =
      _$GUpdatePromptonFolderSortInput;

  String get folderId;
  static Serializer<GUpdatePromptonFolderSortInput> get serializer =>
      _$gUpdatePromptonFolderSortInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonFolderSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonFolderSortInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonFolderSortInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonPlanInput
    implements
        Built<GUpdatePromptonPlanInput, GUpdatePromptonPlanInputBuilder> {
  GUpdatePromptonPlanInput._();

  factory GUpdatePromptonPlanInput(
          [Function(GUpdatePromptonPlanInputBuilder b) updates]) =
      _$GUpdatePromptonPlanInput;

  String get planId;
  String get category;
  String get name;
  String get message;
  String get description;
  int get unitPrice;
  int get minimumQuantity;
  int get maximumQuantity;
  BuiltList<String> get styleSlugs;
  BuiltList<String> get objectSlugs;
  bool get featurePrivate;
  bool get featureCopyrightFree;
  bool get featureCommercialUse;
  bool get featureFanFiction;
  String? get imageFileId;
  static Serializer<GUpdatePromptonPlanInput> get serializer =>
      _$gUpdatePromptonPlanInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonPlanInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonPlanInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonPlanInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonPlanSortInput
    implements
        Built<GUpdatePromptonPlanSortInput,
            GUpdatePromptonPlanSortInputBuilder> {
  GUpdatePromptonPlanSortInput._();

  factory GUpdatePromptonPlanSortInput(
          [Function(GUpdatePromptonPlanSortInputBuilder b) updates]) =
      _$GUpdatePromptonPlanSortInput;

  String get planId;
  static Serializer<GUpdatePromptonPlanSortInput> get serializer =>
      _$gUpdatePromptonPlanSortInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonPlanSortInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonPlanSortInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonPlanSortInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonProfileBlockInput
    implements
        Built<GUpdatePromptonProfileBlockInput,
            GUpdatePromptonProfileBlockInputBuilder> {
  GUpdatePromptonProfileBlockInput._();

  factory GUpdatePromptonProfileBlockInput(
          [Function(GUpdatePromptonProfileBlockInputBuilder b) updates]) =
      _$GUpdatePromptonProfileBlockInput;

  String get profileBlockId;
  String? get siteURL;
  String? get title;
  String? get description;
  static Serializer<GUpdatePromptonProfileBlockInput> get serializer =>
      _$gUpdatePromptonProfileBlockInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonProfileBlockInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonProfileBlockInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonProfileBlockInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonPromptCategoryInput
    implements
        Built<GUpdatePromptonPromptCategoryInput,
            GUpdatePromptonPromptCategoryInputBuilder> {
  GUpdatePromptonPromptCategoryInput._();

  factory GUpdatePromptonPromptCategoryInput(
          [Function(GUpdatePromptonPromptCategoryInputBuilder b) updates]) =
      _$GUpdatePromptonPromptCategoryInput;

  String get promptCategoryId;
  String get name;
  String? get description;
  static Serializer<GUpdatePromptonPromptCategoryInput> get serializer =>
      _$gUpdatePromptonPromptCategoryInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonPromptCategoryInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonPromptCategoryInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonPromptCategoryInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonPromptInput
    implements
        Built<GUpdatePromptonPromptInput, GUpdatePromptonPromptInputBuilder> {
  GUpdatePromptonPromptInput._();

  factory GUpdatePromptonPromptInput(
          [Function(GUpdatePromptonPromptInputBuilder b) updates]) =
      _$GUpdatePromptonPromptInput;

  String get promptId;
  String get name;
  String? get description;
  bool get isNsfw;
  bool get isBase;
  bool get isSingle;
  static Serializer<GUpdatePromptonPromptInput> get serializer =>
      _$gUpdatePromptonPromptInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonPromptInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonPromptInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonPromptInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonUserAvatarInput
    implements
        Built<GUpdatePromptonUserAvatarInput,
            GUpdatePromptonUserAvatarInputBuilder> {
  GUpdatePromptonUserAvatarInput._();

  factory GUpdatePromptonUserAvatarInput(
          [Function(GUpdatePromptonUserAvatarInputBuilder b) updates]) =
      _$GUpdatePromptonUserAvatarInput;

  String? get avatarFileId;
  static Serializer<GUpdatePromptonUserAvatarInput> get serializer =>
      _$gUpdatePromptonUserAvatarInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonUserAvatarInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonUserAvatarInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonUserAvatarInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonUserHeaderImageInput
    implements
        Built<GUpdatePromptonUserHeaderImageInput,
            GUpdatePromptonUserHeaderImageInputBuilder> {
  GUpdatePromptonUserHeaderImageInput._();

  factory GUpdatePromptonUserHeaderImageInput(
          [Function(GUpdatePromptonUserHeaderImageInputBuilder b) updates]) =
      _$GUpdatePromptonUserHeaderImageInput;

  String get imageFileId;
  static Serializer<GUpdatePromptonUserHeaderImageInput> get serializer =>
      _$gUpdatePromptonUserHeaderImageInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonUserHeaderImageInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonUserHeaderImageInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonUserHeaderImageInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonUserLoginInput
    implements
        Built<GUpdatePromptonUserLoginInput,
            GUpdatePromptonUserLoginInputBuilder> {
  GUpdatePromptonUserLoginInput._();

  factory GUpdatePromptonUserLoginInput(
          [Function(GUpdatePromptonUserLoginInputBuilder b) updates]) =
      _$GUpdatePromptonUserLoginInput;

  String get login;
  static Serializer<GUpdatePromptonUserLoginInput> get serializer =>
      _$gUpdatePromptonUserLoginInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonUserLoginInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonUserLoginInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonUserLoginInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonUserProfileInput
    implements
        Built<GUpdatePromptonUserProfileInput,
            GUpdatePromptonUserProfileInputBuilder> {
  GUpdatePromptonUserProfileInput._();

  factory GUpdatePromptonUserProfileInput(
          [Function(GUpdatePromptonUserProfileInputBuilder b) updates]) =
      _$GUpdatePromptonUserProfileInput;

  String get name;
  String? get biography;
  String? get twitterUsername;
  String? get githubUsername;
  String? get instagramUsername;
  String? get pixivUsername;
  String? get tumblrUsername;
  String? get deviantartUsername;
  static Serializer<GUpdatePromptonUserProfileInput> get serializer =>
      _$gUpdatePromptonUserProfileInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonUserProfileInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonUserProfileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonUserProfileInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonWorkInput
    implements
        Built<GUpdatePromptonWorkInput, GUpdatePromptonWorkInputBuilder> {
  GUpdatePromptonWorkInput._();

  factory GUpdatePromptonWorkInput(
          [Function(GUpdatePromptonWorkInputBuilder b) updates]) =
      _$GUpdatePromptonWorkInput;

  String get workId;
  String? get title;
  String? get body;
  static Serializer<GUpdatePromptonWorkInput> get serializer =>
      _$gUpdatePromptonWorkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePromptonWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonWorkInput.serializer,
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateStickerInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserProfileInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserProfileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUsersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUsersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkAwardsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkAwardsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
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
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorksWhereInput.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {
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
    'PromptonAccountNode',
    'PromptonBookmarkNode',
    'PromptonCustomerNode',
    'PromptonDeliverableNode',
    'PromptonFileNode',
    'PromptonFolderKeyNode',
    'PromptonFolderNode',
    'PromptonFolderViewerNode',
    'PromptonFriendshipNode',
    'PromptonIntegrationNode',
    'PromptonLabelNode',
    'PromptonLikeNode',
    'PromptonMessageNode',
    'PromptonPaymentIntentNode',
    'PromptonPaymentMethodNode',
    'PromptonPaymentNode',
    'PromptonPayoutNode',
    'PromptonPlanNode',
    'PromptonPromptNode',
    'PromptonReactionNode',
    'PromptonRequestNode',
    'PromptonTagNode',
    'PromptonUserNode',
    'PromptonWorkNode',
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
  'Edge': {
    'PromptonLabelEdge',
    'PromptonWorkEdge',
  },
  'Connection': {
    'PromptonLabelsConnection',
    'PromptonWorksConnection',
  },
};
