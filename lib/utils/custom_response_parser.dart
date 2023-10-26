import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';

/// GraphQLのレスポンスのパーサー
/// エラーのレスポンスに含まれるdataをパースしようとしてエラーが発生するので阻止する
class CustomResponseParser extends ResponseParser {
  const CustomResponseParser();

  @override
  Response parseResponse(Map<String, dynamic> body) {
    final bodyErrors = body['errors'] as List?;
    final hasErrors = bodyErrors != null && bodyErrors.isNotEmpty;
    final errors = bodyErrors?.map((error) {
      return parseError(error as Map<String, dynamic>);
    });
    // エラーが含まれる場合はnullで初期化する
    final data = hasErrors ? null : body['data'] as Map<String, dynamic>?;
    return Response(
      errors: errors?.toList(),
      data: data,
      response: body,
      context: const Context().withEntry(
        ResponseExtensions(body['extensions']),
      ),
    );
  }
}
