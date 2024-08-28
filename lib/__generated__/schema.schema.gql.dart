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
          [void Function(GAcceptPromptonRequestInputBuilder b) updates]) =
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

  static const GAccessType DRAFT = _$gAccessTypeDRAFT;

  static const GAccessType LIMITED = _$gAccessTypeLIMITED;

  static const GAccessType PRIVATE = _$gAccessTypePRIVATE;

  static const GAccessType PUBLIC = _$gAccessTypePUBLIC;

  static const GAccessType SILENT = _$gAccessTypeSILENT;

  static Serializer<GAccessType> get serializer => _$gAccessTypeSerializer;

  static BuiltSet<GAccessType> get values => _$gAccessTypeValues;

  static GAccessType valueOf(String name) => _$gAccessTypeValueOf(name);
}

abstract class GAddPromptonTagToWorkInput
    implements
        Built<GAddPromptonTagToWorkInput, GAddPromptonTagToWorkInputBuilder> {
  GAddPromptonTagToWorkInput._();

  factory GAddPromptonTagToWorkInput(
          [void Function(GAddPromptonTagToWorkInputBuilder b) updates]) =
      _$GAddPromptonTagToWorkInput;

  String get tagNameJA;
  String get workId;
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
          [void Function(GAddPromptonWorkToFolderInputBuilder b) updates]) =
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

class GAdminAccessType extends EnumClass {
  const GAdminAccessType._(String name) : super(name);

  static const GAdminAccessType PRIVATE = _$gAdminAccessTypePRIVATE;

  static const GAdminAccessType PUBLIC = _$gAdminAccessTypePUBLIC;

  static const GAdminAccessType TEMPORARY_PRIVATE =
      _$gAdminAccessTypeTEMPORARY_PRIVATE;

  static Serializer<GAdminAccessType> get serializer =>
      _$gAdminAccessTypeSerializer;

  static BuiltSet<GAdminAccessType> get values => _$gAdminAccessTypeValues;

  static GAdminAccessType valueOf(String name) =>
      _$gAdminAccessTypeValueOf(name);
}

class GAiModelType extends EnumClass {
  const GAiModelType._(String name) : super(name);

  static const GAiModelType IMAGE = _$gAiModelTypeIMAGE;

  static Serializer<GAiModelType> get serializer => _$gAiModelTypeSerializer;

  static BuiltSet<GAiModelType> get values => _$gAiModelTypeValues;

  static GAiModelType valueOf(String name) => _$gAiModelTypeValueOf(name);
}

abstract class GAiModelWhereInput
    implements Built<GAiModelWhereInput, GAiModelWhereInputBuilder> {
  GAiModelWhereInput._();

  factory GAiModelWhereInput(
          [void Function(GAiModelWhereInputBuilder b) updates]) =
      _$GAiModelWhereInput;

  String? get search;
  static Serializer<GAiModelWhereInput> get serializer =>
      _$gAiModelWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAiModelWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAiModelWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAiModelWhereInput.serializer,
        json,
      );
}

class GAlbumOrderBy extends EnumClass {
  const GAlbumOrderBy._(String name) : super(name);

  static const GAlbumOrderBy DATE_CREATED = _$gAlbumOrderByDATE_CREATED;

  static const GAlbumOrderBy NAME = _$gAlbumOrderByNAME;

  static Serializer<GAlbumOrderBy> get serializer => _$gAlbumOrderBySerializer;

  static BuiltSet<GAlbumOrderBy> get values => _$gAlbumOrderByValues;

  static GAlbumOrderBy valueOf(String name) => _$gAlbumOrderByValueOf(name);
}

class GAlbumRating extends EnumClass {
  const GAlbumRating._(String name) : super(name);

  static const GAlbumRating G = _$gAlbumRatingG;

  static const GAlbumRating R18 = _$gAlbumRatingR18;

  static Serializer<GAlbumRating> get serializer => _$gAlbumRatingSerializer;

  static BuiltSet<GAlbumRating> get values => _$gAlbumRatingValues;

  static GAlbumRating valueOf(String name) => _$gAlbumRatingValueOf(name);
}

abstract class GAlbumsWhereInput
    implements Built<GAlbumsWhereInput, GAlbumsWhereInputBuilder> {
  GAlbumsWhereInput._();

  factory GAlbumsWhereInput(
          [void Function(GAlbumsWhereInputBuilder b) updates]) =
      _$GAlbumsWhereInput;

  bool? get isSensitive;
  bool? get isSensitiveAndAllRating;
  bool? get needInspected;
  bool? get needsThumbnailImage;
  GAlbumOrderBy? get orderBy;
  String? get ownerUserId;
  BuiltList<GAlbumRating>? get ratings;
  String? get search;
  GSort? get sort;
  static Serializer<GAlbumsWhereInput> get serializer =>
      _$gAlbumsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlbumsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAlbumsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlbumsWhereInput.serializer,
        json,
      );
}

abstract class GAppEventsWhereInput
    implements Built<GAppEventsWhereInput, GAppEventsWhereInputBuilder> {
  GAppEventsWhereInput._();

  factory GAppEventsWhereInput(
          [void Function(GAppEventsWhereInputBuilder b) updates]) =
      _$GAppEventsWhereInput;

  String? get endAt;
  String? get slug;
  String? get startAt;
  String? get tag;
  String? get title;
  static Serializer<GAppEventsWhereInput> get serializer =>
      _$gAppEventsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAppEventsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAppEventsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAppEventsWhereInput.serializer,
        json,
      );
}

abstract class GAwardsWhereInput
    implements Built<GAwardsWhereInput, GAwardsWhereInputBuilder> {
  GAwardsWhereInput._();

  factory GAwardsWhereInput(
          [void Function(GAwardsWhereInputBuilder b) updates]) =
      _$GAwardsWhereInput;

  String? get date;
  int? get day;
  int? get month;
  GAwardType? get type;
  GWorkType? get workType;
  int? get year;
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

  static const GAwardType DAILY = _$gAwardTypeDAILY;

  static const GAwardType DAILY_NO_THEME = _$gAwardTypeDAILY_NO_THEME;

  static const GAwardType MONTHLY = _$gAwardTypeMONTHLY;

  static const GAwardType WEEKLY = _$gAwardTypeWEEKLY;

  static Serializer<GAwardType> get serializer => _$gAwardTypeSerializer;

  static BuiltSet<GAwardType> get values => _$gAwardTypeValues;

  static GAwardType valueOf(String name) => _$gAwardTypeValueOf(name);
}

abstract class GBlockPromptonUserInput
    implements Built<GBlockPromptonUserInput, GBlockPromptonUserInputBuilder> {
  GBlockPromptonUserInput._();

  factory GBlockPromptonUserInput(
          [void Function(GBlockPromptonUserInputBuilder b) updates]) =
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

class GBookmarkedStickerType extends EnumClass {
  const GBookmarkedStickerType._(String name) : super(name);

  static const GBookmarkedStickerType comment = _$gBookmarkedStickerTypecomment;

  static const GBookmarkedStickerType reply = _$gBookmarkedStickerTypereply;

  static Serializer<GBookmarkedStickerType> get serializer =>
      _$gBookmarkedStickerTypeSerializer;

  static BuiltSet<GBookmarkedStickerType> get values =>
      _$gBookmarkedStickerTypeValues;

  static GBookmarkedStickerType valueOf(String name) =>
      _$gBookmarkedStickerTypeValueOf(name);
}

abstract class GCancelImageGenerationReservedTaskInput
    implements
        Built<GCancelImageGenerationReservedTaskInput,
            GCancelImageGenerationReservedTaskInputBuilder> {
  GCancelImageGenerationReservedTaskInput._();

  factory GCancelImageGenerationReservedTaskInput(
      [void Function(GCancelImageGenerationReservedTaskInputBuilder b)
          updates]) = _$GCancelImageGenerationReservedTaskInput;

  String get nanoid;
  static Serializer<GCancelImageGenerationReservedTaskInput> get serializer =>
      _$gCancelImageGenerationReservedTaskInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelImageGenerationReservedTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelImageGenerationReservedTaskInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelImageGenerationReservedTaskInput.serializer,
        json,
      );
}

abstract class GCancelImageGenerationTaskInput
    implements
        Built<GCancelImageGenerationTaskInput,
            GCancelImageGenerationTaskInputBuilder> {
  GCancelImageGenerationTaskInput._();

  factory GCancelImageGenerationTaskInput(
          [void Function(GCancelImageGenerationTaskInputBuilder b) updates]) =
      _$GCancelImageGenerationTaskInput;

  String get nanoid;
  static Serializer<GCancelImageGenerationTaskInput> get serializer =>
      _$gCancelImageGenerationTaskInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelImageGenerationTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelImageGenerationTaskInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelImageGenerationTaskInput.serializer,
        json,
      );
}

abstract class GCancelPromptonRequestInput
    implements
        Built<GCancelPromptonRequestInput, GCancelPromptonRequestInputBuilder> {
  GCancelPromptonRequestInput._();

  factory GCancelPromptonRequestInput(
          [void Function(GCancelPromptonRequestInputBuilder b) updates]) =
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
          [void Function(GChangePromptonFolderToPaidInputBuilder b) updates]) =
      _$GChangePromptonFolderToPaidInput;

  bool get featureCommercialUse;
  String get folderId;
  int get price;
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
          [void Function(GClosePromptonRequestInputBuilder b) updates]) =
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

abstract class GCommentsOrderBy
    implements Built<GCommentsOrderBy, GCommentsOrderByBuilder> {
  GCommentsOrderBy._();

  factory GCommentsOrderBy([void Function(GCommentsOrderByBuilder b) updates]) =
      _$GCommentsOrderBy;

  GDirection? get createdAt;
  static Serializer<GCommentsOrderBy> get serializer =>
      _$gCommentsOrderBySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCommentsOrderBy.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommentsOrderBy? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCommentsOrderBy.serializer,
        json,
      );
}

abstract class GCommentsWhereInput
    implements Built<GCommentsWhereInput, GCommentsWhereInputBuilder> {
  GCommentsWhereInput._();

  factory GCommentsWhereInput(
          [void Function(GCommentsWhereInputBuilder b) updates]) =
      _$GCommentsWhereInput;

  bool? get isSensitive;
  BuiltList<GRating>? get ratings;
  static Serializer<GCommentsWhereInput> get serializer =>
      _$gCommentsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCommentsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommentsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCommentsWhereInput.serializer,
        json,
      );
}

abstract class GCreateAccountInput
    implements Built<GCreateAccountInput, GCreateAccountInputBuilder> {
  GCreateAccountInput._();

  factory GCreateAccountInput(
          [void Function(GCreateAccountInputBuilder b) updates]) =
      _$GCreateAccountInput;

  String get idToken;
  static Serializer<GCreateAccountInput> get serializer =>
      _$gCreateAccountInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAccountInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAccountInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAccountInput.serializer,
        json,
      );
}

abstract class GCreateAlbumInput
    implements Built<GCreateAlbumInput, GCreateAlbumInputBuilder> {
  GCreateAlbumInput._();

  factory GCreateAlbumInput(
          [void Function(GCreateAlbumInputBuilder b) updates]) =
      _$GCreateAlbumInput;

  String? get description;
  String get slug;
  String? get thumbnailUrl;
  String get title;
  BuiltList<String> get workIds;
  static Serializer<GCreateAlbumInput> get serializer =>
      _$gCreateAlbumInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAlbumInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAlbumInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAlbumInput.serializer,
        json,
      );
}

abstract class GCreateAlbumWorkInput
    implements Built<GCreateAlbumWorkInput, GCreateAlbumWorkInputBuilder> {
  GCreateAlbumWorkInput._();

  factory GCreateAlbumWorkInput(
          [void Function(GCreateAlbumWorkInputBuilder b) updates]) =
      _$GCreateAlbumWorkInput;

  String get albumId;
  String get workId;
  static Serializer<GCreateAlbumWorkInput> get serializer =>
      _$gCreateAlbumWorkInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAlbumWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAlbumWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAlbumWorkInput.serializer,
        json,
      );
}

abstract class GCreateFolderInput
    implements Built<GCreateFolderInput, GCreateFolderInputBuilder> {
  GCreateFolderInput._();

  factory GCreateFolderInput(
          [void Function(GCreateFolderInputBuilder b) updates]) =
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

abstract class GCreateFolderWorkInput
    implements Built<GCreateFolderWorkInput, GCreateFolderWorkInputBuilder> {
  GCreateFolderWorkInput._();

  factory GCreateFolderWorkInput(
          [void Function(GCreateFolderWorkInputBuilder b) updates]) =
      _$GCreateFolderWorkInput;

  String get folderId;
  String get workId;
  static Serializer<GCreateFolderWorkInput> get serializer =>
      _$gCreateFolderWorkInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateFolderWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateFolderWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateFolderWorkInput.serializer,
        json,
      );
}

abstract class GCreateImageGenerationMemoInput
    implements
        Built<GCreateImageGenerationMemoInput,
            GCreateImageGenerationMemoInputBuilder> {
  GCreateImageGenerationMemoInput._();

  factory GCreateImageGenerationMemoInput(
          [void Function(GCreateImageGenerationMemoInputBuilder b) updates]) =
      _$GCreateImageGenerationMemoInput;

  int get clipSkip;
  String get explanation;
  int get height;
  String get modelId;
  String get negativePrompts;
  String get prompts;
  String get sampler;
  int get scale;
  int get seed;
  int get steps;
  String get title;
  String get vae;
  int get width;
  static Serializer<GCreateImageGenerationMemoInput> get serializer =>
      _$gCreateImageGenerationMemoInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateImageGenerationMemoInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateImageGenerationMemoInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateImageGenerationMemoInput.serializer,
        json,
      );
}

abstract class GCreateImageGenerationTaskInput
    implements
        Built<GCreateImageGenerationTaskInput,
            GCreateImageGenerationTaskInputBuilder> {
  GCreateImageGenerationTaskInput._();

  factory GCreateImageGenerationTaskInput(
          [void Function(GCreateImageGenerationTaskInputBuilder b) updates]) =
      _$GCreateImageGenerationTaskInput;

  int? get clipSkip;
  String? get controlNetControlMode;
  bool? get controlNetEnabled;
  double? get controlNetGuidance;
  double? get controlNetGuidanceEnd;
  double? get controlNetGuidanceStart;
  String? get controlNetHrOption;
  String? get controlNetImageUrl;
  String? get controlNetMaskImageUrl;
  String? get controlNetModel;
  String? get controlNetModule;
  bool? get controlNetPixelPerfect;
  int? get controlNetProcessorRes;
  String? get controlNetResizeMode;
  bool? get controlNetSaveDetectedMap;
  int? get controlNetThresholdA;
  int? get controlNetThresholdB;
  double? get controlNetWeight;
  int get count;
  String get model;
  String get negativePrompt;
  String get prompt;
  String get sampler;
  int get scale;
  double get seed;
  GImageGenerationSizeType get sizeType;
  int get steps;
  String? get t2tDenoisingStrengthSize;
  String? get t2tImageUrl;
  String? get t2tInpaintingFillSize;
  String? get t2tMaskImageUrl;
  GImageGenerationType get type;
  double? get upscaleSize;
  String get vae;
  static Serializer<GCreateImageGenerationTaskInput> get serializer =>
      _$gCreateImageGenerationTaskInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateImageGenerationTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateImageGenerationTaskInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateImageGenerationTaskInput.serializer,
        json,
      );
}

abstract class GCreateMessageInput
    implements Built<GCreateMessageInput, GCreateMessageInputBuilder> {
  GCreateMessageInput._();

  factory GCreateMessageInput(
          [void Function(GCreateMessageInputBuilder b) updates]) =
      _$GCreateMessageInput;

  String get recipientId;
  String get text;
  static Serializer<GCreateMessageInput> get serializer =>
      _$gCreateMessageInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateMessageInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateMessageInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateMessageInput.serializer,
        json,
      );
}

abstract class GCreateNoteInput
    implements Built<GCreateNoteInput, GCreateNoteInputBuilder> {
  GCreateNoteInput._();

  factory GCreateNoteInput([void Function(GCreateNoteInputBuilder b) updates]) =
      _$GCreateNoteInput;

  String get text;
  static Serializer<GCreateNoteInput> get serializer =>
      _$gCreateNoteInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateNoteInput.serializer,
        json,
      );
}

abstract class GCreateNovelInput
    implements Built<GCreateNovelInput, GCreateNovelInputBuilder> {
  GCreateNovelInput._();

  factory GCreateNovelInput(
          [void Function(GCreateNovelInputBuilder b) updates]) =
      _$GCreateNovelInput;

  String get text;
  static Serializer<GCreateNovelInput> get serializer =>
      _$gCreateNovelInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateNovelInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateNovelInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateNovelInput.serializer,
        json,
      );
}

abstract class GCreatePassCheckoutSessionInput
    implements
        Built<GCreatePassCheckoutSessionInput,
            GCreatePassCheckoutSessionInputBuilder> {
  GCreatePassCheckoutSessionInput._();

  factory GCreatePassCheckoutSessionInput(
          [void Function(GCreatePassCheckoutSessionInputBuilder b) updates]) =
      _$GCreatePassCheckoutSessionInput;

  GPassType get passType;
  static Serializer<GCreatePassCheckoutSessionInput> get serializer =>
      _$gCreatePassCheckoutSessionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePassCheckoutSessionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreatePassCheckoutSessionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePassCheckoutSessionInput.serializer,
        json,
      );
}

abstract class GCreatePromptonAipicRequestInput
    implements
        Built<GCreatePromptonAipicRequestInput,
            GCreatePromptonAipicRequestInputBuilder> {
  GCreatePromptonAipicRequestInput._();

  factory GCreatePromptonAipicRequestInput(
          [void Function(GCreatePromptonAipicRequestInputBuilder b) updates]) =
      _$GCreatePromptonAipicRequestInput;

  int? get fee;
  String? get note;
  String get recipientId;
  static Serializer<GCreatePromptonAipicRequestInput> get serializer =>
      _$gCreatePromptonAipicRequestInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonAipicRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreatePromptonAipicRequestInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonAipicRequestInput.serializer,
        json,
      );
}

abstract class GCreatePromptonChatMessageInput
    implements
        Built<GCreatePromptonChatMessageInput,
            GCreatePromptonChatMessageInputBuilder> {
  GCreatePromptonChatMessageInput._();

  factory GCreatePromptonChatMessageInput(
          [void Function(GCreatePromptonChatMessageInputBuilder b) updates]) =
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
          [void Function(GCreatePromptonCoffeeRequestInputBuilder b) updates]) =
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
          [void Function(GCreatePromptonDeliverableInputBuilder b) updates]) =
      _$GCreatePromptonDeliverableInput;

  String? get description;
  String get fileId;
  String get fileType;
  String? get name;
  String get requestId;
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
          [void Function(GCreatePromptonFileInputBuilder b) updates]) =
      _$GCreatePromptonFileInput;

  String get fileId;
  String get fileType;
  int? get height;
  String get path;
  int? get width;
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
          [void Function(GCreatePromptonFolderInputBuilder b) updates]) =
      _$GCreatePromptonFolderInput;

  String get description;
  bool get isPublic;
  String get name;
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
          [void Function(GCreatePromptonFolderKeyInputBuilder b) updates]) =
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

abstract class GCreatePromptonInquiryInput
    implements
        Built<GCreatePromptonInquiryInput, GCreatePromptonInquiryInputBuilder> {
  GCreatePromptonInquiryInput._();

  factory GCreatePromptonInquiryInput(
          [void Function(GCreatePromptonInquiryInputBuilder b) updates]) =
      _$GCreatePromptonInquiryInput;

  String get body;
  String? get companyName;
  String get email;
  String get name;
  String? get phoneNumber;
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
          [void Function(GCreatePromptonPaymentMethodInputBuilder b) updates]) =
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
          [void Function(GCreatePromptonPlanInputBuilder b) updates]) =
      _$GCreatePromptonPlanInput;

  String get category;
  String get description;
  bool get featureCommercialUse;
  bool get featureCopyrightFree;
  bool get featureFanFiction;
  bool get featurePrivate;
  String? get imageFileId;
  int get maximumQuantity;
  String get message;
  int get minimumQuantity;
  String get name;
  BuiltList<String> get objectSlugs;
  BuiltList<String> get styleSlugs;
  int get unitPrice;
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
          [void Function(GCreatePromptonPlanRequestInputBuilder b) updates]) =
      _$GCreatePromptonPlanRequestInput;

  BuiltList<String> get fileIds;
  String get note;
  String get planId;
  int get quantity;
  String get recipientId;
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

abstract class GCreatePromptonProfileBlockInput
    implements
        Built<GCreatePromptonProfileBlockInput,
            GCreatePromptonProfileBlockInputBuilder> {
  GCreatePromptonProfileBlockInput._();

  factory GCreatePromptonProfileBlockInput(
          [void Function(GCreatePromptonProfileBlockInputBuilder b) updates]) =
      _$GCreatePromptonProfileBlockInput;

  String? get description;
  String? get siteURL;
  String? get title;
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

abstract class GCreatePromptonPromptInput
    implements
        Built<GCreatePromptonPromptInput, GCreatePromptonPromptInputBuilder> {
  GCreatePromptonPromptInput._();

  factory GCreatePromptonPromptInput(
          [void Function(GCreatePromptonPromptInputBuilder b) updates]) =
      _$GCreatePromptonPromptInput;

  String? get description;
  bool get isBase;
  bool get isNsfw;
  bool get isSingle;
  String? get name;
  String get text;
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
          [void Function(GCreatePromptonPromptWorkInputBuilder b) updates]) =
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

abstract class GCreatePromptonUserFromTokenInput
    implements
        Built<GCreatePromptonUserFromTokenInput,
            GCreatePromptonUserFromTokenInputBuilder> {
  GCreatePromptonUserFromTokenInput._();

  factory GCreatePromptonUserFromTokenInput(
          [void Function(GCreatePromptonUserFromTokenInputBuilder b) updates]) =
      _$GCreatePromptonUserFromTokenInput;

  String get token;
  static Serializer<GCreatePromptonUserFromTokenInput> get serializer =>
      _$gCreatePromptonUserFromTokenInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePromptonUserFromTokenInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreatePromptonUserFromTokenInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePromptonUserFromTokenInput.serializer,
        json,
      );
}

abstract class GCreatePromptonUserInput
    implements
        Built<GCreatePromptonUserInput, GCreatePromptonUserInputBuilder> {
  GCreatePromptonUserInput._();

  factory GCreatePromptonUserInput(
          [void Function(GCreatePromptonUserInputBuilder b) updates]) =
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

abstract class GCreatePromptonWorkInput
    implements
        Built<GCreatePromptonWorkInput, GCreatePromptonWorkInputBuilder> {
  GCreatePromptonWorkInput._();

  factory GCreatePromptonWorkInput(
          [void Function(GCreatePromptonWorkInputBuilder b) updates]) =
      _$GCreatePromptonWorkInput;

  String get fileId;
  String get fileName;
  String get fileType;
  String? get folderId;
  String? get tagNameJA;
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
          [void Function(GCreatePromptonWorkLikeInputBuilder b) updates]) =
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

abstract class GCreateRecommendedWorkInput
    implements
        Built<GCreateRecommendedWorkInput, GCreateRecommendedWorkInputBuilder> {
  GCreateRecommendedWorkInput._();

  factory GCreateRecommendedWorkInput(
          [void Function(GCreateRecommendedWorkInputBuilder b) updates]) =
      _$GCreateRecommendedWorkInput;

  String get workId;
  static Serializer<GCreateRecommendedWorkInput> get serializer =>
      _$gCreateRecommendedWorkInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateRecommendedWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateRecommendedWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateRecommendedWorkInput.serializer,
        json,
      );
}

abstract class GCreateReservedImageGenerationTaskInput
    implements
        Built<GCreateReservedImageGenerationTaskInput,
            GCreateReservedImageGenerationTaskInputBuilder> {
  GCreateReservedImageGenerationTaskInput._();

  factory GCreateReservedImageGenerationTaskInput(
      [void Function(GCreateReservedImageGenerationTaskInputBuilder b)
          updates]) = _$GCreateReservedImageGenerationTaskInput;

  int? get clipSkip;
  String? get controlNetControlMode;
  bool? get controlNetEnabled;
  double? get controlNetGuidance;
  double? get controlNetGuidanceEnd;
  double? get controlNetGuidanceStart;
  String? get controlNetHrOption;
  String? get controlNetImageUrl;
  String? get controlNetMaskImageUrl;
  String? get controlNetModel;
  String? get controlNetModule;
  bool? get controlNetPixelPerfect;
  int? get controlNetProcessorRes;
  String? get controlNetResizeMode;
  bool? get controlNetSaveDetectedMap;
  int? get controlNetThresholdA;
  int? get controlNetThresholdB;
  double? get controlNetWeight;
  int get count;
  String get model;
  String get negativePrompt;
  String get prompt;
  String get sampler;
  int get scale;
  double get seed;
  GImageGenerationSizeType get sizeType;
  int get steps;
  String? get t2tDenoisingStrengthSize;
  String? get t2tImageUrl;
  String? get t2tInpaintingFillSize;
  String? get t2tMaskImageUrl;
  GImageGenerationType get type;
  double? get upscaleSize;
  String get vae;
  static Serializer<GCreateReservedImageGenerationTaskInput> get serializer =>
      _$gCreateReservedImageGenerationTaskInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateReservedImageGenerationTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateReservedImageGenerationTaskInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateReservedImageGenerationTaskInput.serializer,
        json,
      );
}

abstract class GCreateResponseCommentInput
    implements
        Built<GCreateResponseCommentInput, GCreateResponseCommentInputBuilder> {
  GCreateResponseCommentInput._();

  factory GCreateResponseCommentInput(
          [void Function(GCreateResponseCommentInputBuilder b) updates]) =
      _$GCreateResponseCommentInput;

  String get commentId;
  String? get stickerId;
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
          [void Function(GCreateStickerInputBuilder b) updates]) =
      _$GCreateStickerInput;

  GAccessType get accessType;
  BuiltList<String>? get categories;
  GStickerGenre? get genre;
  String get imageUrl;
  String? get title;
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

abstract class GCreateUserProfileInput
    implements Built<GCreateUserProfileInput, GCreateUserProfileInputBuilder> {
  GCreateUserProfileInput._();

  factory GCreateUserProfileInput(
          [void Function(GCreateUserProfileInputBuilder b) updates]) =
      _$GCreateUserProfileInput;

  String? get biography;
  String? get displayName;
  String? get enBiography;
  String? get githubAccountId;
  String? get headerImageUrl;
  String? get homeUrl;
  String? get iconUrl;
  String? get instagramAccountId;
  String? get mailAddress;
  String? get twitterAccountId;
  static Serializer<GCreateUserProfileInput> get serializer =>
      _$gCreateUserProfileInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserProfileInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserProfileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserProfileInput.serializer,
        json,
      );
}

abstract class GCreateUserStickerInput
    implements Built<GCreateUserStickerInput, GCreateUserStickerInputBuilder> {
  GCreateUserStickerInput._();

  factory GCreateUserStickerInput(
          [void Function(GCreateUserStickerInputBuilder b) updates]) =
      _$GCreateUserStickerInput;

  String get stickerId;
  static Serializer<GCreateUserStickerInput> get serializer =>
      _$gCreateUserStickerInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserStickerInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserStickerInput.serializer,
        json,
      );
}

abstract class GCreateWorkCommentInput
    implements Built<GCreateWorkCommentInput, GCreateWorkCommentInputBuilder> {
  GCreateWorkCommentInput._();

  factory GCreateWorkCommentInput(
          [void Function(GCreateWorkCommentInputBuilder b) updates]) =
      _$GCreateWorkCommentInput;

  String? get stickerId;
  String get text;
  String get workId;
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

  factory GCreateWorkInput([void Function(GCreateWorkInputBuilder b) updates]) =
      _$GCreateWorkInput;

  GGenerationAccessType get accessGenerationType;
  GAccessType get accessType;
  String? get albumId;
  String? get enExplanation;
  String? get entitle;
  String? get explanation;
  int get imageHeight;
  GImageStyle get imageStyle;
  BuiltList<String> get imageUrls;
  int get imageWidth;
  bool get isCommentEditable;
  bool get isPromotion;
  bool get isTagEditable;
  int get largeThumbnailImageHeight;
  String get largeThumbnailImageURL;
  int get largeThumbnailImageWidth;
  String get mainImageSha256;
  String? get md;
  String? get modelHash;
  String? get modelId;
  String? get modelName;
  String? get negativePrompt;
  String? get noise;
  String? get ogpImageUrl;
  String? get otherGenerationParams;
  String? get pngInfo;
  String? get prompt;
  GRating get rating;
  String? get relatedUrl;
  double? get reservedAt;
  String? get sampler;
  String? get seed;
  int get smallThumbnailImageHeight;
  String get smallThumbnailImageURL;
  int get smallThumbnailImageWidth;
  String? get steps;
  String? get strength;
  String? get subjectId;
  BuiltList<String>? get tags;
  double? get thumbnailPosition;
  String get title;
  GWorkType get type;
  String? get videoUrl;
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
          [void Function(GCreateWorkLikeInputBuilder b) updates]) =
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
          [void Function(GDailyThemesWhereInputBuilder b) updates]) =
      _$GDailyThemesWhereInput;

  int? get day;
  String? get endDate;
  int? get month;
  String? get search;
  String? get startDate;
  int? get year;
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

abstract class GDecrementPromptonProfileBlockIndexInput
    implements
        Built<GDecrementPromptonProfileBlockIndexInput,
            GDecrementPromptonProfileBlockIndexInputBuilder> {
  GDecrementPromptonProfileBlockIndexInput._();

  factory GDecrementPromptonProfileBlockIndexInput(
      [void Function(GDecrementPromptonProfileBlockIndexInputBuilder b)
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

abstract class GDeleteAlbumInput
    implements Built<GDeleteAlbumInput, GDeleteAlbumInputBuilder> {
  GDeleteAlbumInput._();

  factory GDeleteAlbumInput(
          [void Function(GDeleteAlbumInputBuilder b) updates]) =
      _$GDeleteAlbumInput;

  String get albumId;
  static Serializer<GDeleteAlbumInput> get serializer =>
      _$gDeleteAlbumInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteAlbumInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteAlbumInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteAlbumInput.serializer,
        json,
      );
}

abstract class GDeleteAlbumWorkInput
    implements Built<GDeleteAlbumWorkInput, GDeleteAlbumWorkInputBuilder> {
  GDeleteAlbumWorkInput._();

  factory GDeleteAlbumWorkInput(
          [void Function(GDeleteAlbumWorkInputBuilder b) updates]) =
      _$GDeleteAlbumWorkInput;

  String get albumId;
  String get workId;
  static Serializer<GDeleteAlbumWorkInput> get serializer =>
      _$gDeleteAlbumWorkInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteAlbumWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteAlbumWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteAlbumWorkInput.serializer,
        json,
      );
}

abstract class GDeleteCommentInput
    implements Built<GDeleteCommentInput, GDeleteCommentInputBuilder> {
  GDeleteCommentInput._();

  factory GDeleteCommentInput(
          [void Function(GDeleteCommentInputBuilder b) updates]) =
      _$GDeleteCommentInput;

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

  factory GDeleteFolderInput(
          [void Function(GDeleteFolderInputBuilder b) updates]) =
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

abstract class GDeleteFolderWorkInput
    implements Built<GDeleteFolderWorkInput, GDeleteFolderWorkInputBuilder> {
  GDeleteFolderWorkInput._();

  factory GDeleteFolderWorkInput(
          [void Function(GDeleteFolderWorkInputBuilder b) updates]) =
      _$GDeleteFolderWorkInput;

  String get folderId;
  String get workId;
  static Serializer<GDeleteFolderWorkInput> get serializer =>
      _$gDeleteFolderWorkInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteFolderWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteFolderWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteFolderWorkInput.serializer,
        json,
      );
}

abstract class GDeleteImageGenerationMemoInput
    implements
        Built<GDeleteImageGenerationMemoInput,
            GDeleteImageGenerationMemoInputBuilder> {
  GDeleteImageGenerationMemoInput._();

  factory GDeleteImageGenerationMemoInput(
          [void Function(GDeleteImageGenerationMemoInputBuilder b) updates]) =
      _$GDeleteImageGenerationMemoInput;

  String get nanoid;
  static Serializer<GDeleteImageGenerationMemoInput> get serializer =>
      _$gDeleteImageGenerationMemoInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteImageGenerationMemoInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteImageGenerationMemoInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteImageGenerationMemoInput.serializer,
        json,
      );
}

abstract class GDeleteImageGenerationResultInput
    implements
        Built<GDeleteImageGenerationResultInput,
            GDeleteImageGenerationResultInputBuilder> {
  GDeleteImageGenerationResultInput._();

  factory GDeleteImageGenerationResultInput(
          [void Function(GDeleteImageGenerationResultInputBuilder b) updates]) =
      _$GDeleteImageGenerationResultInput;

  String get nanoid;
  static Serializer<GDeleteImageGenerationResultInput> get serializer =>
      _$gDeleteImageGenerationResultInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteImageGenerationResultInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteImageGenerationResultInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteImageGenerationResultInput.serializer,
        json,
      );
}

abstract class GDeleteMessageInput
    implements Built<GDeleteMessageInput, GDeleteMessageInputBuilder> {
  GDeleteMessageInput._();

  factory GDeleteMessageInput(
          [void Function(GDeleteMessageInputBuilder b) updates]) =
      _$GDeleteMessageInput;

  String get messageId;
  static Serializer<GDeleteMessageInput> get serializer =>
      _$gDeleteMessageInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteMessageInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteMessageInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteMessageInput.serializer,
        json,
      );
}

abstract class GDeleteNoteInput
    implements Built<GDeleteNoteInput, GDeleteNoteInputBuilder> {
  GDeleteNoteInput._();

  factory GDeleteNoteInput([void Function(GDeleteNoteInputBuilder b) updates]) =
      _$GDeleteNoteInput;

  String get noteId;
  static Serializer<GDeleteNoteInput> get serializer =>
      _$gDeleteNoteInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteNoteInput.serializer,
        json,
      );
}

abstract class GDeleteNovelInput
    implements Built<GDeleteNovelInput, GDeleteNovelInputBuilder> {
  GDeleteNovelInput._();

  factory GDeleteNovelInput(
          [void Function(GDeleteNovelInputBuilder b) updates]) =
      _$GDeleteNovelInput;

  String get novelId;
  static Serializer<GDeleteNovelInput> get serializer =>
      _$gDeleteNovelInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteNovelInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteNovelInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteNovelInput.serializer,
        json,
      );
}

abstract class GDeletePromptonFolderInput
    implements
        Built<GDeletePromptonFolderInput, GDeletePromptonFolderInputBuilder> {
  GDeletePromptonFolderInput._();

  factory GDeletePromptonFolderInput(
          [void Function(GDeletePromptonFolderInputBuilder b) updates]) =
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
          [void Function(GDeletePromptonIntegrationInputBuilder b) updates]) =
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
          [void Function(GDeletePromptonPlanInputBuilder b) updates]) =
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
          [void Function(GDeletePromptonProfileBlockInputBuilder b) updates]) =
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

abstract class GDeletePromptonPromptInput
    implements
        Built<GDeletePromptonPromptInput, GDeletePromptonPromptInputBuilder> {
  GDeletePromptonPromptInput._();

  factory GDeletePromptonPromptInput(
          [void Function(GDeletePromptonPromptInputBuilder b) updates]) =
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

abstract class GDeletePromptonWorkInput
    implements
        Built<GDeletePromptonWorkInput, GDeletePromptonWorkInputBuilder> {
  GDeletePromptonWorkInput._();

  factory GDeletePromptonWorkInput(
          [void Function(GDeletePromptonWorkInputBuilder b) updates]) =
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
          [void Function(GDeletePromptonWorkLikeInputBuilder b) updates]) =
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

abstract class GDeleteRecommendedWorkInput
    implements
        Built<GDeleteRecommendedWorkInput, GDeleteRecommendedWorkInputBuilder> {
  GDeleteRecommendedWorkInput._();

  factory GDeleteRecommendedWorkInput(
          [void Function(GDeleteRecommendedWorkInputBuilder b) updates]) =
      _$GDeleteRecommendedWorkInput;

  String get workId;
  static Serializer<GDeleteRecommendedWorkInput> get serializer =>
      _$gDeleteRecommendedWorkInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteRecommendedWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteRecommendedWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteRecommendedWorkInput.serializer,
        json,
      );
}

abstract class GDeleteStickerInput
    implements Built<GDeleteStickerInput, GDeleteStickerInputBuilder> {
  GDeleteStickerInput._();

  factory GDeleteStickerInput(
          [void Function(GDeleteStickerInputBuilder b) updates]) =
      _$GDeleteStickerInput;

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

abstract class GDeleteUserStickerInput
    implements Built<GDeleteUserStickerInput, GDeleteUserStickerInputBuilder> {
  GDeleteUserStickerInput._();

  factory GDeleteUserStickerInput(
          [void Function(GDeleteUserStickerInputBuilder b) updates]) =
      _$GDeleteUserStickerInput;

  String get stickerId;
  static Serializer<GDeleteUserStickerInput> get serializer =>
      _$gDeleteUserStickerInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteUserStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteUserStickerInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteUserStickerInput.serializer,
        json,
      );
}

abstract class GDeleteWorkInput
    implements Built<GDeleteWorkInput, GDeleteWorkInputBuilder> {
  GDeleteWorkInput._();

  factory GDeleteWorkInput([void Function(GDeleteWorkInputBuilder b) updates]) =
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
          [void Function(GDeleteWorkLikeInputBuilder b) updates]) =
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

class GDirection extends EnumClass {
  const GDirection._(String name) : super(name);

  static const GDirection ASC = _$gDirectionASC;

  static const GDirection DESC = _$gDirectionDESC;

  static Serializer<GDirection> get serializer => _$gDirectionSerializer;

  static BuiltSet<GDirection> get values => _$gDirectionValues;

  static GDirection valueOf(String name) => _$gDirectionValueOf(name);
}

abstract class GEnablePromptonRequestChatInput
    implements
        Built<GEnablePromptonRequestChatInput,
            GEnablePromptonRequestChatInputBuilder> {
  GEnablePromptonRequestChatInput._();

  factory GEnablePromptonRequestChatInput(
          [void Function(GEnablePromptonRequestChatInputBuilder b) updates]) =
      _$GEnablePromptonRequestChatInput;

  String get requestId;
  static Serializer<GEnablePromptonRequestChatInput> get serializer =>
      _$gEnablePromptonRequestChatInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnablePromptonRequestChatInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GEnablePromptonRequestChatInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnablePromptonRequestChatInput.serializer,
        json,
      );
}

abstract class GFeaturePromptonRequestWhereInput
    implements
        Built<GFeaturePromptonRequestWhereInput,
            GFeaturePromptonRequestWhereInputBuilder> {
  GFeaturePromptonRequestWhereInput._();

  factory GFeaturePromptonRequestWhereInput(
          [void Function(GFeaturePromptonRequestWhereInputBuilder b) updates]) =
      _$GFeaturePromptonRequestWhereInput;

  String get userId;
  static Serializer<GFeaturePromptonRequestWhereInput> get serializer =>
      _$gFeaturePromptonRequestWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeaturePromptonRequestWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeaturePromptonRequestWhereInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeaturePromptonRequestWhereInput.serializer,
        json,
      );
}

abstract class GFeedPostsWhereInput
    implements Built<GFeedPostsWhereInput, GFeedPostsWhereInputBuilder> {
  GFeedPostsWhereInput._();

  factory GFeedPostsWhereInput(
          [void Function(GFeedPostsWhereInputBuilder b) updates]) =
      _$GFeedPostsWhereInput;

  String? get afterDate;
  BuiltList<GRating>? get ratings;
  static Serializer<GFeedPostsWhereInput> get serializer =>
      _$gFeedPostsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedPostsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedPostsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedPostsWhereInput.serializer,
        json,
      );
}

abstract class GFlipPromptonFolderWorkIndexInput
    implements
        Built<GFlipPromptonFolderWorkIndexInput,
            GFlipPromptonFolderWorkIndexInputBuilder> {
  GFlipPromptonFolderWorkIndexInput._();

  factory GFlipPromptonFolderWorkIndexInput(
          [void Function(GFlipPromptonFolderWorkIndexInputBuilder b) updates]) =
      _$GFlipPromptonFolderWorkIndexInput;

  String get folderId;
  String get nextWorkId;
  String get workId;
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

  static const GFolderMode COMIC_HORIZONTAL = _$gFolderModeCOMIC_HORIZONTAL;

  static const GFolderMode COMIC_VERTICAL = _$gFolderModeCOMIC_VERTICAL;

  static const GFolderMode NORMAL = _$gFolderModeNORMAL;

  static Serializer<GFolderMode> get serializer => _$gFolderModeSerializer;

  static BuiltSet<GFolderMode> get values => _$gFolderModeValues;

  static GFolderMode valueOf(String name) => _$gFolderModeValueOf(name);
}

abstract class GFoldersWhereInput
    implements Built<GFoldersWhereInput, GFoldersWhereInputBuilder> {
  GFoldersWhereInput._();

  factory GFoldersWhereInput(
          [void Function(GFoldersWhereInputBuilder b) updates]) =
      _$GFoldersWhereInput;

  bool? get isPrivate;
  bool? get isSensitive;
  String? get search;
  BuiltList<String>? get tags;
  GFolderType? get type;
  String? get userId;
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

class GFolderType extends EnumClass {
  const GFolderType._(String name) : super(name);

  static const GFolderType BOOKMARK = _$gFolderTypeBOOKMARK;

  static const GFolderType PRIVATE = _$gFolderTypePRIVATE;

  static const GFolderType PUBLIC = _$gFolderTypePUBLIC;

  static const GFolderType RECOMMENDED = _$gFolderTypeRECOMMENDED;

  static Serializer<GFolderType> get serializer => _$gFolderTypeSerializer;

  static BuiltSet<GFolderType> get values => _$gFolderTypeValues;

  static GFolderType valueOf(String name) => _$gFolderTypeValueOf(name);
}

abstract class GFolderWhereInput
    implements Built<GFolderWhereInput, GFolderWhereInputBuilder> {
  GFolderWhereInput._();

  factory GFolderWhereInput(
          [void Function(GFolderWhereInputBuilder b) updates]) =
      _$GFolderWhereInput;

  String get nanoid;
  static Serializer<GFolderWhereInput> get serializer =>
      _$gFolderWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFolderWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFolderWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFolderWhereInput.serializer,
        json,
      );
}

abstract class GFollowersWhereInput
    implements Built<GFollowersWhereInput, GFollowersWhereInputBuilder> {
  GFollowersWhereInput._();

  factory GFollowersWhereInput(
          [void Function(GFollowersWhereInputBuilder b) updates]) =
      _$GFollowersWhereInput;

  int get userId;
  static Serializer<GFollowersWhereInput> get serializer =>
      _$gFollowersWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowersWhereInput.serializer,
        json,
      );
}

abstract class GFollowingUsersWhereInput
    implements
        Built<GFollowingUsersWhereInput, GFollowingUsersWhereInputBuilder> {
  GFollowingUsersWhereInput._();

  factory GFollowingUsersWhereInput(
          [void Function(GFollowingUsersWhereInputBuilder b) updates]) =
      _$GFollowingUsersWhereInput;

  int get userId;
  static Serializer<GFollowingUsersWhereInput> get serializer =>
      _$gFollowingUsersWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowingUsersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowingUsersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowingUsersWhereInput.serializer,
        json,
      );
}

abstract class GFollowPromptonUserInput
    implements
        Built<GFollowPromptonUserInput, GFollowPromptonUserInputBuilder> {
  GFollowPromptonUserInput._();

  factory GFollowPromptonUserInput(
          [void Function(GFollowPromptonUserInputBuilder b) updates]) =
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

abstract class GFollowTagInput
    implements Built<GFollowTagInput, GFollowTagInputBuilder> {
  GFollowTagInput._();

  factory GFollowTagInput([void Function(GFollowTagInputBuilder b) updates]) =
      _$GFollowTagInput;

  String get tagName;
  static Serializer<GFollowTagInput> get serializer =>
      _$gFollowTagInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowTagInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowTagInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowTagInput.serializer,
        json,
      );
}

abstract class GFollowUserInput
    implements Built<GFollowUserInput, GFollowUserInputBuilder> {
  GFollowUserInput._();

  factory GFollowUserInput([void Function(GFollowUserInputBuilder b) updates]) =
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

class GGenerationAccessType extends EnumClass {
  const GGenerationAccessType._(String name) : super(name);

  static const GGenerationAccessType PRIVATE = _$gGenerationAccessTypePRIVATE;

  static const GGenerationAccessType PUBLIC = _$gGenerationAccessTypePUBLIC;

  static const GGenerationAccessType PUBLIC_RESTORABLE =
      _$gGenerationAccessTypePUBLIC_RESTORABLE;

  static Serializer<GGenerationAccessType> get serializer =>
      _$gGenerationAccessTypeSerializer;

  static BuiltSet<GGenerationAccessType> get values =>
      _$gGenerationAccessTypeValues;

  static GGenerationAccessType valueOf(String name) =>
      _$gGenerationAccessTypeValueOf(name);
}

abstract class GHotWorksWhereInput
    implements Built<GHotWorksWhereInput, GHotWorksWhereInputBuilder> {
  GHotWorksWhereInput._();

  factory GHotWorksWhereInput(
          [void Function(GHotWorksWhereInputBuilder b) updates]) =
      _$GHotWorksWhereInput;

  bool? get isSensitive;
  static Serializer<GHotWorksWhereInput> get serializer =>
      _$gHotWorksWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotWorksWhereInput.serializer,
        json,
      );
}

abstract class GImageGenerationMemoOrderBy
    implements
        Built<GImageGenerationMemoOrderBy, GImageGenerationMemoOrderByBuilder> {
  GImageGenerationMemoOrderBy._();

  factory GImageGenerationMemoOrderBy(
          [void Function(GImageGenerationMemoOrderByBuilder b) updates]) =
      _$GImageGenerationMemoOrderBy;

  GDirection? get createdAt;
  static Serializer<GImageGenerationMemoOrderBy> get serializer =>
      _$gImageGenerationMemoOrderBySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageGenerationMemoOrderBy.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationMemoOrderBy? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageGenerationMemoOrderBy.serializer,
        json,
      );
}

abstract class GImageGenerationResultsWhereInput
    implements
        Built<GImageGenerationResultsWhereInput,
            GImageGenerationResultsWhereInputBuilder> {
  GImageGenerationResultsWhereInput._();

  factory GImageGenerationResultsWhereInput(
          [void Function(GImageGenerationResultsWhereInputBuilder b) updates]) =
      _$GImageGenerationResultsWhereInput;

  String? get dateText;
  String? get fromDate;
  bool? get isProtected;
  int? get minRating;
  BuiltList<String>? get nanoids;
  int? get rating;
  static Serializer<GImageGenerationResultsWhereInput> get serializer =>
      _$gImageGenerationResultsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageGenerationResultsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationResultsWhereInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageGenerationResultsWhereInput.serializer,
        json,
      );
}

class GImageGenerationSizeKind extends EnumClass {
  const GImageGenerationSizeKind._(String name) : super(name);

  static const GImageGenerationSizeKind LANDSCAPE =
      _$gImageGenerationSizeKindLANDSCAPE;

  static const GImageGenerationSizeKind PORTRAIT =
      _$gImageGenerationSizeKindPORTRAIT;

  static const GImageGenerationSizeKind SQUARE =
      _$gImageGenerationSizeKindSQUARE;

  static const GImageGenerationSizeKind TALL_PORTRAIT =
      _$gImageGenerationSizeKindTALL_PORTRAIT;

  static const GImageGenerationSizeKind WIDE_LANDSCAPE =
      _$gImageGenerationSizeKindWIDE_LANDSCAPE;

  static Serializer<GImageGenerationSizeKind> get serializer =>
      _$gImageGenerationSizeKindSerializer;

  static BuiltSet<GImageGenerationSizeKind> get values =>
      _$gImageGenerationSizeKindValues;

  static GImageGenerationSizeKind valueOf(String name) =>
      _$gImageGenerationSizeKindValueOf(name);
}

class GImageGenerationSizeType extends EnumClass {
  const GImageGenerationSizeType._(String name) : super(name);

  static const GImageGenerationSizeType SD1_384_960 =
      _$gImageGenerationSizeTypeSD1_384_960;

  static const GImageGenerationSizeType SD1_512_512 =
      _$gImageGenerationSizeTypeSD1_512_512;

  static const GImageGenerationSizeType SD1_512_768 =
      _$gImageGenerationSizeTypeSD1_512_768;

  static const GImageGenerationSizeType SD1_768_512 =
      _$gImageGenerationSizeTypeSD1_768_512;

  static const GImageGenerationSizeType SD1_960_384 =
      _$gImageGenerationSizeTypeSD1_960_384;

  static const GImageGenerationSizeType SD2_576_1440 =
      _$gImageGenerationSizeTypeSD2_576_1440;

  static const GImageGenerationSizeType SD2_768_768 =
      _$gImageGenerationSizeTypeSD2_768_768;

  static const GImageGenerationSizeType SD2_768_1152 =
      _$gImageGenerationSizeTypeSD2_768_1152;

  static const GImageGenerationSizeType SD2_768_1200 =
      _$gImageGenerationSizeTypeSD2_768_1200;

  static const GImageGenerationSizeType SD2_1152_768 =
      _$gImageGenerationSizeTypeSD2_1152_768;

  static const GImageGenerationSizeType SD2_1200_768 =
      _$gImageGenerationSizeTypeSD2_1200_768;

  static const GImageGenerationSizeType SD2_1440_576 =
      _$gImageGenerationSizeTypeSD2_1440_576;

  static const GImageGenerationSizeType SD3_640_1536 =
      _$gImageGenerationSizeTypeSD3_640_1536;

  static const GImageGenerationSizeType SD3_832_1216 =
      _$gImageGenerationSizeTypeSD3_832_1216;

  static const GImageGenerationSizeType SD3_896_896 =
      _$gImageGenerationSizeTypeSD3_896_896;

  static const GImageGenerationSizeType SD3_896_1152 =
      _$gImageGenerationSizeTypeSD3_896_1152;

  static const GImageGenerationSizeType SD3_960_384 =
      _$gImageGenerationSizeTypeSD3_960_384;

  static const GImageGenerationSizeType SD3_1024_1024 =
      _$gImageGenerationSizeTypeSD3_1024_1024;

  static const GImageGenerationSizeType SD3_1152_896 =
      _$gImageGenerationSizeTypeSD3_1152_896;

  static const GImageGenerationSizeType SD3_1152_1152 =
      _$gImageGenerationSizeTypeSD3_1152_1152;

  static const GImageGenerationSizeType SD3_1216_832 =
      _$gImageGenerationSizeTypeSD3_1216_832;

  static const GImageGenerationSizeType SD3_1216_1216 =
      _$gImageGenerationSizeTypeSD3_1216_1216;

  static const GImageGenerationSizeType SD3_1536_640 =
      _$gImageGenerationSizeTypeSD3_1536_640;

  static Serializer<GImageGenerationSizeType> get serializer =>
      _$gImageGenerationSizeTypeSerializer;

  static BuiltSet<GImageGenerationSizeType> get values =>
      _$gImageGenerationSizeTypeValues;

  static GImageGenerationSizeType valueOf(String name) =>
      _$gImageGenerationSizeTypeValueOf(name);
}

class GImageGenerationStatus extends EnumClass {
  const GImageGenerationStatus._(String name) : super(name);

  static const GImageGenerationStatus CANCELED =
      _$gImageGenerationStatusCANCELED;

  static const GImageGenerationStatus DONE = _$gImageGenerationStatusDONE;

  static const GImageGenerationStatus ERROR = _$gImageGenerationStatusERROR;

  static const GImageGenerationStatus IN_PROGRESS =
      _$gImageGenerationStatusIN_PROGRESS;

  static const GImageGenerationStatus PENDING = _$gImageGenerationStatusPENDING;

  static const GImageGenerationStatus RESERVED =
      _$gImageGenerationStatusRESERVED;

  static Serializer<GImageGenerationStatus> get serializer =>
      _$gImageGenerationStatusSerializer;

  static BuiltSet<GImageGenerationStatus> get values =>
      _$gImageGenerationStatusValues;

  static GImageGenerationStatus valueOf(String name) =>
      _$gImageGenerationStatusValueOf(name);
}

abstract class GImageGenerationTasksWhereInput
    implements
        Built<GImageGenerationTasksWhereInput,
            GImageGenerationTasksWhereInputBuilder> {
  GImageGenerationTasksWhereInput._();

  factory GImageGenerationTasksWhereInput(
          [void Function(GImageGenerationTasksWhereInputBuilder b) updates]) =
      _$GImageGenerationTasksWhereInput;

  String? get dateText;
  String? get fromDate;
  bool? get isProtected;
  int? get minRating;
  int? get rating;
  BuiltList<String>? get uuids;
  static Serializer<GImageGenerationTasksWhereInput> get serializer =>
      _$gImageGenerationTasksWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageGenerationTasksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationTasksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageGenerationTasksWhereInput.serializer,
        json,
      );
}

class GImageGenerationType extends EnumClass {
  const GImageGenerationType._(String name) : super(name);

  static const GImageGenerationType IMAGE_TO_IMAGE =
      _$gImageGenerationTypeIMAGE_TO_IMAGE;

  static const GImageGenerationType INPAINTING =
      _$gImageGenerationTypeINPAINTING;

  static const GImageGenerationType TEXT_TO_IMAGE =
      _$gImageGenerationTypeTEXT_TO_IMAGE;

  static Serializer<GImageGenerationType> get serializer =>
      _$gImageGenerationTypeSerializer;

  static BuiltSet<GImageGenerationType> get values =>
      _$gImageGenerationTypeValues;

  static GImageGenerationType valueOf(String name) =>
      _$gImageGenerationTypeValueOf(name);
}

class GImageModelCategory extends EnumClass {
  const GImageModelCategory._(String name) : super(name);

  static const GImageModelCategory ANIMAL = _$gImageModelCategoryANIMAL;

  static const GImageModelCategory ANIME_GIRL = _$gImageModelCategoryANIME_GIRL;

  static const GImageModelCategory BACKGROUND = _$gImageModelCategoryBACKGROUND;

  static const GImageModelCategory BIKINI_MODEL =
      _$gImageModelCategoryBIKINI_MODEL;

  static const GImageModelCategory FIGURE = _$gImageModelCategoryFIGURE;

  static const GImageModelCategory ILLUSTRATION_BOY =
      _$gImageModelCategoryILLUSTRATION_BOY;

  static const GImageModelCategory ILLUSTRATION_GIRL =
      _$gImageModelCategoryILLUSTRATION_GIRL;

  static Serializer<GImageModelCategory> get serializer =>
      _$gImageModelCategorySerializer;

  static BuiltSet<GImageModelCategory> get values =>
      _$gImageModelCategoryValues;

  static GImageModelCategory valueOf(String name) =>
      _$gImageModelCategoryValueOf(name);
}

abstract class GImageModelWhereInput
    implements Built<GImageModelWhereInput, GImageModelWhereInputBuilder> {
  GImageModelWhereInput._();

  factory GImageModelWhereInput(
          [void Function(GImageModelWhereInputBuilder b) updates]) =
      _$GImageModelWhereInput;

  BuiltList<String>? get id;
  String? get name;
  static Serializer<GImageModelWhereInput> get serializer =>
      _$gImageModelWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageModelWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageModelWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageModelWhereInput.serializer,
        json,
      );
}

class GImageStyle extends EnumClass {
  const GImageStyle._(String name) : super(name);

  static const GImageStyle ILLUSTRATION = _$gImageStyleILLUSTRATION;

  static const GImageStyle REAL = _$gImageStyleREAL;

  static const GImageStyle SEMI_REAL = _$gImageStyleSEMI_REAL;

  static Serializer<GImageStyle> get serializer => _$gImageStyleSerializer;

  static BuiltSet<GImageStyle> get values => _$gImageStyleValues;

  static GImageStyle valueOf(String name) => _$gImageStyleValueOf(name);
}

abstract class GIncrementPromptonProfileBlockIndexInput
    implements
        Built<GIncrementPromptonProfileBlockIndexInput,
            GIncrementPromptonProfileBlockIndexInputBuilder> {
  GIncrementPromptonProfileBlockIndexInput._();

  factory GIncrementPromptonProfileBlockIndexInput(
      [void Function(GIncrementPromptonProfileBlockIndexInputBuilder b)
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

abstract class GLoginWithPasswordInput
    implements Built<GLoginWithPasswordInput, GLoginWithPasswordInputBuilder> {
  GLoginWithPasswordInput._();

  factory GLoginWithPasswordInput(
          [void Function(GLoginWithPasswordInputBuilder b) updates]) =
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

abstract class GLoginWithWordPressTokenInput
    implements
        Built<GLoginWithWordPressTokenInput,
            GLoginWithWordPressTokenInputBuilder> {
  GLoginWithWordPressTokenInput._();

  factory GLoginWithWordPressTokenInput(
          [void Function(GLoginWithWordPressTokenInputBuilder b) updates]) =
      _$GLoginWithWordPressTokenInput;

  String get token;
  static Serializer<GLoginWithWordPressTokenInput> get serializer =>
      _$gLoginWithWordPressTokenInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLoginWithWordPressTokenInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLoginWithWordPressTokenInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLoginWithWordPressTokenInput.serializer,
        json,
      );
}

abstract class GMarkPromptonFolderAsPrivateInput
    implements
        Built<GMarkPromptonFolderAsPrivateInput,
            GMarkPromptonFolderAsPrivateInputBuilder> {
  GMarkPromptonFolderAsPrivateInput._();

  factory GMarkPromptonFolderAsPrivateInput(
          [void Function(GMarkPromptonFolderAsPrivateInputBuilder b) updates]) =
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
          [void Function(GMarkPromptonFolderAsPublicInputBuilder b) updates]) =
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
          [void Function(GMarkPromptonPlanAsPrivateInputBuilder b) updates]) =
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
          [void Function(GMarkPromptonPlanAsPublicInputBuilder b) updates]) =
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
          [void Function(GMarkPromptonWorkAsPrivateInputBuilder b) updates]) =
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
          [void Function(GMarkPromptonWorkAsPublicInputBuilder b) updates]) =
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
      [void Function(GMarkPromptonWorkAsUserHeaderInputBuilder b)
          updates]) = _$GMarkPromptonWorkAsUserHeaderInput;

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

abstract class GMilestonesWhereInput
    implements Built<GMilestonesWhereInput, GMilestonesWhereInputBuilder> {
  GMilestonesWhereInput._();

  factory GMilestonesWhereInput(
          [void Function(GMilestonesWhereInputBuilder b) updates]) =
      _$GMilestonesWhereInput;

  String get repository;
  static Serializer<GMilestonesWhereInput> get serializer =>
      _$gMilestonesWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMilestonesWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMilestonesWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMilestonesWhereInput.serializer,
        json,
      );
}

abstract class GMuteTagInput
    implements Built<GMuteTagInput, GMuteTagInputBuilder> {
  GMuteTagInput._();

  factory GMuteTagInput([void Function(GMuteTagInputBuilder b) updates]) =
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

  factory GMuteUserInput([void Function(GMuteUserInputBuilder b) updates]) =
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

abstract class GNewCommentsWhereInput
    implements Built<GNewCommentsWhereInput, GNewCommentsWhereInputBuilder> {
  GNewCommentsWhereInput._();

  factory GNewCommentsWhereInput(
          [void Function(GNewCommentsWhereInputBuilder b) updates]) =
      _$GNewCommentsWhereInput;

  bool? get isSensitive;
  BuiltList<GRating>? get ratings;
  static Serializer<GNewCommentsWhereInput> get serializer =>
      _$gNewCommentsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNewCommentsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GNewCommentsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNewCommentsWhereInput.serializer,
        json,
      );
}

abstract class GNewUsersWorksWhereInput
    implements
        Built<GNewUsersWorksWhereInput, GNewUsersWorksWhereInputBuilder> {
  GNewUsersWorksWhereInput._();

  factory GNewUsersWorksWhereInput(
          [void Function(GNewUsersWorksWhereInputBuilder b) updates]) =
      _$GNewUsersWorksWhereInput;

  bool? get isFollowing;
  bool? get isNotFollowing;
  bool? get isNowCreatedAt;
  bool? get isSensitive;
  BuiltList<GRating>? get ratings;
  GSort? get sort;
  GImageStyle? get style;
  static Serializer<GNewUsersWorksWhereInput> get serializer =>
      _$gNewUsersWorksWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNewUsersWorksWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GNewUsersWorksWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNewUsersWorksWhereInput.serializer,
        json,
      );
}

abstract class GNotificationsWhereInput
    implements
        Built<GNotificationsWhereInput, GNotificationsWhereInputBuilder> {
  GNotificationsWhereInput._();

  factory GNotificationsWhereInput(
          [void Function(GNotificationsWhereInputBuilder b) updates]) =
      _$GNotificationsWhereInput;

  bool? get isUnsentReply;
  GNotificationType? get type;
  static Serializer<GNotificationsWhereInput> get serializer =>
      _$gNotificationsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNotificationsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GNotificationsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNotificationsWhereInput.serializer,
        json,
      );
}

class GNotificationType extends EnumClass {
  const GNotificationType._(String name) : super(name);

  static const GNotificationType COMMENT_REPLY =
      _$gNotificationTypeCOMMENT_REPLY;

  static const GNotificationType FOLLOW = _$gNotificationTypeFOLLOW;

  static const GNotificationType LIKED_WORK = _$gNotificationTypeLIKED_WORK;

  static const GNotificationType LIKED_WORKS_SUMMARY =
      _$gNotificationTypeLIKED_WORKS_SUMMARY;

  static const GNotificationType WORK_AWARD = _$gNotificationTypeWORK_AWARD;

  static const GNotificationType WORK_COMMENT = _$gNotificationTypeWORK_COMMENT;

  static Serializer<GNotificationType> get serializer =>
      _$gNotificationTypeSerializer;

  static BuiltSet<GNotificationType> get values => _$gNotificationTypeValues;

  static GNotificationType valueOf(String name) =>
      _$gNotificationTypeValueOf(name);
}

class GPassType extends EnumClass {
  const GPassType._(String name) : super(name);

  static const GPassType LITE = _$gPassTypeLITE;

  static const GPassType PREMIUM = _$gPassTypePREMIUM;

  static const GPassType STANDARD = _$gPassTypeSTANDARD;

  static const GPassType TWO_DAYS = _$gPassTypeTWO_DAYS;

  static Serializer<GPassType> get serializer => _$gPassTypeSerializer;

  static BuiltSet<GPassType> get values => _$gPassTypeValues;

  static GPassType valueOf(String name) => _$gPassTypeValueOf(name);
}

class GPaymentType extends EnumClass {
  const GPaymentType._(String name) : super(name);

  static const GPaymentType PASS_LITE = _$gPaymentTypePASS_LITE;

  static const GPaymentType PASS_PREMIUM = _$gPaymentTypePASS_PREMIUM;

  static const GPaymentType PASS_STANDARD = _$gPaymentTypePASS_STANDARD;

  static Serializer<GPaymentType> get serializer => _$gPaymentTypeSerializer;

  static BuiltSet<GPaymentType> get values => _$gPaymentTypeValues;

  static GPaymentType valueOf(String name) => _$gPaymentTypeValueOf(name);
}

abstract class GPinPromptonWorkInput
    implements Built<GPinPromptonWorkInput, GPinPromptonWorkInputBuilder> {
  GPinPromptonWorkInput._();

  factory GPinPromptonWorkInput(
          [void Function(GPinPromptonWorkInputBuilder b) updates]) =
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
          [void Function(GPopularWorksWhereInputBuilder b) updates]) =
      _$GPopularWorksWhereInput;

  String? get date;
  bool? get isSensitive;
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

class GPostOrderBy extends EnumClass {
  const GPostOrderBy._(String name) : super(name);

  static const GPostOrderBy CREATION_DATE = _$gPostOrderByCREATION_DATE;

  static const GPostOrderBy LIKES_COUNT = _$gPostOrderByLIKES_COUNT;

  static const GPostOrderBy VIEWS_COUNT = _$gPostOrderByVIEWS_COUNT;

  static Serializer<GPostOrderBy> get serializer => _$gPostOrderBySerializer;

  static BuiltSet<GPostOrderBy> get values => _$gPostOrderByValues;

  static GPostOrderBy valueOf(String name) => _$gPostOrderByValueOf(name);
}

abstract class GPostsWhereInput
    implements Built<GPostsWhereInput, GPostsWhereInputBuilder> {
  GPostsWhereInput._();

  factory GPostsWhereInput([void Function(GPostsWhereInputBuilder b) updates]) =
      _$GPostsWhereInput;

  BuiltList<GAccessType>? get accessTypes;
  bool get isSensitive;
  GPostOrderBy? get orderBy;
  BuiltList<GRating>? get ratings;
  GSort? get sort;
  GImageStyle? get style;
  static Serializer<GPostsWhereInput> get serializer =>
      _$gPostsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsWhereInput.serializer,
        json,
      );
}

class GPreferenceRating extends EnumClass {
  const GPreferenceRating._(String name) : super(name);

  static const GPreferenceRating G = _$gPreferenceRatingG;

  static const GPreferenceRating R15 = _$gPreferenceRatingR15;

  static const GPreferenceRating R18 = _$gPreferenceRatingR18;

  static const GPreferenceRating R18G = _$gPreferenceRatingR18G;

  static Serializer<GPreferenceRating> get serializer =>
      _$gPreferenceRatingSerializer;

  static BuiltSet<GPreferenceRating> get values => _$gPreferenceRatingValues;

  static GPreferenceRating valueOf(String name) =>
      _$gPreferenceRatingValueOf(name);
}

abstract class GPromptonFoldersWhereInput
    implements
        Built<GPromptonFoldersWhereInput, GPromptonFoldersWhereInputBuilder> {
  GPromptonFoldersWhereInput._();

  factory GPromptonFoldersWhereInput(
          [void Function(GPromptonFoldersWhereInputBuilder b) updates]) =
      _$GPromptonFoldersWhereInput;

  bool? get isPaid;
  String? get search;
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
          [void Function(GPromptonLabelsWhereInputBuilder b) updates]) =
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
          [void Function(GPromptonPlansWhereInputBuilder b) updates]) =
      _$GPromptonPlansWhereInput;

  String? get category;
  bool? get isPaid;
  bool? get isUnique;
  BuiltList<String>? get objectSlugs;
  String? get search;
  BuiltList<String>? get styleSlugs;
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

class GPromptonRequestStatus extends EnumClass {
  const GPromptonRequestStatus._(String name) : super(name);

  static const GPromptonRequestStatus CANCELED =
      _$gPromptonRequestStatusCANCELED;

  static const GPromptonRequestStatus COMPLETED =
      _$gPromptonRequestStatusCOMPLETED;

  static const GPromptonRequestStatus IN_PROGRESS =
      _$gPromptonRequestStatusIN_PROGRESS;

  static const GPromptonRequestStatus REJECTED =
      _$gPromptonRequestStatusREJECTED;

  static const GPromptonRequestStatus TIMEOUT = _$gPromptonRequestStatusTIMEOUT;

  static Serializer<GPromptonRequestStatus> get serializer =>
      _$gPromptonRequestStatusSerializer;

  static BuiltSet<GPromptonRequestStatus> get values =>
      _$gPromptonRequestStatusValues;

  static GPromptonRequestStatus valueOf(String name) =>
      _$gPromptonRequestStatusValueOf(name);
}

abstract class GPromptonTagsWhereInput
    implements Built<GPromptonTagsWhereInput, GPromptonTagsWhereInputBuilder> {
  GPromptonTagsWhereInput._();

  factory GPromptonTagsWhereInput(
          [void Function(GPromptonTagsWhereInputBuilder b) updates]) =
      _$GPromptonTagsWhereInput;

  bool? get isPinned;
  String? get search;
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
          [void Function(GPromptonUsersWhereInputBuilder b) updates]) =
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
          [void Function(GPromptonUserWorksWhereInputBuilder b) updates]) =
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

abstract class GPromptonWorksWhereInput
    implements
        Built<GPromptonWorksWhereInput, GPromptonWorksWhereInputBuilder> {
  GPromptonWorksWhereInput._();

  factory GPromptonWorksWhereInput(
          [void Function(GPromptonWorksWhereInputBuilder b) updates]) =
      _$GPromptonWorksWhereInput;

  String? get color;
  String? get search;
  BuiltList<String>? get tagSlugs;
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

abstract class GRecommendedTagsWhereInput
    implements
        Built<GRecommendedTagsWhereInput, GRecommendedTagsWhereInputBuilder> {
  GRecommendedTagsWhereInput._();

  factory GRecommendedTagsWhereInput(
          [void Function(GRecommendedTagsWhereInputBuilder b) updates]) =
      _$GRecommendedTagsWhereInput;

  bool? get isSensitive;
  static Serializer<GRecommendedTagsWhereInput> get serializer =>
      _$gRecommendedTagsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRecommendedTagsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRecommendedTagsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRecommendedTagsWhereInput.serializer,
        json,
      );
}

abstract class GRejectPromptonRequestInput
    implements
        Built<GRejectPromptonRequestInput, GRejectPromptonRequestInputBuilder> {
  GRejectPromptonRequestInput._();

  factory GRejectPromptonRequestInput(
          [void Function(GRejectPromptonRequestInputBuilder b) updates]) =
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
          [void Function(GRemovePromptonTagFromWorkInputBuilder b) updates]) =
      _$GRemovePromptonTagFromWorkInput;

  String get tagId;
  String get workId;
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
      [void Function(GRemovePromptonWorkFromFolderInputBuilder b)
          updates]) = _$GRemovePromptonWorkFromFolderInput;

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

abstract class GReportAlbumInput
    implements Built<GReportAlbumInput, GReportAlbumInputBuilder> {
  GReportAlbumInput._();

  factory GReportAlbumInput(
          [void Function(GReportAlbumInputBuilder b) updates]) =
      _$GReportAlbumInput;

  String get albumId;
  GReportReason get reason;
  static Serializer<GReportAlbumInput> get serializer =>
      _$gReportAlbumInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportAlbumInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportAlbumInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportAlbumInput.serializer,
        json,
      );
}

abstract class GReportCommentInput
    implements Built<GReportCommentInput, GReportCommentInputBuilder> {
  GReportCommentInput._();

  factory GReportCommentInput(
          [void Function(GReportCommentInputBuilder b) updates]) =
      _$GReportCommentInput;

  String get commentId;
  GReportReason get reason;
  static Serializer<GReportCommentInput> get serializer =>
      _$gReportCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportCommentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportCommentInput.serializer,
        json,
      );
}

abstract class GReportFolderInput
    implements Built<GReportFolderInput, GReportFolderInputBuilder> {
  GReportFolderInput._();

  factory GReportFolderInput(
          [void Function(GReportFolderInputBuilder b) updates]) =
      _$GReportFolderInput;

  String get folderId;
  GReportReason get reason;
  static Serializer<GReportFolderInput> get serializer =>
      _$gReportFolderInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportFolderInput.serializer,
        json,
      );
}

class GReportReason extends EnumClass {
  const GReportReason._(String name) : super(name);

  static const GReportReason AGE_MISMATCH = _$gReportReasonAGE_MISMATCH;

  static const GReportReason CHILD_PORNOGRAPHY =
      _$gReportReasonCHILD_PORNOGRAPHY;

  static const GReportReason COMMERCIAL_CONTENT =
      _$gReportReasonCOMMERCIAL_CONTENT;

  static const GReportReason EXCESSIVE_GORE = _$gReportReasonEXCESSIVE_GORE;

  static const GReportReason ILLEGAL_CONTENT = _$gReportReasonILLEGAL_CONTENT;

  static const GReportReason NO_MOSAIC = _$gReportReasonNO_MOSAIC;

  static const GReportReason OTHER = _$gReportReasonOTHER;

  static const GReportReason PRIVACY_VIOLATION =
      _$gReportReasonPRIVACY_VIOLATION;

  static const GReportReason TASTE_MISMATCH = _$gReportReasonTASTE_MISMATCH;

  static const GReportReason UNAUTHORIZED_REPOST =
      _$gReportReasonUNAUTHORIZED_REPOST;

  static Serializer<GReportReason> get serializer => _$gReportReasonSerializer;

  static BuiltSet<GReportReason> get values => _$gReportReasonValues;

  static GReportReason valueOf(String name) => _$gReportReasonValueOf(name);
}

abstract class GReportStickerInput
    implements Built<GReportStickerInput, GReportStickerInputBuilder> {
  GReportStickerInput._();

  factory GReportStickerInput(
          [void Function(GReportStickerInputBuilder b) updates]) =
      _$GReportStickerInput;

  GReportReason get reason;
  String get stickerId;
  static Serializer<GReportStickerInput> get serializer =>
      _$gReportStickerInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportStickerInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportStickerInput.serializer,
        json,
      );
}

abstract class GReportUserInput
    implements Built<GReportUserInput, GReportUserInputBuilder> {
  GReportUserInput._();

  factory GReportUserInput([void Function(GReportUserInputBuilder b) updates]) =
      _$GReportUserInput;

  GReportReason get reason;
  String get userId;
  static Serializer<GReportUserInput> get serializer =>
      _$gReportUserInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportUserInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportUserInput.serializer,
        json,
      );
}

abstract class GReportWorkInput
    implements Built<GReportWorkInput, GReportWorkInputBuilder> {
  GReportWorkInput._();

  factory GReportWorkInput([void Function(GReportWorkInputBuilder b) updates]) =
      _$GReportWorkInput;

  String get comment;
  GReportReason get reason;
  String get workId;
  static Serializer<GReportWorkInput> get serializer =>
      _$gReportWorkInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportWorkInput.serializer,
        json,
      );
}

abstract class GRequestsWhereInput
    implements Built<GRequestsWhereInput, GRequestsWhereInputBuilder> {
  GRequestsWhereInput._();

  factory GRequestsWhereInput(
          [void Function(GRequestsWhereInputBuilder b) updates]) =
      _$GRequestsWhereInput;

  GPromptonRequestStatus? get status;
  static Serializer<GRequestsWhereInput> get serializer =>
      _$gRequestsWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRequestsWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRequestsWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRequestsWhereInput.serializer,
        json,
      );
}

abstract class GSendPromptonMessageInput
    implements
        Built<GSendPromptonMessageInput, GSendPromptonMessageInputBuilder> {
  GSendPromptonMessageInput._();

  factory GSendPromptonMessageInput(
          [void Function(GSendPromptonMessageInputBuilder b) updates]) =
      _$GSendPromptonMessageInput;

  String get recipientId;
  String get text;
  static Serializer<GSendPromptonMessageInput> get serializer =>
      _$gSendPromptonMessageInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSendPromptonMessageInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSendPromptonMessageInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSendPromptonMessageInput.serializer,
        json,
      );
}

abstract class GSendPromptonRequestMessageInput
    implements
        Built<GSendPromptonRequestMessageInput,
            GSendPromptonRequestMessageInputBuilder> {
  GSendPromptonRequestMessageInput._();

  factory GSendPromptonRequestMessageInput(
          [void Function(GSendPromptonRequestMessageInputBuilder b) updates]) =
      _$GSendPromptonRequestMessageInput;

  String get recipientId;
  String get requestId;
  String get text;
  static Serializer<GSendPromptonRequestMessageInput> get serializer =>
      _$gSendPromptonRequestMessageInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSendPromptonRequestMessageInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSendPromptonRequestMessageInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSendPromptonRequestMessageInput.serializer,
        json,
      );
}

abstract class GSignImageGenerationTermsInput
    implements
        Built<GSignImageGenerationTermsInput,
            GSignImageGenerationTermsInputBuilder> {
  GSignImageGenerationTermsInput._();

  factory GSignImageGenerationTermsInput(
          [void Function(GSignImageGenerationTermsInputBuilder b) updates]) =
      _$GSignImageGenerationTermsInput;

  int get version;
  static Serializer<GSignImageGenerationTermsInput> get serializer =>
      _$gSignImageGenerationTermsInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSignImageGenerationTermsInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignImageGenerationTermsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSignImageGenerationTermsInput.serializer,
        json,
      );
}

class GSort extends EnumClass {
  const GSort._(String name) : super(name);

  static const GSort ASC = _$gSortASC;

  static const GSort DESC = _$gSortDESC;

  static Serializer<GSort> get serializer => _$gSortSerializer;

  static BuiltSet<GSort> get values => _$gSortValues;

  static GSort valueOf(String name) => _$gSortValueOf(name);
}

class GStickerAccessType extends EnumClass {
  const GStickerAccessType._(String name) : super(name);

  static const GStickerAccessType PRIVATE = _$gStickerAccessTypePRIVATE;

  static const GStickerAccessType PUBLIC = _$gStickerAccessTypePUBLIC;

  static Serializer<GStickerAccessType> get serializer =>
      _$gStickerAccessTypeSerializer;

  static BuiltSet<GStickerAccessType> get values => _$gStickerAccessTypeValues;

  static GStickerAccessType valueOf(String name) =>
      _$gStickerAccessTypeValueOf(name);
}

class GStickerGenre extends EnumClass {
  const GStickerGenre._(String name) : super(name);

  static const GStickerGenre ANIMAL = _$gStickerGenreANIMAL;

  static const GStickerGenre BACKGROUND = _$gStickerGenreBACKGROUND;

  static const GStickerGenre CHARACTER = _$gStickerGenreCHARACTER;

  static const GStickerGenre MACHINE = _$gStickerGenreMACHINE;

  static const GStickerGenre OBJECT = _$gStickerGenreOBJECT;

  static Serializer<GStickerGenre> get serializer => _$gStickerGenreSerializer;

  static BuiltSet<GStickerGenre> get values => _$gStickerGenreValues;

  static GStickerGenre valueOf(String name) => _$gStickerGenreValueOf(name);
}

class GStickerOrderBy extends EnumClass {
  const GStickerOrderBy._(String name) : super(name);

  static const GStickerOrderBy DATE_CREATED = _$gStickerOrderByDATE_CREATED;

  static const GStickerOrderBy DATE_DOWNLOADED =
      _$gStickerOrderByDATE_DOWNLOADED;

  static const GStickerOrderBy DATE_USED = _$gStickerOrderByDATE_USED;

  static Serializer<GStickerOrderBy> get serializer =>
      _$gStickerOrderBySerializer;

  static BuiltSet<GStickerOrderBy> get values => _$gStickerOrderByValues;

  static GStickerOrderBy valueOf(String name) => _$gStickerOrderByValueOf(name);
}

class GStickerSavedType extends EnumClass {
  const GStickerSavedType._(String name) : super(name);

  static const GStickerSavedType DOWNLOADED = _$gStickerSavedTypeDOWNLOADED;

  static const GStickerSavedType PRIVATE_CREATED =
      _$gStickerSavedTypePRIVATE_CREATED;

  static const GStickerSavedType PUBLIC_CREATED =
      _$gStickerSavedTypePUBLIC_CREATED;

  static Serializer<GStickerSavedType> get serializer =>
      _$gStickerSavedTypeSerializer;

  static BuiltSet<GStickerSavedType> get values => _$gStickerSavedTypeValues;

  static GStickerSavedType valueOf(String name) =>
      _$gStickerSavedTypeValueOf(name);
}

abstract class GStickersWhereInput
    implements Built<GStickersWhereInput, GStickersWhereInputBuilder> {
  GStickersWhereInput._();

  factory GStickersWhereInput(
          [void Function(GStickersWhereInputBuilder b) updates]) =
      _$GStickersWhereInput;

  BuiltList<String>? get categories;
  String? get creatorUserId;
  GStickerGenre? get genre;
  GStickerOrderBy? get orderBy;
  String? get search;
  GSort? get sort;
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

  factory GTagsWhereInput([void Function(GTagsWhereInputBuilder b) updates]) =
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
          [void Function(GTestPromptonIntegrationInputBuilder b) updates]) =
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
          [void Function(GUnfollowPromptonUserInputBuilder b) updates]) =
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

abstract class GUnfollowTagInput
    implements Built<GUnfollowTagInput, GUnfollowTagInputBuilder> {
  GUnfollowTagInput._();

  factory GUnfollowTagInput(
          [void Function(GUnfollowTagInputBuilder b) updates]) =
      _$GUnfollowTagInput;

  String get tagName;
  static Serializer<GUnfollowTagInput> get serializer =>
      _$gUnfollowTagInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnfollowTagInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUnfollowTagInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnfollowTagInput.serializer,
        json,
      );
}

abstract class GUnfollowUserInput
    implements Built<GUnfollowUserInput, GUnfollowUserInputBuilder> {
  GUnfollowUserInput._();

  factory GUnfollowUserInput(
          [void Function(GUnfollowUserInputBuilder b) updates]) =
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

  factory GUnmuteTagInput([void Function(GUnmuteTagInputBuilder b) updates]) =
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

  factory GUnmuteUserInput([void Function(GUnmuteUserInputBuilder b) updates]) =
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
          [void Function(GUnpinPromptonWorkInputBuilder b) updates]) =
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

abstract class GUnwatchFolderInput
    implements Built<GUnwatchFolderInput, GUnwatchFolderInputBuilder> {
  GUnwatchFolderInput._();

  factory GUnwatchFolderInput(
          [void Function(GUnwatchFolderInputBuilder b) updates]) =
      _$GUnwatchFolderInput;

  String get userId;
  static Serializer<GUnwatchFolderInput> get serializer =>
      _$gUnwatchFolderInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnwatchFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUnwatchFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnwatchFolderInput.serializer,
        json,
      );
}

abstract class GUpdateAccountFcmTokenInput
    implements
        Built<GUpdateAccountFcmTokenInput, GUpdateAccountFcmTokenInputBuilder> {
  GUpdateAccountFcmTokenInput._();

  factory GUpdateAccountFcmTokenInput(
          [void Function(GUpdateAccountFcmTokenInputBuilder b) updates]) =
      _$GUpdateAccountFcmTokenInput;

  String? get token;
  static Serializer<GUpdateAccountFcmTokenInput> get serializer =>
      _$gUpdateAccountFcmTokenInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountFcmTokenInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountFcmTokenInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountFcmTokenInput.serializer,
        json,
      );
}

abstract class GUpdateAccountLoginInput
    implements
        Built<GUpdateAccountLoginInput, GUpdateAccountLoginInputBuilder> {
  GUpdateAccountLoginInput._();

  factory GUpdateAccountLoginInput(
          [void Function(GUpdateAccountLoginInputBuilder b) updates]) =
      _$GUpdateAccountLoginInput;

  String get login;
  static Serializer<GUpdateAccountLoginInput> get serializer =>
      _$gUpdateAccountLoginInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountLoginInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountLoginInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountLoginInput.serializer,
        json,
      );
}

abstract class GUpdateAccountPasswordInput
    implements
        Built<GUpdateAccountPasswordInput, GUpdateAccountPasswordInputBuilder> {
  GUpdateAccountPasswordInput._();

  factory GUpdateAccountPasswordInput(
          [void Function(GUpdateAccountPasswordInputBuilder b) updates]) =
      _$GUpdateAccountPasswordInput;

  String? get currentPassword;
  String get newPassword;
  static Serializer<GUpdateAccountPasswordInput> get serializer =>
      _$gUpdateAccountPasswordInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountPasswordInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountPasswordInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountPasswordInput.serializer,
        json,
      );
}

abstract class GUpdateAccountWebFcmTokenInput
    implements
        Built<GUpdateAccountWebFcmTokenInput,
            GUpdateAccountWebFcmTokenInputBuilder> {
  GUpdateAccountWebFcmTokenInput._();

  factory GUpdateAccountWebFcmTokenInput(
          [void Function(GUpdateAccountWebFcmTokenInputBuilder b) updates]) =
      _$GUpdateAccountWebFcmTokenInput;

  String? get token;
  static Serializer<GUpdateAccountWebFcmTokenInput> get serializer =>
      _$gUpdateAccountWebFcmTokenInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAccountWebFcmTokenInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountWebFcmTokenInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAccountWebFcmTokenInput.serializer,
        json,
      );
}

abstract class GUpdateAlbumInput
    implements Built<GUpdateAlbumInput, GUpdateAlbumInputBuilder> {
  GUpdateAlbumInput._();

  factory GUpdateAlbumInput(
          [void Function(GUpdateAlbumInputBuilder b) updates]) =
      _$GUpdateAlbumInput;

  String get albumId;
  String? get description;
  String? get headerImageUrl;
  String? get title;
  BuiltList<String>? get workIds;
  static Serializer<GUpdateAlbumInput> get serializer =>
      _$gUpdateAlbumInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAlbumInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAlbumInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAlbumInput.serializer,
        json,
      );
}

abstract class GUpdateBookmarkedStickerInput
    implements
        Built<GUpdateBookmarkedStickerInput,
            GUpdateBookmarkedStickerInputBuilder> {
  GUpdateBookmarkedStickerInput._();

  factory GUpdateBookmarkedStickerInput(
          [void Function(GUpdateBookmarkedStickerInputBuilder b) updates]) =
      _$GUpdateBookmarkedStickerInput;

  bool get isBookmarked;
  String get stickerId;
  GBookmarkedStickerType get type;
  static Serializer<GUpdateBookmarkedStickerInput> get serializer =>
      _$gUpdateBookmarkedStickerInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateBookmarkedStickerInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateBookmarkedStickerInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateBookmarkedStickerInput.serializer,
        json,
      );
}

abstract class GUpdateFolderInput
    implements Built<GUpdateFolderInput, GUpdateFolderInputBuilder> {
  GUpdateFolderInput._();

  factory GUpdateFolderInput(
          [void Function(GUpdateFolderInputBuilder b) updates]) =
      _$GUpdateFolderInput;

  String get folderId;
  String get title;
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

abstract class GUpdateImageGenerationMemoInput
    implements
        Built<GUpdateImageGenerationMemoInput,
            GUpdateImageGenerationMemoInputBuilder> {
  GUpdateImageGenerationMemoInput._();

  factory GUpdateImageGenerationMemoInput(
          [void Function(GUpdateImageGenerationMemoInputBuilder b) updates]) =
      _$GUpdateImageGenerationMemoInput;

  int get clipSkip;
  String get explanation;
  int get height;
  String get modelId;
  String get nanoid;
  String get negativePrompts;
  String get prompts;
  String get sampler;
  int get scale;
  int get seed;
  int get steps;
  String get title;
  String get vae;
  int get width;
  static Serializer<GUpdateImageGenerationMemoInput> get serializer =>
      _$gUpdateImageGenerationMemoInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateImageGenerationMemoInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateImageGenerationMemoInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateImageGenerationMemoInput.serializer,
        json,
      );
}

abstract class GUpdateNoteInput
    implements Built<GUpdateNoteInput, GUpdateNoteInputBuilder> {
  GUpdateNoteInput._();

  factory GUpdateNoteInput([void Function(GUpdateNoteInputBuilder b) updates]) =
      _$GUpdateNoteInput;

  String get noteId;
  static Serializer<GUpdateNoteInput> get serializer =>
      _$gUpdateNoteInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateNoteInput.serializer,
        json,
      );
}

abstract class GUpdateNovelInput
    implements Built<GUpdateNovelInput, GUpdateNovelInputBuilder> {
  GUpdateNovelInput._();

  factory GUpdateNovelInput(
          [void Function(GUpdateNovelInputBuilder b) updates]) =
      _$GUpdateNovelInput;

  String get novelId;
  static Serializer<GUpdateNovelInput> get serializer =>
      _$gUpdateNovelInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateNovelInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateNovelInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateNovelInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonFolderInput
    implements
        Built<GUpdatePromptonFolderInput, GUpdatePromptonFolderInputBuilder> {
  GUpdatePromptonFolderInput._();

  factory GUpdatePromptonFolderInput(
          [void Function(GUpdatePromptonFolderInputBuilder b) updates]) =
      _$GUpdatePromptonFolderInput;

  String get description;
  String get folderId;
  String? get imageFileId;
  String get name;
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

abstract class GUpdatePromptonPlanInput
    implements
        Built<GUpdatePromptonPlanInput, GUpdatePromptonPlanInputBuilder> {
  GUpdatePromptonPlanInput._();

  factory GUpdatePromptonPlanInput(
          [void Function(GUpdatePromptonPlanInputBuilder b) updates]) =
      _$GUpdatePromptonPlanInput;

  String get category;
  String get description;
  bool get featureCommercialUse;
  bool get featureCopyrightFree;
  bool get featureFanFiction;
  bool get featurePrivate;
  String? get imageFileId;
  int get maximumQuantity;
  String get message;
  int get minimumQuantity;
  String get name;
  BuiltList<String> get objectSlugs;
  String get planId;
  BuiltList<String> get styleSlugs;
  int get unitPrice;
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
          [void Function(GUpdatePromptonPlanSortInputBuilder b) updates]) =
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
          [void Function(GUpdatePromptonProfileBlockInputBuilder b) updates]) =
      _$GUpdatePromptonProfileBlockInput;

  String? get description;
  String get profileBlockId;
  String? get siteURL;
  String? get title;
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

abstract class GUpdatePromptonPromptInput
    implements
        Built<GUpdatePromptonPromptInput, GUpdatePromptonPromptInputBuilder> {
  GUpdatePromptonPromptInput._();

  factory GUpdatePromptonPromptInput(
          [void Function(GUpdatePromptonPromptInputBuilder b) updates]) =
      _$GUpdatePromptonPromptInput;

  String? get description;
  bool get isBase;
  bool get isNsfw;
  bool get isSingle;
  String get name;
  String get promptId;
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
          [void Function(GUpdatePromptonUserAvatarInputBuilder b) updates]) =
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
      [void Function(GUpdatePromptonUserHeaderImageInputBuilder b)
          updates]) = _$GUpdatePromptonUserHeaderImageInput;

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

abstract class GUpdatePromptonUserInvoiceRegistrationNumberInput
    implements
        Built<GUpdatePromptonUserInvoiceRegistrationNumberInput,
            GUpdatePromptonUserInvoiceRegistrationNumberInputBuilder> {
  GUpdatePromptonUserInvoiceRegistrationNumberInput._();

  factory GUpdatePromptonUserInvoiceRegistrationNumberInput(
      [void Function(GUpdatePromptonUserInvoiceRegistrationNumberInputBuilder b)
          updates]) = _$GUpdatePromptonUserInvoiceRegistrationNumberInput;

  String? get invoiceRegistrationNumber;
  static Serializer<GUpdatePromptonUserInvoiceRegistrationNumberInput>
      get serializer =>
          _$gUpdatePromptonUserInvoiceRegistrationNumberInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePromptonUserInvoiceRegistrationNumberInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdatePromptonUserInvoiceRegistrationNumberInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePromptonUserInvoiceRegistrationNumberInput.serializer,
        json,
      );
}

abstract class GUpdatePromptonUserLoginInput
    implements
        Built<GUpdatePromptonUserLoginInput,
            GUpdatePromptonUserLoginInputBuilder> {
  GUpdatePromptonUserLoginInput._();

  factory GUpdatePromptonUserLoginInput(
          [void Function(GUpdatePromptonUserLoginInputBuilder b) updates]) =
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
          [void Function(GUpdatePromptonUserProfileInputBuilder b) updates]) =
      _$GUpdatePromptonUserProfileInput;

  String? get biography;
  String? get deviantartUsername;
  String? get githubUsername;
  String? get instagramUsername;
  String get name;
  String? get pixivUsername;
  String? get tumblrUsername;
  String? get twitterUsername;
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
          [void Function(GUpdatePromptonWorkInputBuilder b) updates]) =
      _$GUpdatePromptonWorkInput;

  String? get body;
  String? get title;
  String get workId;
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

abstract class GUpdateProtectedImageGenerationResultInput
    implements
        Built<GUpdateProtectedImageGenerationResultInput,
            GUpdateProtectedImageGenerationResultInputBuilder> {
  GUpdateProtectedImageGenerationResultInput._();

  factory GUpdateProtectedImageGenerationResultInput(
      [void Function(GUpdateProtectedImageGenerationResultInputBuilder b)
          updates]) = _$GUpdateProtectedImageGenerationResultInput;

  bool get isProtected;
  String get nanoid;
  static Serializer<GUpdateProtectedImageGenerationResultInput>
      get serializer => _$gUpdateProtectedImageGenerationResultInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProtectedImageGenerationResultInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProtectedImageGenerationResultInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateProtectedImageGenerationResultInput.serializer,
        json,
      );
}

abstract class GUpdateRatingImageGenerationModelInput
    implements
        Built<GUpdateRatingImageGenerationModelInput,
            GUpdateRatingImageGenerationModelInputBuilder> {
  GUpdateRatingImageGenerationModelInput._();

  factory GUpdateRatingImageGenerationModelInput(
      [void Function(GUpdateRatingImageGenerationModelInputBuilder b)
          updates]) = _$GUpdateRatingImageGenerationModelInput;

  String get modelId;
  int get rating;
  static Serializer<GUpdateRatingImageGenerationModelInput> get serializer =>
      _$gUpdateRatingImageGenerationModelInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRatingImageGenerationModelInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRatingImageGenerationModelInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateRatingImageGenerationModelInput.serializer,
        json,
      );
}

abstract class GUpdateRatingImageGenerationResultInput
    implements
        Built<GUpdateRatingImageGenerationResultInput,
            GUpdateRatingImageGenerationResultInputBuilder> {
  GUpdateRatingImageGenerationResultInput._();

  factory GUpdateRatingImageGenerationResultInput(
      [void Function(GUpdateRatingImageGenerationResultInputBuilder b)
          updates]) = _$GUpdateRatingImageGenerationResultInput;

  String get nanoid;
  int get rating;
  static Serializer<GUpdateRatingImageGenerationResultInput> get serializer =>
      _$gUpdateRatingImageGenerationResultInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRatingImageGenerationResultInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRatingImageGenerationResultInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateRatingImageGenerationResultInput.serializer,
        json,
      );
}

abstract class GUpdateStickerInput
    implements Built<GUpdateStickerInput, GUpdateStickerInputBuilder> {
  GUpdateStickerInput._();

  factory GUpdateStickerInput(
          [void Function(GUpdateStickerInputBuilder b) updates]) =
      _$GUpdateStickerInput;

  GStickerAccessType get accessType;
  BuiltList<String>? get categories;
  GStickerGenre? get genre;
  String get stickerId;
  String? get title;
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
          [void Function(GUpdateUserProfileInputBuilder b) updates]) =
      _$GUpdateUserProfileInput;

  String? get biography;
  String? get displayName;
  String? get enBiography;
  BuiltList<String>? get featuredSensitiveWorkIds;
  BuiltList<String>? get featuredWorkIds;
  String? get githubAccountId;
  String? get headerImageUrl;
  String? get homeUrl;
  String? get iconUrl;
  String? get instagramAccountId;
  String? get mailAddress;
  String? get twitterAccountId;
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

abstract class GUpdateUserSettingInput
    implements Built<GUpdateUserSettingInput, GUpdateUserSettingInputBuilder> {
  GUpdateUserSettingInput._();

  factory GUpdateUserSettingInput(
          [void Function(GUpdateUserSettingInputBuilder b) updates]) =
      _$GUpdateUserSettingInput;

  bool? get featurePromptonRequest;
  bool? get isAnonymousLike;
  bool? get isAnonymousSensitiveLike;
  bool? get isBlurSensitiveImage;
  bool? get isNotifyComment;
  GPreferenceRating? get preferenceRating;
  bool? get safetyMode;
  static Serializer<GUpdateUserSettingInput> get serializer =>
      _$gUpdateUserSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateUserSettingInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserSettingInput.serializer,
        json,
      );
}

abstract class GUpdateWorkInput
    implements Built<GUpdateWorkInput, GUpdateWorkInputBuilder> {
  GUpdateWorkInput._();

  factory GUpdateWorkInput([void Function(GUpdateWorkInputBuilder b) updates]) =
      _$GUpdateWorkInput;

  GGenerationAccessType get accessGenerationType;
  GAccessType get accessType;
  String? get albumId;
  String? get enExplanation;
  String? get entitle;
  String? get explanation;
  String get id;
  int get imageHeight;
  GImageStyle get imageStyle;
  BuiltList<String> get imageUrls;
  int get imageWidth;
  bool get isCommentEditable;
  bool get isPromotion;
  bool get isTagEditable;
  int get largeThumbnailImageHeight;
  String get largeThumbnailImageURL;
  int get largeThumbnailImageWidth;
  String get mainImageSha256;
  String? get md;
  String? get modelHash;
  String? get modelId;
  String? get modelName;
  String? get negativePrompt;
  String? get noise;
  String? get ogpImageUrl;
  String? get otherGenerationParams;
  String? get pngInfo;
  String? get prompt;
  GRating get rating;
  String? get relatedUrl;
  double? get reservedAt;
  String? get sampler;
  String? get seed;
  int get smallThumbnailImageHeight;
  String get smallThumbnailImageURL;
  int get smallThumbnailImageWidth;
  String? get steps;
  String? get strength;
  String? get subjectId;
  BuiltList<String>? get tags;
  double? get thumbnailPosition;
  String get title;
  GWorkType get type;
  String? get videoUrl;
  static Serializer<GUpdateWorkInput> get serializer =>
      _$gUpdateWorkInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateWorkInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateWorkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateWorkInput.serializer,
        json,
      );
}

abstract class GUpdateWorkTagsInput
    implements Built<GUpdateWorkTagsInput, GUpdateWorkTagsInputBuilder> {
  GUpdateWorkTagsInput._();

  factory GUpdateWorkTagsInput(
          [void Function(GUpdateWorkTagsInputBuilder b) updates]) =
      _$GUpdateWorkTagsInput;

  String get id;
  BuiltList<String>? get tags;
  static Serializer<GUpdateWorkTagsInput> get serializer =>
      _$gUpdateWorkTagsInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateWorkTagsInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateWorkTagsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateWorkTagsInput.serializer,
        json,
      );
}

abstract class GUserAlbumInput
    implements Built<GUserAlbumInput, GUserAlbumInputBuilder> {
  GUserAlbumInput._();

  factory GUserAlbumInput([void Function(GUserAlbumInputBuilder b) updates]) =
      _$GUserAlbumInput;

  bool? get isSensitive;
  String? get search;
  static Serializer<GUserAlbumInput> get serializer =>
      _$gUserAlbumInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAlbumInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserAlbumInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAlbumInput.serializer,
        json,
      );
}

abstract class GUserAlbumWhereInput
    implements Built<GUserAlbumWhereInput, GUserAlbumWhereInputBuilder> {
  GUserAlbumWhereInput._();

  factory GUserAlbumWhereInput(
          [void Function(GUserAlbumWhereInputBuilder b) updates]) =
      _$GUserAlbumWhereInput;

  String get link;
  String get userId;
  static Serializer<GUserAlbumWhereInput> get serializer =>
      _$gUserAlbumWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAlbumWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserAlbumWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAlbumWhereInput.serializer,
        json,
      );
}

abstract class GUserFolderInput
    implements Built<GUserFolderInput, GUserFolderInputBuilder> {
  GUserFolderInput._();

  factory GUserFolderInput([void Function(GUserFolderInputBuilder b) updates]) =
      _$GUserFolderInput;

  bool? get isSensitive;
  String? get search;
  static Serializer<GUserFolderInput> get serializer =>
      _$gUserFolderInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFolderInput.serializer,
        json,
      );
}

abstract class GUserStickersWhereInput
    implements Built<GUserStickersWhereInput, GUserStickersWhereInputBuilder> {
  GUserStickersWhereInput._();

  factory GUserStickersWhereInput(
          [void Function(GUserStickersWhereInputBuilder b) updates]) =
      _$GUserStickersWhereInput;

  BuiltList<String>? get categories;
  BuiltList<GStickerSavedType>? get savedTypes;
  String? get search;
  static Serializer<GUserStickersWhereInput> get serializer =>
      _$gUserStickersWhereInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersWhereInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserStickersWhereInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersWhereInput.serializer,
        json,
      );
}

abstract class GUsersWhereInput
    implements Built<GUsersWhereInput, GUsersWhereInputBuilder> {
  GUsersWhereInput._();

  factory GUsersWhereInput([void Function(GUsersWhereInputBuilder b) updates]) =
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
          [void Function(GUserWorksWhereInputBuilder b) updates]) =
      _$GUserWorksWhereInput;

  bool? get isGeneration;
  bool? get isSensitive;
  String? get modelName;
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

abstract class GWatchFolderInput
    implements Built<GWatchFolderInput, GWatchFolderInputBuilder> {
  GWatchFolderInput._();

  factory GWatchFolderInput(
          [void Function(GWatchFolderInputBuilder b) updates]) =
      _$GWatchFolderInput;

  String get folderId;
  static Serializer<GWatchFolderInput> get serializer =>
      _$gWatchFolderInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWatchFolderInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWatchFolderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWatchFolderInput.serializer,
        json,
      );
}

abstract class GWhiteListTagsInput
    implements Built<GWhiteListTagsInput, GWhiteListTagsInputBuilder> {
  GWhiteListTagsInput._();

  factory GWhiteListTagsInput(
          [void Function(GWhiteListTagsInputBuilder b) updates]) =
      _$GWhiteListTagsInput;

  bool? get isSensitive;
  String? get search;
  static Serializer<GWhiteListTagsInput> get serializer =>
      _$gWhiteListTagsInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWhiteListTagsInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWhiteListTagsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWhiteListTagsInput.serializer,
        json,
      );
}

abstract class GWorkAwardsWhereInput
    implements Built<GWorkAwardsWhereInput, GWorkAwardsWhereInputBuilder> {
  GWorkAwardsWhereInput._();

  factory GWorkAwardsWhereInput(
          [void Function(GWorkAwardsWhereInputBuilder b) updates]) =
      _$GWorkAwardsWhereInput;

  String? get date;
  int? get day;
  bool? get isSensitive;
  int? get month;
  GAwardType? get type;
  int? get weekIndex;
  int? get year;
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

class GWorkOrderBy extends EnumClass {
  const GWorkOrderBy._(String name) : super(name);

  static const GWorkOrderBy ACCESS_TYPE = _$gWorkOrderByACCESS_TYPE;

  static const GWorkOrderBy BOOKMARKS_COUNT = _$gWorkOrderByBOOKMARKS_COUNT;

  static const GWorkOrderBy COMMENTS_COUNT = _$gWorkOrderByCOMMENTS_COUNT;

  static const GWorkOrderBy DATE_CREATED = _$gWorkOrderByDATE_CREATED;

  static const GWorkOrderBy EN_NAME = _$gWorkOrderByEN_NAME;

  static const GWorkOrderBy LIKES_COUNT = _$gWorkOrderByLIKES_COUNT;

  static const GWorkOrderBy NAME = _$gWorkOrderByNAME;

  static const GWorkOrderBy VIEWS_COUNT = _$gWorkOrderByVIEWS_COUNT;

  static const GWorkOrderBy WORK_TYPE = _$gWorkOrderByWORK_TYPE;

  static Serializer<GWorkOrderBy> get serializer => _$gWorkOrderBySerializer;

  static BuiltSet<GWorkOrderBy> get values => _$gWorkOrderByValues;

  static GWorkOrderBy valueOf(String name) => _$gWorkOrderByValueOf(name);
}

abstract class GWorksWhereInput
    implements Built<GWorksWhereInput, GWorksWhereInputBuilder> {
  GWorksWhereInput._();

  factory GWorksWhereInput([void Function(GWorksWhereInputBuilder b) updates]) =
      _$GWorksWhereInput;

  BuiltList<GAccessType>? get accessTypes;
  String? get beforeCreatedAt;
  String? get createdAtAfter;
  String? get generationModelId;
  bool? get hasPrompt;
  BuiltList<String>? get ids;
  bool? get isFeatured;
  bool? get isFollowing;
  bool? get isIncludePrivate;
  bool? get isNotFollowing;
  bool? get isNowCreatedAt;
  bool? get isOneWorkPerUser;
  bool? get isPromptPublic;
  bool? get isRecommended;
  bool? get isSensitive;
  bool? get isThemeParticipated;
  BuiltList<String>? get modelNames;
  GWorkOrderBy? get orderBy;
  String? get ownerName;
  BuiltList<String>? get prompts;
  BuiltList<GRating>? get ratings;
  String? get recommendedWorksUserId;
  String? get search;
  BuiltList<String>? get serviceNames;
  GSort? get sort;
  GImageStyle? get style;
  int? get subjectId;
  BuiltList<String>? get tagNames;
  String? get userId;
  GWorkType? get workType;
  BuiltList<GWorkType>? get workTypes;
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

class GWorkType extends EnumClass {
  const GWorkType._(String name) : super(name);

  static const GWorkType COLUMN = _$gWorkTypeCOLUMN;

  static const GWorkType NOVEL = _$gWorkTypeNOVEL;

  static const GWorkType VIDEO = _$gWorkTypeVIDEO;

  static const GWorkType WORK = _$gWorkTypeWORK;

  static Serializer<GWorkType> get serializer => _$gWorkTypeSerializer;

  static BuiltSet<GWorkType> get values => _$gWorkTypeValues;

  static GWorkType valueOf(String name) => _$gWorkTypeValueOf(name);
}

const Map<String, Set<String>> possibleTypesMap = {
  'Node': {
    'AiModelNode',
    'AlbumNode',
    'AlbumViewerNode',
    'AnimationPostNode',
    'AnnouncementNode',
    'AppEventNode',
    'CategoryNode',
    'CategoryViewerNode',
    'CommentNode',
    'ControlNetCategoryNode',
    'ControlNetContentNode',
    'DailyThemeNode',
    'FeedNode',
    'FeedPostNode',
    'FolderNode',
    'FollowNotificationNode',
    'ImageGenerationMemoNode',
    'ImageGenerationReservedTaskNode',
    'ImageGenerationResultNode',
    'ImageGenerationTaskNode',
    'ImageGeneratorNode',
    'ImageLoraModelNode',
    'ImageModelNode',
    'ImageNode',
    'ImagePostNode',
    'LikedWorkNotificationNode',
    'LikedWorksSummaryNotificationNode',
    'MessageNode',
    'MessageThreadNode',
    'MilestoneNode',
    'MutedTagNode',
    'NoteNode',
    'NotePostNode',
    'NovelNode',
    'NovelPostNode',
    'PassNode',
    'PaymentNode',
    'PromotionNode',
    'PromptCategoryNode',
    'PromptNode',
    'PromptonAccountNode',
    'PromptonCustomerNode',
    'PromptonFileNode',
    'PromptonFolderKeyNode',
    'PromptonFolderNode',
    'PromptonFolderViewerNode',
    'PromptonFriendshipNode',
    'PromptonIntegrationNode',
    'PromptonLabelNode',
    'PromptonMessageNode',
    'PromptonMessageThreadNode',
    'PromptonPaymentIntentNode',
    'PromptonPaymentMethodNode',
    'PromptonPaymentNode',
    'PromptonPayoutNode',
    'PromptonPlanNode',
    'PromptonProfileBlockNode',
    'PromptonPromptNode',
    'PromptonRequestNode',
    'PromptonTagNode',
    'PromptonUserNode',
    'PromptonWorkNode',
    'StickerNode',
    'StickerViewerNode',
    'SubWorkNode',
    'TagNode',
    'TagViewerNode',
    'UserNode',
    'UserSettingNode',
    'UserViewerNode',
    'WorkAwardNode',
    'WorkAwardNotificationNode',
    'WorkCommentNotificationNode',
    'WorkCommentReplyNotificationNode',
    'WorkNode',
    'WorkViewerNode',
  },
  'NotificationNode': {
    'FollowNotificationNode',
    'LikedWorkNotificationNode',
    'LikedWorksSummaryNotificationNode',
    'WorkAwardNotificationNode',
    'WorkCommentNotificationNode',
    'WorkCommentReplyNotificationNode',
  },
  'PostNode': {
    'AnimationPostNode',
    'ImagePostNode',
    'NotePostNode',
    'NovelPostNode',
  },
};
