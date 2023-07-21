// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_award_notification_fields_fragment.data.gql.g.dart';

abstract class GWorkAwardNotificationFields {
  String get G__typename;
  String get id;
  int get createdAt;
  String? get message;
  GWorkAwardNotificationFields_work? get work;
  Map<String, dynamic> toJson();
}

abstract class GWorkAwardNotificationFields_work
    implements _i1.GPartialWorkFields {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get createdAt;
  @override
  GWorkAwardNotificationFields_work_thumbnailImage? get thumbnailImage;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkAwardNotificationFields_work_thumbnailImage
    implements _i1.GPartialWorkFields_thumbnailImage {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  @override
  Map<String, dynamic> toJson();
}

abstract class GWorkAwardNotificationFieldsData
    implements
        Built<GWorkAwardNotificationFieldsData,
            GWorkAwardNotificationFieldsDataBuilder>,
        GWorkAwardNotificationFields {
  GWorkAwardNotificationFieldsData._();

  factory GWorkAwardNotificationFieldsData(
          [Function(GWorkAwardNotificationFieldsDataBuilder b) updates]) =
      _$GWorkAwardNotificationFieldsData;

  static void _initializeBuilder(GWorkAwardNotificationFieldsDataBuilder b) =>
      b..G__typename = 'WorkAwardNotificationNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  int get createdAt;
  @override
  String? get message;
  @override
  GWorkAwardNotificationFieldsData_work? get work;
  static Serializer<GWorkAwardNotificationFieldsData> get serializer =>
      _$gWorkAwardNotificationFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GWorkAwardNotificationFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkAwardNotificationFieldsData? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GWorkAwardNotificationFieldsData.serializer,
        json,
      );
}

abstract class GWorkAwardNotificationFieldsData_work
    implements
        Built<GWorkAwardNotificationFieldsData_work,
            GWorkAwardNotificationFieldsData_workBuilder>,
        GWorkAwardNotificationFields_work,
        _i1.GPartialWorkFields {
  GWorkAwardNotificationFieldsData_work._();

  factory GWorkAwardNotificationFieldsData_work(
          [Function(GWorkAwardNotificationFieldsData_workBuilder b) updates]) =
      _$GWorkAwardNotificationFieldsData_work;

  static void _initializeBuilder(
          GWorkAwardNotificationFieldsData_workBuilder b) =>
      b..G__typename = 'WorkNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get createdAt;
  @override
  GWorkAwardNotificationFieldsData_work_thumbnailImage? get thumbnailImage;
  static Serializer<GWorkAwardNotificationFieldsData_work> get serializer =>
      _$gWorkAwardNotificationFieldsDataWorkSerializer;
  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GWorkAwardNotificationFieldsData_work.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkAwardNotificationFieldsData_work? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GWorkAwardNotificationFieldsData_work.serializer,
        json,
      );
}

abstract class GWorkAwardNotificationFieldsData_work_thumbnailImage
    implements
        Built<GWorkAwardNotificationFieldsData_work_thumbnailImage,
            GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder>,
        GWorkAwardNotificationFields_work_thumbnailImage,
        _i1.GPartialWorkFields_thumbnailImage {
  GWorkAwardNotificationFieldsData_work_thumbnailImage._();

  factory GWorkAwardNotificationFieldsData_work_thumbnailImage(
      [Function(GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder b)
          updates]) = _$GWorkAwardNotificationFieldsData_work_thumbnailImage;

  static void _initializeBuilder(
          GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkAwardNotificationFieldsData_work_thumbnailImage>
      get serializer =>
          _$gWorkAwardNotificationFieldsDataWorkThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GWorkAwardNotificationFieldsData_work_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkAwardNotificationFieldsData_work_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GWorkAwardNotificationFieldsData_work_thumbnailImage.serializer,
        json,
      );
}
