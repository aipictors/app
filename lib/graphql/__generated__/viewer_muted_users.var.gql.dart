// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_muted_users.var.gql.g.dart';

abstract class GViewerMutedUsersVars
    implements Built<GViewerMutedUsersVars, GViewerMutedUsersVarsBuilder> {
  GViewerMutedUsersVars._();

  factory GViewerMutedUsersVars(
          [Function(GViewerMutedUsersVarsBuilder b) updates]) =
      _$GViewerMutedUsersVars;

  int get offset;
  int get limit;
  static Serializer<GViewerMutedUsersVars> get serializer =>
      _$gViewerMutedUsersVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerMutedUsersVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerMutedUsersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerMutedUsersVars.serializer,
        json,
      );
}
