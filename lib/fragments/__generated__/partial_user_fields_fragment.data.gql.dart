// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_user_fields_fragment.data.gql.g.dart';

abstract class GPartialUserFields {
  String get G__typename;
  String get id;
  String get login;
  String get name;
  String? get iconUrl;
  Map<String, dynamic> toJson();
}

abstract class GPartialUserFieldsData
    implements
        Built<GPartialUserFieldsData, GPartialUserFieldsDataBuilder>,
        GPartialUserFields {
  GPartialUserFieldsData._();

  factory GPartialUserFieldsData(
          [void Function(GPartialUserFieldsDataBuilder b) updates]) =
      _$GPartialUserFieldsData;

  static void _initializeBuilder(GPartialUserFieldsDataBuilder b) =>
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
  static Serializer<GPartialUserFieldsData> get serializer =>
      _$gPartialUserFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialUserFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialUserFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialUserFieldsData.serializer,
        json,
      );
}
