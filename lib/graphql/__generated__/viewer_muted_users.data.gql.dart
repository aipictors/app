// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_muted_users.data.gql.g.dart';

abstract class GViewerMutedUsersData
    implements Built<GViewerMutedUsersData, GViewerMutedUsersDataBuilder> {
  GViewerMutedUsersData._();

  factory GViewerMutedUsersData(
          [void Function(GViewerMutedUsersDataBuilder b) updates]) =
      _$GViewerMutedUsersData;

  static void _initializeBuilder(GViewerMutedUsersDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerMutedUsersData_viewer? get viewer;
  static Serializer<GViewerMutedUsersData> get serializer =>
      _$gViewerMutedUsersDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedUsersData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerMutedUsersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedUsersData.serializer,
        json,
      );
}

abstract class GViewerMutedUsersData_viewer
    implements
        Built<GViewerMutedUsersData_viewer,
            GViewerMutedUsersData_viewerBuilder> {
  GViewerMutedUsersData_viewer._();

  factory GViewerMutedUsersData_viewer(
          [void Function(GViewerMutedUsersData_viewerBuilder b) updates]) =
      _$GViewerMutedUsersData_viewer;

  static void _initializeBuilder(GViewerMutedUsersData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerMutedUsersData_viewer_mutedUsers> get mutedUsers;
  static Serializer<GViewerMutedUsersData_viewer> get serializer =>
      _$gViewerMutedUsersDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedUsersData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerMutedUsersData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedUsersData_viewer.serializer,
        json,
      );
}

abstract class GViewerMutedUsersData_viewer_mutedUsers
    implements
        Built<GViewerMutedUsersData_viewer_mutedUsers,
            GViewerMutedUsersData_viewer_mutedUsersBuilder>,
        _i2.GPartialUserFields {
  GViewerMutedUsersData_viewer_mutedUsers._();

  factory GViewerMutedUsersData_viewer_mutedUsers(
      [void Function(GViewerMutedUsersData_viewer_mutedUsersBuilder b)
          updates]) = _$GViewerMutedUsersData_viewer_mutedUsers;

  static void _initializeBuilder(
          GViewerMutedUsersData_viewer_mutedUsersBuilder b) =>
      b..G__typename = 'UserNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get login;
  @override
  String get name;
  @override
  String? get iconUrl;
  static Serializer<GViewerMutedUsersData_viewer_mutedUsers> get serializer =>
      _$gViewerMutedUsersDataViewerMutedUsersSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedUsersData_viewer_mutedUsers.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerMutedUsersData_viewer_mutedUsers? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedUsersData_viewer_mutedUsers.serializer,
        json,
      );
}
