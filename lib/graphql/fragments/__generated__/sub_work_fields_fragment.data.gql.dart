// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sub_work_fields_fragment.data.gql.g.dart';

abstract class GSubWorkFields {
  String get G__typename;
  String get id;
  String? get imageUrl;
  Map<String, dynamic> toJson();
}

abstract class GSubWorkFieldsData
    implements
        Built<GSubWorkFieldsData, GSubWorkFieldsDataBuilder>,
        GSubWorkFields {
  GSubWorkFieldsData._();

  factory GSubWorkFieldsData(
          [void Function(GSubWorkFieldsDataBuilder b) updates]) =
      _$GSubWorkFieldsData;

  static void _initializeBuilder(GSubWorkFieldsDataBuilder b) =>
      b..G__typename = 'SubWorkNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String? get imageUrl;
  static Serializer<GSubWorkFieldsData> get serializer =>
      _$gSubWorkFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSubWorkFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSubWorkFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSubWorkFieldsData.serializer,
        json,
      );
}
