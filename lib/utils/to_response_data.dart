import 'package:ferry/ferry.dart';

T? toResponseData<T, U>(OperationResponse<T, U> response) {
  if (response.hasErrors && response.graphqlErrors != null) {
    throw response.graphqlErrors!.first;
  }

  if (response.hasErrors && response.linkException != null) {
    throw response.linkException!;
  }

  return response.data;
}
