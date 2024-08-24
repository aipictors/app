// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_user_fields_fragment.data.gql.g.dart';

abstract class GWorkUserFields {
  String get G__typename;
  String get id;
  String get name;
  String get login;
  GWorkUserFields_iconImage? get iconImage;
  Map<String, dynamic> toJson();
}

abstract class GWorkUserFields_iconImage {
  String get G__typename;
  String get id;
  String get downloadURL;
  Map<String, dynamic> toJson();
}

abstract class GWorkUserFieldsData
    implements
        Built<GWorkUserFieldsData, GWorkUserFieldsDataBuilder>,
        GWorkUserFields {
  GWorkUserFieldsData._();

  factory GWorkUserFieldsData(
          [void Function(GWorkUserFieldsDataBuilder b) updates]) =
      _$GWorkUserFieldsData;

  static void _initializeBuilder(GWorkUserFieldsDataBuilder b) =>
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
  GWorkUserFieldsData_iconImage? get iconImage;
  static Serializer<GWorkUserFieldsData> get serializer =>
      _$gWorkUserFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkUserFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkUserFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkUserFieldsData.serializer,
        json,
      );
}

abstract class GWorkUserFieldsData_iconImage
    implements
        Built<GWorkUserFieldsData_iconImage,
            GWorkUserFieldsData_iconImageBuilder>,
        GWorkUserFields_iconImage {
  GWorkUserFieldsData_iconImage._();

  factory GWorkUserFieldsData_iconImage(
          [void Function(GWorkUserFieldsData_iconImageBuilder b) updates]) =
      _$GWorkUserFieldsData_iconImage;

  static void _initializeBuilder(GWorkUserFieldsData_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorkUserFieldsData_iconImage> get serializer =>
      _$gWorkUserFieldsDataIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkUserFieldsData_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkUserFieldsData_iconImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkUserFieldsData_iconImage.serializer,
        json,
      );
}
