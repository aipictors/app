// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_user.data.gql.g.dart';

abstract class GViewerUserData
    implements Built<GViewerUserData, GViewerUserDataBuilder> {
  GViewerUserData._();

  factory GViewerUserData([void Function(GViewerUserDataBuilder b) updates]) =
      _$GViewerUserData;

  static void _initializeBuilder(GViewerUserDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerUserData_viewer? get viewer;
  static Serializer<GViewerUserData> get serializer =>
      _$gViewerUserDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerUserData.serializer,
        json,
      );
}

abstract class GViewerUserData_viewer
    implements Built<GViewerUserData_viewer, GViewerUserData_viewerBuilder> {
  GViewerUserData_viewer._();

  factory GViewerUserData_viewer(
          [void Function(GViewerUserData_viewerBuilder b) updates]) =
      _$GViewerUserData_viewer;

  static void _initializeBuilder(GViewerUserData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerUserData_viewer_currentPass? get currentPass;
  GViewerUserData_viewer_user get user;
  static Serializer<GViewerUserData_viewer> get serializer =>
      _$gViewerUserDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerUserData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerUserData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerUserData_viewer.serializer,
        json,
      );
}

abstract class GViewerUserData_viewer_currentPass
    implements
        Built<GViewerUserData_viewer_currentPass,
            GViewerUserData_viewer_currentPassBuilder> {
  GViewerUserData_viewer_currentPass._();

  factory GViewerUserData_viewer_currentPass(
      [void Function(GViewerUserData_viewer_currentPassBuilder b)
          updates]) = _$GViewerUserData_viewer_currentPass;

  static void _initializeBuilder(GViewerUserData_viewer_currentPassBuilder b) =>
      b..G__typename = 'PassNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i2.GPassType get type;
  bool get isDisabled;
  bool get isExpired;
  static Serializer<GViewerUserData_viewer_currentPass> get serializer =>
      _$gViewerUserDataViewerCurrentPassSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerUserData_viewer_currentPass.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerUserData_viewer_currentPass? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerUserData_viewer_currentPass.serializer,
        json,
      );
}

abstract class GViewerUserData_viewer_user
    implements
        Built<GViewerUserData_viewer_user, GViewerUserData_viewer_userBuilder> {
  GViewerUserData_viewer_user._();

  factory GViewerUserData_viewer_user(
          [void Function(GViewerUserData_viewer_userBuilder b) updates]) =
      _$GViewerUserData_viewer_user;

  static void _initializeBuilder(GViewerUserData_viewer_userBuilder b) =>
      b..G__typename = 'UserNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String? get nanoid;
  String? get biography;
  String? get fcmToken;
  String get login;
  String get name;
  int get receivedLikesCount;
  int get receivedViewsCount;
  int get awardsCount;
  int get followersCount;
  String? get iconUrl;
  String? get headerImageUrl;
  static Serializer<GViewerUserData_viewer_user> get serializer =>
      _$gViewerUserDataViewerUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerUserData_viewer_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerUserData_viewer_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerUserData_viewer_user.serializer,
        json,
      );
}
