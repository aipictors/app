// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'daily_themes.data.gql.g.dart';

abstract class GDailyThemesData
    implements Built<GDailyThemesData, GDailyThemesDataBuilder> {
  GDailyThemesData._();

  factory GDailyThemesData([void Function(GDailyThemesDataBuilder b) updates]) =
      _$GDailyThemesData;

  static void _initializeBuilder(GDailyThemesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GDailyThemesData_dailyThemes> get dailyThemes;
  static Serializer<GDailyThemesData> get serializer =>
      _$gDailyThemesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDailyThemesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemesData.serializer,
        json,
      );
}

abstract class GDailyThemesData_dailyThemes
    implements
        Built<GDailyThemesData_dailyThemes,
            GDailyThemesData_dailyThemesBuilder> {
  GDailyThemesData_dailyThemes._();

  factory GDailyThemesData_dailyThemes(
          [void Function(GDailyThemesData_dailyThemesBuilder b) updates]) =
      _$GDailyThemesData_dailyThemes;

  static void _initializeBuilder(GDailyThemesData_dailyThemesBuilder b) =>
      b..G__typename = 'DailyThemeNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  String get dateText;
  int get year;
  int get month;
  int get day;
  int get worksCount;
  GDailyThemesData_dailyThemes_firstWork? get firstWork;
  static Serializer<GDailyThemesData_dailyThemes> get serializer =>
      _$gDailyThemesDataDailyThemesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemesData_dailyThemes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDailyThemesData_dailyThemes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemesData_dailyThemes.serializer,
        json,
      );
}

abstract class GDailyThemesData_dailyThemes_firstWork
    implements
        Built<GDailyThemesData_dailyThemes_firstWork,
            GDailyThemesData_dailyThemes_firstWorkBuilder>,
        _i2.GPartialWorkFields {
  GDailyThemesData_dailyThemes_firstWork._();

  factory GDailyThemesData_dailyThemes_firstWork(
      [void Function(GDailyThemesData_dailyThemes_firstWorkBuilder b)
          updates]) = _$GDailyThemesData_dailyThemes_firstWork;

  static void _initializeBuilder(
          GDailyThemesData_dailyThemes_firstWorkBuilder b) =>
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
  GDailyThemesData_dailyThemes_firstWork_thumbnailImage? get thumbnailImage;
  @override
  double? get thumbnailImagePosition;
  @override
  double get imageAspectRatio;
  static Serializer<GDailyThemesData_dailyThemes_firstWork> get serializer =>
      _$gDailyThemesDataDailyThemesFirstWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemesData_dailyThemes_firstWork.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDailyThemesData_dailyThemes_firstWork? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemesData_dailyThemes_firstWork.serializer,
        json,
      );
}

abstract class GDailyThemesData_dailyThemes_firstWork_thumbnailImage
    implements
        Built<GDailyThemesData_dailyThemes_firstWork_thumbnailImage,
            GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GDailyThemesData_dailyThemes_firstWork_thumbnailImage._();

  factory GDailyThemesData_dailyThemes_firstWork_thumbnailImage(
      [void Function(
              GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder b)
          updates]) = _$GDailyThemesData_dailyThemes_firstWork_thumbnailImage;

  static void _initializeBuilder(
          GDailyThemesData_dailyThemes_firstWork_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GDailyThemesData_dailyThemes_firstWork_thumbnailImage>
      get serializer =>
          _$gDailyThemesDataDailyThemesFirstWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDailyThemesData_dailyThemes_firstWork_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDailyThemesData_dailyThemes_firstWork_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDailyThemesData_dailyThemes_firstWork_thumbnailImage.serializer,
        json,
      );
}
