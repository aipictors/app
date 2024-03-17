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
  GUserFields_iconImage? get iconImage;
  GUserFields_headerImage? get headerImage;
  Map<String, dynamic> toJson();
}

abstract class GUserFields_iconImage {
  String get G__typename;
  String get id;
  String get downloadURL;
  Map<String, dynamic> toJson();
}

abstract class GUserFields_headerImage {
  String get G__typename;
  String get id;
  String get downloadURL;
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
  GUserFieldsData_iconImage? get iconImage;
  @override
  GUserFieldsData_headerImage? get headerImage;
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

abstract class GUserFieldsData_iconImage
    implements
        Built<GUserFieldsData_iconImage, GUserFieldsData_iconImageBuilder>,
        GUserFields_iconImage {
  GUserFieldsData_iconImage._();

  factory GUserFieldsData_iconImage(
          [void Function(GUserFieldsData_iconImageBuilder b) updates]) =
      _$GUserFieldsData_iconImage;

  static void _initializeBuilder(GUserFieldsData_iconImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserFieldsData_iconImage> get serializer =>
      _$gUserFieldsDataIconImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFieldsData_iconImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFieldsData_iconImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFieldsData_iconImage.serializer,
        json,
      );
}

abstract class GUserFieldsData_headerImage
    implements
        Built<GUserFieldsData_headerImage, GUserFieldsData_headerImageBuilder>,
        GUserFields_headerImage {
  GUserFieldsData_headerImage._();

  factory GUserFieldsData_headerImage(
          [void Function(GUserFieldsData_headerImageBuilder b) updates]) =
      _$GUserFieldsData_headerImage;

  static void _initializeBuilder(GUserFieldsData_headerImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserFieldsData_headerImage> get serializer =>
      _$gUserFieldsDataHeaderImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFieldsData_headerImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFieldsData_headerImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFieldsData_headerImage.serializer,
        json,
      );
}
