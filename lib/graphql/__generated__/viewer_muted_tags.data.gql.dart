// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_muted_tags.data.gql.g.dart';

abstract class GViewerMutedTagsData
    implements Built<GViewerMutedTagsData, GViewerMutedTagsDataBuilder> {
  GViewerMutedTagsData._();

  factory GViewerMutedTagsData(
          [void Function(GViewerMutedTagsDataBuilder b) updates]) =
      _$GViewerMutedTagsData;

  static void _initializeBuilder(GViewerMutedTagsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerMutedTagsData_viewer? get viewer;
  static Serializer<GViewerMutedTagsData> get serializer =>
      _$gViewerMutedTagsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedTagsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerMutedTagsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedTagsData.serializer,
        json,
      );
}

abstract class GViewerMutedTagsData_viewer
    implements
        Built<GViewerMutedTagsData_viewer, GViewerMutedTagsData_viewerBuilder> {
  GViewerMutedTagsData_viewer._();

  factory GViewerMutedTagsData_viewer(
          [void Function(GViewerMutedTagsData_viewerBuilder b) updates]) =
      _$GViewerMutedTagsData_viewer;

  static void _initializeBuilder(GViewerMutedTagsData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerMutedTagsData_viewer_user get user;
  BuiltList<GViewerMutedTagsData_viewer_mutedTags> get mutedTags;
  static Serializer<GViewerMutedTagsData_viewer> get serializer =>
      _$gViewerMutedTagsDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedTagsData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerMutedTagsData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedTagsData_viewer.serializer,
        json,
      );
}

abstract class GViewerMutedTagsData_viewer_user
    implements
        Built<GViewerMutedTagsData_viewer_user,
            GViewerMutedTagsData_viewer_userBuilder> {
  GViewerMutedTagsData_viewer_user._();

  factory GViewerMutedTagsData_viewer_user(
          [void Function(GViewerMutedTagsData_viewer_userBuilder b) updates]) =
      _$GViewerMutedTagsData_viewer_user;

  static void _initializeBuilder(GViewerMutedTagsData_viewer_userBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GViewerMutedTagsData_viewer_user> get serializer =>
      _$gViewerMutedTagsDataViewerUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedTagsData_viewer_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerMutedTagsData_viewer_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedTagsData_viewer_user.serializer,
        json,
      );
}

abstract class GViewerMutedTagsData_viewer_mutedTags
    implements
        Built<GViewerMutedTagsData_viewer_mutedTags,
            GViewerMutedTagsData_viewer_mutedTagsBuilder> {
  GViewerMutedTagsData_viewer_mutedTags._();

  factory GViewerMutedTagsData_viewer_mutedTags(
      [void Function(GViewerMutedTagsData_viewer_mutedTagsBuilder b)
          updates]) = _$GViewerMutedTagsData_viewer_mutedTags;

  static void _initializeBuilder(
          GViewerMutedTagsData_viewer_mutedTagsBuilder b) =>
      b..G__typename = 'MutedTagNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GViewerMutedTagsData_viewer_mutedTags> get serializer =>
      _$gViewerMutedTagsDataViewerMutedTagsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedTagsData_viewer_mutedTags.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerMutedTagsData_viewer_mutedTags? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedTagsData_viewer_mutedTags.serializer,
        json,
      );
}
