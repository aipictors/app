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

part 'work_comments.data.gql.g.dart';

abstract class GWorkCommentsData
    implements Built<GWorkCommentsData, GWorkCommentsDataBuilder> {
  GWorkCommentsData._();

  factory GWorkCommentsData([Function(GWorkCommentsDataBuilder b) updates]) =
      _$GWorkCommentsData;

  static void _initializeBuilder(GWorkCommentsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GWorkCommentsData_work? get work;
  static Serializer<GWorkCommentsData> get serializer =>
      _$gWorkCommentsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work
    implements Built<GWorkCommentsData_work, GWorkCommentsData_workBuilder> {
  GWorkCommentsData_work._();

  factory GWorkCommentsData_work(
          [Function(GWorkCommentsData_workBuilder b) updates]) =
      _$GWorkCommentsData_work;

  static void _initializeBuilder(GWorkCommentsData_workBuilder b) =>
      b..G__typename = 'WorkNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GWorkCommentsData_work_comments> get comments;
  static Serializer<GWorkCommentsData_work> get serializer =>
      _$gWorkCommentsDataWorkSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments
    implements
        Built<GWorkCommentsData_work_comments,
            GWorkCommentsData_work_commentsBuilder>,
        _i2.GCommentFields {
  GWorkCommentsData_work_comments._();

  factory GWorkCommentsData_work_comments(
          [Function(GWorkCommentsData_work_commentsBuilder b) updates]) =
      _$GWorkCommentsData_work_comments;

  static void _initializeBuilder(GWorkCommentsData_work_commentsBuilder b) =>
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
  GWorkCommentsData_work_comments_user get user;
  @override
  GWorkCommentsData_work_comments_sticker? get sticker;
  BuiltList<GWorkCommentsData_work_comments_responses> get responses;
  static Serializer<GWorkCommentsData_work_comments> get serializer =>
      _$gWorkCommentsDataWorkCommentsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_user
    implements
        Built<GWorkCommentsData_work_comments_user,
            GWorkCommentsData_work_comments_userBuilder>,
        _i2.GCommentFields_user,
        _i3.GWorkUserFields {
  GWorkCommentsData_work_comments_user._();

  factory GWorkCommentsData_work_comments_user(
          [Function(GWorkCommentsData_work_comments_userBuilder b) updates]) =
      _$GWorkCommentsData_work_comments_user;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_userBuilder b) =>
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
  GWorkCommentsData_work_comments_user_iconImage? get iconImage;
  static Serializer<GWorkCommentsData_work_comments_user> get serializer =>
      _$gWorkCommentsDataWorkCommentsUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_user.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_user_iconImage
    implements
        Built<GWorkCommentsData_work_comments_user_iconImage,
            GWorkCommentsData_work_comments_user_iconImageBuilder>,
        _i2.GCommentFields_user_iconImage,
        _i3.GWorkUserFields_iconImage {
  GWorkCommentsData_work_comments_user_iconImage._();

  factory GWorkCommentsData_work_comments_user_iconImage(
      [Function(GWorkCommentsData_work_comments_user_iconImageBuilder b)
          updates]) = _$GWorkCommentsData_work_comments_user_iconImage;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentsData_work_comments_user_iconImage>
      get serializer => _$gWorkCommentsDataWorkCommentsUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_user_iconImage.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_sticker
    implements
        Built<GWorkCommentsData_work_comments_sticker,
            GWorkCommentsData_work_comments_stickerBuilder>,
        _i2.GCommentFields_sticker {
  GWorkCommentsData_work_comments_sticker._();

  factory GWorkCommentsData_work_comments_sticker(
      [Function(GWorkCommentsData_work_comments_stickerBuilder b)
          updates]) = _$GWorkCommentsData_work_comments_sticker;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_stickerBuilder b) =>
      b..G__typename = 'StickerNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GWorkCommentsData_work_comments_sticker_image? get image;
  static Serializer<GWorkCommentsData_work_comments_sticker> get serializer =>
      _$gWorkCommentsDataWorkCommentsStickerSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_sticker.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_sticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_sticker.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_sticker_image
    implements
        Built<GWorkCommentsData_work_comments_sticker_image,
            GWorkCommentsData_work_comments_sticker_imageBuilder>,
        _i2.GCommentFields_sticker_image {
  GWorkCommentsData_work_comments_sticker_image._();

  factory GWorkCommentsData_work_comments_sticker_image(
      [Function(GWorkCommentsData_work_comments_sticker_imageBuilder b)
          updates]) = _$GWorkCommentsData_work_comments_sticker_image;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_sticker_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentsData_work_comments_sticker_image>
      get serializer => _$gWorkCommentsDataWorkCommentsStickerImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_sticker_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_sticker_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_sticker_image.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_responses
    implements
        Built<GWorkCommentsData_work_comments_responses,
            GWorkCommentsData_work_comments_responsesBuilder>,
        _i2.GCommentFields {
  GWorkCommentsData_work_comments_responses._();

  factory GWorkCommentsData_work_comments_responses(
      [Function(GWorkCommentsData_work_comments_responsesBuilder b)
          updates]) = _$GWorkCommentsData_work_comments_responses;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_responsesBuilder b) =>
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
  GWorkCommentsData_work_comments_responses_user get user;
  @override
  GWorkCommentsData_work_comments_responses_sticker? get sticker;
  static Serializer<GWorkCommentsData_work_comments_responses> get serializer =>
      _$gWorkCommentsDataWorkCommentsResponsesSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_responses.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_responses? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_responses.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_responses_user
    implements
        Built<GWorkCommentsData_work_comments_responses_user,
            GWorkCommentsData_work_comments_responses_userBuilder>,
        _i2.GCommentFields_user,
        _i3.GWorkUserFields {
  GWorkCommentsData_work_comments_responses_user._();

  factory GWorkCommentsData_work_comments_responses_user(
      [Function(GWorkCommentsData_work_comments_responses_userBuilder b)
          updates]) = _$GWorkCommentsData_work_comments_responses_user;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_responses_userBuilder b) =>
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
  GWorkCommentsData_work_comments_responses_user_iconImage? get iconImage;
  static Serializer<GWorkCommentsData_work_comments_responses_user>
      get serializer => _$gWorkCommentsDataWorkCommentsResponsesUserSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_responses_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_responses_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_responses_user.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_responses_user_iconImage
    implements
        Built<GWorkCommentsData_work_comments_responses_user_iconImage,
            GWorkCommentsData_work_comments_responses_user_iconImageBuilder>,
        _i2.GCommentFields_user_iconImage,
        _i3.GWorkUserFields_iconImage {
  GWorkCommentsData_work_comments_responses_user_iconImage._();

  factory GWorkCommentsData_work_comments_responses_user_iconImage(
      [Function(
              GWorkCommentsData_work_comments_responses_user_iconImageBuilder b)
          updates]) = _$GWorkCommentsData_work_comments_responses_user_iconImage;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_responses_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentsData_work_comments_responses_user_iconImage>
      get serializer =>
          _$gWorkCommentsDataWorkCommentsResponsesUserIconImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_responses_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_responses_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_responses_user_iconImage.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_responses_sticker
    implements
        Built<GWorkCommentsData_work_comments_responses_sticker,
            GWorkCommentsData_work_comments_responses_stickerBuilder>,
        _i2.GCommentFields_sticker {
  GWorkCommentsData_work_comments_responses_sticker._();

  factory GWorkCommentsData_work_comments_responses_sticker(
      [Function(GWorkCommentsData_work_comments_responses_stickerBuilder b)
          updates]) = _$GWorkCommentsData_work_comments_responses_sticker;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_responses_stickerBuilder b) =>
      b..G__typename = 'StickerNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GWorkCommentsData_work_comments_responses_sticker_image? get image;
  static Serializer<GWorkCommentsData_work_comments_responses_sticker>
      get serializer =>
          _$gWorkCommentsDataWorkCommentsResponsesStickerSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_responses_sticker.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_responses_sticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_responses_sticker.serializer,
        json,
      );
}

abstract class GWorkCommentsData_work_comments_responses_sticker_image
    implements
        Built<GWorkCommentsData_work_comments_responses_sticker_image,
            GWorkCommentsData_work_comments_responses_sticker_imageBuilder>,
        _i2.GCommentFields_sticker_image {
  GWorkCommentsData_work_comments_responses_sticker_image._();

  factory GWorkCommentsData_work_comments_responses_sticker_image(
      [Function(
              GWorkCommentsData_work_comments_responses_sticker_imageBuilder b)
          updates]) = _$GWorkCommentsData_work_comments_responses_sticker_image;

  static void _initializeBuilder(
          GWorkCommentsData_work_comments_responses_sticker_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkCommentsData_work_comments_responses_sticker_image>
      get serializer =>
          _$gWorkCommentsDataWorkCommentsResponsesStickerImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkCommentsData_work_comments_responses_sticker_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkCommentsData_work_comments_responses_sticker_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkCommentsData_work_comments_responses_sticker_image.serializer,
        json,
      );
}
