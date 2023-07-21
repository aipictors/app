import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/mutations/create_work_comment.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
import 'package:aipictors/widgets/list_tile/work_comment_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentModalContainer extends HookConsumerWidget {
  const CommentModalContainer({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final client = ref.watch(clientProvider);

    // https://qiita.com/SoarTec-lab/items/809aed85eb4253de8165
    final controller = useTextEditingController();

    if (client.value == null) {
      return const LoadingContainer();
    }

    final request = GWorkCommentsReq((builder) {
      return builder..vars.workId = workId;
    });

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          child: Column(
            children: [
              ModalHeaderContainer(
                title: Text(
                  'コメント',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: OperationBuilder(
                  client: client.value!,
                  operationRequest: request,
                  builder: (context, response) {
                    final commentList = response.data?.work?.comments;
                    if (commentList == null) {
                      return const DataNotFoundErrorContainer();
                    }
                    return SingleChildScrollView(
                      child: Column(children: [
                        for (final comment in commentList)
                          Column(
                            children: [
                              WorkCommentListTile(
                                comment: comment,
                                isResponse: false,
                              ),
                              for (final response in comment.responses)
                                WorkCommentListTile(
                                  comment: response,
                                  isResponse: true,
                                ),
                            ],
                          )
                      ]),
                    );
                  },
                ),
              ),
              const Divider(height: 0),
              if (authState.value?.uid == null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8 * 2,
                    vertical: 8,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton.tonal(
                      onPressed: null,
                      child: Text('ログインするとコメントできます'.i18n),
                    ),
                  ),
                ),
              if (authState.value?.uid != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8 * 2,
                    vertical: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'コメントを入力'.i18n,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.tonal(
                        onPressed: () async {
                          try {
                            FocusManager.instance.primaryFocus?.unfocus();
                            final text = controller.text;
                            controller.clear();
                            await createWorkComment((builder) {
                              return builder
                                ..vars.input.workId = workId
                                ..vars.input.text = text;
                            });
                            client.value?.requestController.add(request);
                          } catch (exception) {
                            showErrorSnackBar(context, exception);
                          }
                        },
                        child: const Text('送信'),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
