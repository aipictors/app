import 'package:ferry/ferry.dart';

T? toResponseData<T, U>(OperationResponse<T, U> response) {
  final graphqlErrors = response.graphqlErrors;

  if (graphqlErrors != null && graphqlErrors.isNotEmpty) {
    throw graphqlErrors.first;
  }

  final linkException = response.linkException;

  if (linkException != null) {
    throw linkException;
  }

  return response.data;
}
