import 'package:aipictors/graphql/mutations/__generated__/delete_image_generation_task.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/delete_image_generation_task.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GDeleteImageGenerationTaskReqBuilder>;

Future<GDeleteImageGenerationTaskData?> DeleteImageGenerationTask(Builder b) {
  return mutate(GDeleteImageGenerationTaskReq(b));
}
