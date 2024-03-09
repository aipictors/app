// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/comment_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    as _i3;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_comment_responses.data.gql.g.dart';

abstract class GWorkCommentResponsesData
    implements
        Built<GWorkCommentResponsesData, GWorkCommentResponsesDataBuilder> {
  GWorkCommentResponsesData._();

  factory GWorkCommentResponsesData(
          [Function(GWorkCommentResponsesDataBuilder b) updates]) =
      _$GWorkCommentResponsesData;

  static void _initializeBuilder(GWorkCommentResponsesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GWorkCommentResponsesData_work? get work;
  static Serializer<GWorkCommentResponsesData> get serializer =>
      _$gWorkCommentResponsesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work
    implements
        Built<GWorkCommentResponsesData_work,
            GWorkCommentResponsesData_workBuilder> {
  GWorkCommentResponsesData_work._();

  factory GWorkCommentResponsesData_work(
          [Function(GWorkCommentResponsesData_workBuilder b) updates]) =
      _$GWorkCommentResponsesData_work;

  static void _initializeBuilder(GWorkCommentResponsesData_workBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  GWorkCommentResponsesData_work_comment get comment;
  static Serializer<GWorkCommentResponsesData_work> get serializer =>
      _$gWorkCommentResponsesDataWorkSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment
    implements
        Built<GWorkCommentResponsesData_work_comment,
            GWorkCommentResponsesData_work_commentBuilder>,
        _i2.GCommentFields {
  GWorkCommentResponsesData_work_comment._();

  factory GWorkCommentResponsesData_work_comment(
          [Function(GWorkCommentResponsesData_work_commentBuilder b) updates]) =
      _$GWorkCommentResponsesData_work_comment;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_commentBuilder b) =>
      b..G__typename = 'CommentNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  String get text;
  @override
  GWorkCommentResponsesData_work_comment_user? get user;
  @override
  GWorkCommentResponsesData_work_comment_sticker? get sticker;
  BuiltList<GWorkCommentResponsesData_work_comment_responses> get responses;
  static Serializer<GWorkCommentResponsesData_work_comment> get serializer =>
      _$gWorkCommentResponsesDataWorkCommentSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work_comment.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment_user
    implements
        Built<GWorkCommentResponsesData_work_comment_user,
            GWorkCommentResponsesData_work_comment_userBuilder>,
        _i2.GCommentFields_user,
        _i3.GWorkUserFields {
  GWorkCommentResponsesData_work_comment_user._();

  factory GWorkCommentResponsesData_work_comment_user(
      [Function(GWorkCommentResponsesData_work_comment_userBuilder b)
          updates]) = _$GWorkCommentResponsesData_work_comment_user;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_userBuilder b) =>
      b..G__typename = 'UserNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  String get login;
  @override
  GWorkCommentResponsesData_work_comment_user_iconImage? get iconImage;
  @override
  bool get isMuted;
  static Serializer<GWorkCommentResponsesData_work_comment_user>
      get serializer => _$gWorkCommentResponsesDataWorkCommentUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work_comment_user.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment_user_iconImage
    implements
        Built<GWorkCommentResponsesData_work_comment_user_iconImage,
            GWorkCommentResponsesData_work_comment_user_iconImageBuilder>,
        _i2.GCommentFields_user_iconImage,
        _i3.GWorkUserFields_iconImage {
  GWorkCommentResponsesData_work_comment_user_iconImage._();

  factory GWorkCommentResponsesData_work_comment_user_iconImage(
      [Function(GWorkCommentResponsesData_work_comment_user_iconImageBuilder b)
          updates]) = _$GWorkCommentResponsesData_work_comment_user_iconImage;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentResponsesData_work_comment_user_iconImage>
      get serializer =>
          _$gWorkCommentResponsesDataWorkCommentUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work_comment_user_iconImage.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment_sticker
    implements
        Built<GWorkCommentResponsesData_work_comment_sticker,
            GWorkCommentResponsesData_work_comment_stickerBuilder>,
        _i2.GCommentFields_sticker {
  GWorkCommentResponsesData_work_comment_sticker._();

  factory GWorkCommentResponsesData_work_comment_sticker(
      [Function(GWorkCommentResponsesData_work_comment_stickerBuilder b)
          updates]) = _$GWorkCommentResponsesData_work_comment_sticker;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_stickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GWorkCommentResponsesData_work_comment_sticker_image? get image;
  static Serializer<GWorkCommentResponsesData_work_comment_sticker>
      get serializer => _$gWorkCommentResponsesDataWorkCommentStickerSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_sticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_sticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work_comment_sticker.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment_sticker_image
    implements
        Built<GWorkCommentResponsesData_work_comment_sticker_image,
            GWorkCommentResponsesData_work_comment_sticker_imageBuilder>,
        _i2.GCommentFields_sticker_image {
  GWorkCommentResponsesData_work_comment_sticker_image._();

  factory GWorkCommentResponsesData_work_comment_sticker_image(
      [Function(GWorkCommentResponsesData_work_comment_sticker_imageBuilder b)
          updates]) = _$GWorkCommentResponsesData_work_comment_sticker_image;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_sticker_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentResponsesData_work_comment_sticker_image>
      get serializer =>
          _$gWorkCommentResponsesDataWorkCommentStickerImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_sticker_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_sticker_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work_comment_sticker_image.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment_responses
    implements
        Built<GWorkCommentResponsesData_work_comment_responses,
            GWorkCommentResponsesData_work_comment_responsesBuilder>,
        _i2.GCommentFields {
  GWorkCommentResponsesData_work_comment_responses._();

  factory GWorkCommentResponsesData_work_comment_responses(
      [Function(GWorkCommentResponsesData_work_comment_responsesBuilder b)
          updates]) = _$GWorkCommentResponsesData_work_comment_responses;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_responsesBuilder b) =>
      b..G__typename = 'CommentNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  String get text;
  @override
  GWorkCommentResponsesData_work_comment_responses_user? get user;
  @override
  GWorkCommentResponsesData_work_comment_responses_sticker? get sticker;
  static Serializer<GWorkCommentResponsesData_work_comment_responses>
      get serializer =>
          _$gWorkCommentResponsesDataWorkCommentResponsesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_responses.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_responses? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work_comment_responses.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment_responses_user
    implements
        Built<GWorkCommentResponsesData_work_comment_responses_user,
            GWorkCommentResponsesData_work_comment_responses_userBuilder>,
        _i2.GCommentFields_user,
        _i3.GWorkUserFields {
  GWorkCommentResponsesData_work_comment_responses_user._();

  factory GWorkCommentResponsesData_work_comment_responses_user(
      [Function(GWorkCommentResponsesData_work_comment_responses_userBuilder b)
          updates]) = _$GWorkCommentResponsesData_work_comment_responses_user;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_responses_userBuilder b) =>
      b..G__typename = 'UserNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  String get login;
  @override
  GWorkCommentResponsesData_work_comment_responses_user_iconImage?
      get iconImage;
  @override
  bool get isMuted;
  static Serializer<GWorkCommentResponsesData_work_comment_responses_user>
      get serializer =>
          _$gWorkCommentResponsesDataWorkCommentResponsesUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_responses_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_responses_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work_comment_responses_user.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment_responses_user_iconImage
    implements
        Built<GWorkCommentResponsesData_work_comment_responses_user_iconImage,
            GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder>,
        _i2.GCommentFields_user_iconImage,
        _i3.GWorkUserFields_iconImage {
  GWorkCommentResponsesData_work_comment_responses_user_iconImage._();

  factory GWorkCommentResponsesData_work_comment_responses_user_iconImage(
          [Function(
                  GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder
                      b)
              updates]) =
      _$GWorkCommentResponsesData_work_comment_responses_user_iconImage;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder
              b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<
          GWorkCommentResponsesData_work_comment_responses_user_iconImage>
      get serializer =>
          _$gWorkCommentResponsesDataWorkCommentResponsesUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_responses_user_iconImage
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_responses_user_iconImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GWorkCommentResponsesData_work_comment_responses_user_iconImage
                .serializer,
            json,
          );
}

abstract class GWorkCommentResponsesData_work_comment_responses_sticker
    implements
        Built<GWorkCommentResponsesData_work_comment_responses_sticker,
            GWorkCommentResponsesData_work_comment_responses_stickerBuilder>,
        _i2.GCommentFields_sticker {
  GWorkCommentResponsesData_work_comment_responses_sticker._();

  factory GWorkCommentResponsesData_work_comment_responses_sticker(
      [Function(
              GWorkCommentResponsesData_work_comment_responses_stickerBuilder b)
          updates]) = _$GWorkCommentResponsesData_work_comment_responses_sticker;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_responses_stickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GWorkCommentResponsesData_work_comment_responses_sticker_image? get image;
  static Serializer<GWorkCommentResponsesData_work_comment_responses_sticker>
      get serializer =>
          _$gWorkCommentResponsesDataWorkCommentResponsesStickerSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_responses_sticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_responses_sticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentResponsesData_work_comment_responses_sticker.serializer,
        json,
      );
}

abstract class GWorkCommentResponsesData_work_comment_responses_sticker_image
    implements
        Built<GWorkCommentResponsesData_work_comment_responses_sticker_image,
            GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder>,
        _i2.GCommentFields_sticker_image {
  GWorkCommentResponsesData_work_comment_responses_sticker_image._();

  factory GWorkCommentResponsesData_work_comment_responses_sticker_image(
          [Function(
                  GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder
                      b)
              updates]) =
      _$GWorkCommentResponsesData_work_comment_responses_sticker_image;

  static void _initializeBuilder(
          GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder
              b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<
          GWorkCommentResponsesData_work_comment_responses_sticker_image>
      get serializer =>
          _$gWorkCommentResponsesDataWorkCommentResponsesStickerImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentResponsesData_work_comment_responses_sticker_image
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesData_work_comment_responses_sticker_image?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GWorkCommentResponsesData_work_comment_responses_sticker_image
                .serializer,
            json,
          );
}
