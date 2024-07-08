import 'package:aipictors/graphql/mutations/__generated__/update_rating_image_generation_task.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/update_rating_image_generation_task.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateRatingImageGenerationTaskReqBuilder>;

Future<GUpdateRatingImageGenerationTaskData?> updateRatingImageGenerationTask(
    Builder b) {
  return mutate(GUpdateRatingImageGenerationTaskReq(b));
}
