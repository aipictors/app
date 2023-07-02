import 'package:ferry/ferry.dart';

T? toResponseData<T, U>(OperationResponse<T, U> response) {
  if (response.hasErrors) {
    throw response.graphqlErrors!.first;
  }

  return response.data;
}
