import 'package:aipictors/features/folder/mutations/__generated__/delete_folder.data.gql.dart';
import 'package:aipictors/features/folder/mutations/__generated__/delete_folder.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GDeleteFolderReqBuilder>;

Future<GDeleteFolderData?> deleteFolder(Builder b) {
  return mutate(GDeleteFolderReq(b));
}
