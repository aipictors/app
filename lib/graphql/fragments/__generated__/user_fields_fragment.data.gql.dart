// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_fields_fragment.data.gql.g.dart';

abstract class GUserFields {
  String get G__typename;
  String get id;
  String? get biography;
  String get login;
  String get name;
  int get receivedLikesCount;
  int get receivedViewsCount;
  int get awardsCount;
  int get followersCount;
  String? get iconUrl;
  String? get headerImageUrl;
  Map<String, dynamic> toJson();
}

abstract class GUserFieldsData
    implements Built<GUserFieldsData, GUserFieldsDataBuilder>, GUserFields {
  GUserFieldsData._();

  factory GUserFieldsData([void Function(GUserFieldsDataBuilder b) updates]) =
      _$GUserFieldsData;

  static void _initializeBuilder(GUserFieldsDataBuilder b) =>
      b..G__typename = 'UserNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String? get biography;
  @override
  String get login;
  @override
  String get name;
  @override
  int get receivedLikesCount;
  @override
  int get receivedViewsCount;
  @override
  int get awardsCount;
  @override
  int get followersCount;
  @override
  String? get iconUrl;
  @override
  String? get headerImageUrl;
  static Serializer<GUserFieldsData> get serializer =>
      _$gUserFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFieldsData.serializer,
        json,
      );
}
