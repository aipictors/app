import 'package:aipictors/features/folder/mutations/__generated__/report_folder.data.gql.dart';
import 'package:aipictors/features/folder/mutations/__generated__/report_folder.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GReportFolderReqBuilder>;

Future<GReportFolderData?> reportFolder(Builder b) {
  return mutate(GReportFolderReq(b));
}
