// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_feed_work_fields_fragment.data.gql.g.dart';

abstract class GPartialFeedWorkFields {
  String get G__typename;
  String get id;
  String get title;
  int get likesCount;
  int get commentsCount;
  int get createdAt;
  double get imageAspectRatio;
  String get imageURL;
  Map<String, dynamic> toJson();
}

abstract class GPartialFeedWorkFieldsData
    implements
        Built<GPartialFeedWorkFieldsData, GPartialFeedWorkFieldsDataBuilder>,
        GPartialFeedWorkFields {
  GPartialFeedWorkFieldsData._();

  factory GPartialFeedWorkFieldsData(
          [void Function(GPartialFeedWorkFieldsDataBuilder b) updates]) =
      _$GPartialFeedWorkFieldsData;

  static void _initializeBuilder(GPartialFeedWorkFieldsDataBuilder b) =>
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
  double get imageAspectRatio;
  @override
  String get imageURL;
  static Serializer<GPartialFeedWorkFieldsData> get serializer =>
      _$gPartialFeedWorkFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialFeedWorkFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialFeedWorkFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialFeedWorkFieldsData.serializer,
        json,
      );
}
