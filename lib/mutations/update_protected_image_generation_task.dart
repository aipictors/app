import 'package:aipictors/graphql/mutations/__generated__/update_protected_image_generation_task.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/update_protected_image_generation_task.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateProtectedImageGenerationTaskReqBuilder>;

Future<GUpdateProtectedImageGenerationTaskData?>
    updateProtectedImageGenerationTask(Builder b) {
  return mutate(GUpdateProtectedImageGenerationTaskReq(b));
}
