// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_work_like.data.gql.g.dart';

abstract class GCreateWorkLikeData
    implements Built<GCreateWorkLikeData, GCreateWorkLikeDataBuilder> {
  GCreateWorkLikeData._();

  factory GCreateWorkLikeData(
          [void Function(GCreateWorkLikeDataBuilder b) updates]) =
      _$GCreateWorkLikeData;

  static void _initializeBuilder(GCreateWorkLikeDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateWorkLikeData_createWorkLike get createWorkLike;
  static Serializer<GCreateWorkLikeData> get serializer =>
      _$gCreateWorkLikeDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkLikeData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkLikeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkLikeData.serializer,
        json,
      );
}

abstract class GCreateWorkLikeData_createWorkLike
    implements
        Built<GCreateWorkLikeData_createWorkLike,
            GCreateWorkLikeData_createWorkLikeBuilder> {
  GCreateWorkLikeData_createWorkLike._();

  factory GCreateWorkLikeData_createWorkLike(
      [void Function(GCreateWorkLikeData_createWorkLikeBuilder b)
          updates]) = _$GCreateWorkLikeData_createWorkLike;

  static void _initializeBuilder(GCreateWorkLikeData_createWorkLikeBuilder b) =>
      b..G__typename = 'WorkNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  int get likesCount;
  bool get isLiked;
  static Serializer<GCreateWorkLikeData_createWorkLike> get serializer =>
      _$gCreateWorkLikeDataCreateWorkLikeSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWorkLikeData_createWorkLike.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkLikeData_createWorkLike? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWorkLikeData_createWorkLike.serializer,
        json,
      );
}
