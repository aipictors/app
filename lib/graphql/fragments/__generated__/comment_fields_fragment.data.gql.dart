// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i3;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_fields_fragment.data.gql.g.dart';

abstract class GCommentFields {
  String get G__typename;
  String get id;
  int get createdAt;
  String get text;
  GCommentFields_user? get user;
  GCommentFields_sticker? get sticker;
  Map<String, dynamic> toJson();
}

abstract class GCommentFields_user implements _i1.GWorkUserFields {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  String get login;
  @override
  GCommentFields_user_iconImage? get iconImage;
  bool get isMuted;
  @override
  Map<String, dynamic> toJson();
}

abstract class GCommentFields_user_iconImage
    implements _i1.GWorkUserFields_iconImage {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  @override
  Map<String, dynamic> toJson();
}

abstract class GCommentFields_sticker {
  String get G__typename;
  String get id;
  _i2.GAccessType get accessType;
  String? get imageUrl;
  Map<String, dynamic> toJson();
}

abstract class GCommentFieldsData
    implements
        Built<GCommentFieldsData, GCommentFieldsDataBuilder>,
        GCommentFields {
  GCommentFieldsData._();

  factory GCommentFieldsData(
          [void Function(GCommentFieldsDataBuilder b) updates]) =
      _$GCommentFieldsData;

  static void _initializeBuilder(GCommentFieldsDataBuilder b) =>
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
  GCommentFieldsData_user? get user;
  @override
  GCommentFieldsData_sticker? get sticker;
  static Serializer<GCommentFieldsData> get serializer =>
      _$gCommentFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GCommentFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommentFieldsData? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GCommentFieldsData.serializer,
        json,
      );
}

abstract class GCommentFieldsData_user
    implements
        Built<GCommentFieldsData_user, GCommentFieldsData_userBuilder>,
        GCommentFields_user,
        _i1.GWorkUserFields {
  GCommentFieldsData_user._();

  factory GCommentFieldsData_user(
          [void Function(GCommentFieldsData_userBuilder b) updates]) =
      _$GCommentFieldsData_user;

  static void _initializeBuilder(GCommentFieldsData_userBuilder b) =>
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
  GCommentFieldsData_user_iconImage? get iconImage;
  @override
  bool get isMuted;
  static Serializer<GCommentFieldsData_user> get serializer =>
      _$gCommentFieldsDataUserSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GCommentFieldsData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommentFieldsData_user? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GCommentFieldsData_user.serializer,
        json,
      );
}

abstract class GCommentFieldsData_user_iconImage
    implements
        Built<GCommentFieldsData_user_iconImage,
            GCommentFieldsData_user_iconImageBuilder>,
        GCommentFields_user_iconImage,
        _i1.GWorkUserFields_iconImage {
  GCommentFieldsData_user_iconImage._();

  factory GCommentFieldsData_user_iconImage(
          [void Function(GCommentFieldsData_user_iconImageBuilder b) updates]) =
      _$GCommentFieldsData_user_iconImage;

  static void _initializeBuilder(GCommentFieldsData_user_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GCommentFieldsData_user_iconImage> get serializer =>
      _$gCommentFieldsDataUserIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GCommentFieldsData_user_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommentFieldsData_user_iconImage? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GCommentFieldsData_user_iconImage.serializer,
        json,
      );
}

abstract class GCommentFieldsData_sticker
    implements
        Built<GCommentFieldsData_sticker, GCommentFieldsData_stickerBuilder>,
        GCommentFields_sticker {
  GCommentFieldsData_sticker._();

  factory GCommentFieldsData_sticker(
          [void Function(GCommentFieldsData_stickerBuilder b) updates]) =
      _$GCommentFieldsData_sticker;

  static void _initializeBuilder(GCommentFieldsData_stickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  _i2.GAccessType get accessType;
  @override
  String? get imageUrl;
  static Serializer<GCommentFieldsData_sticker> get serializer =>
      _$gCommentFieldsDataStickerSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GCommentFieldsData_sticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommentFieldsData_sticker? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GCommentFieldsData_sticker.serializer,
        json,
      );
}
