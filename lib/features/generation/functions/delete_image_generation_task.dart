import 'package:aipictors/features/generation/mutations/__generated__/delete_image_generation_task.data.gql.dart';
import 'package:aipictors/features/generation/mutations/__generated__/delete_image_generation_task.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GDeleteImageGenerationTaskReqBuilder>;

Future<GDeleteImageGenerationTaskData?> deleteImageGenerationTask(Builder b) {
  return mutate(GDeleteImageGenerationTaskReq(b));
}
