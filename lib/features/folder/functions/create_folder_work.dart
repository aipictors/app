import 'package:aipictors/features/folder/mutations/__generated__/create_folder_work.data.gql.dart';
import 'package:aipictors/features/folder/mutations/__generated__/create_folder_work.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateFolderWorkReqBuilder>;

Future<GCreateFolderWorkData?> createFolderWork(Builder b) {
  return mutate(GCreateFolderWorkReq(b));
}
