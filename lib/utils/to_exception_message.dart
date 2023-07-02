import 'package:aipictors/default.i18n.dart';
import 'package:flutter/services.dart';
import 'package:gql_exec/gql_exec.dart';

String toExceptionMessage(dynamic exception) {
  // ignore: avoid_print
  print(exception);

  // アプリ内のエラー
  if (exception is PlatformException && exception.message != null) {
    return '${exception.message}'.i18n;
  }

  if (exception is GraphQLError) {
    return exception.message;
  }

  return '予期しないエラーが発生しました。'.i18n;
}
