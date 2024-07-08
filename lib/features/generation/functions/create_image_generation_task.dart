import 'package:aipictors/graphql/mutations/__generated__/create_image_generation_task.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_image_generation_task.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateImageGenerationTaskReqBuilder>;

Future<GCreateImageGenerationTaskData?> createImageGenerationTask(Builder b) {
  return mutate(GCreateImageGenerationTaskReq(b));
}
