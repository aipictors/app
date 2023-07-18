import 'package:aipictors/graphql/mutations/__generated__/update_folder.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/update_folder.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateFolderReqBuilder>;

Future<GUpdateFolderData?> updateFolder(Builder b) {
  return mutate(GUpdateFolderReq(b));
}
