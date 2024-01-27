// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'announcements.data.gql.g.dart';

abstract class GAnnouncementsData
    implements Built<GAnnouncementsData, GAnnouncementsDataBuilder> {
  GAnnouncementsData._();

  factory GAnnouncementsData([Function(GAnnouncementsDataBuilder b) updates]) =
      _$GAnnouncementsData;

  static void _initializeBuilder(GAnnouncementsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAnnouncementsData_announcements> get announcements;
  static Serializer<GAnnouncementsData> get serializer =>
      _$gAnnouncementsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAnnouncementsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAnnouncementsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAnnouncementsData.serializer,
        json,
      );
}

abstract class GAnnouncementsData_announcements
    implements
        Built<GAnnouncementsData_announcements,
            GAnnouncementsData_announcementsBuilder> {
  GAnnouncementsData_announcements._();

  factory GAnnouncementsData_announcements(
          [Function(GAnnouncementsData_announcementsBuilder b) updates]) =
      _$GAnnouncementsData_announcements;

  static void _initializeBuilder(GAnnouncementsData_announcementsBuilder b) =>
      b..G__typename = 'AnnouncementNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  String get body;
  int get publishedAt;
  static Serializer<GAnnouncementsData_announcements> get serializer =>
      _$gAnnouncementsDataAnnouncementsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAnnouncementsData_announcements.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAnnouncementsData_announcements? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAnnouncementsData_announcements.serializer,
        json,
      );
}
