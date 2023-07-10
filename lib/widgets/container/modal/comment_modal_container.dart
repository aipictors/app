import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/container/modal_header_container.dart';
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
    final client = ref.watch(clientProvider);

    // https://qiita.com/SoarTec-lab/items/809aed85eb4253de8165
    final controller = useTextEditingController();

    final inputText = useState('');

    if (client.value == null) {
      return const LoadingContainer();
    }

    final req = GWorkCommentsReq((builder) {
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
                  operationRequest: GWorkCommentsReq((builder) {
                    return builder..vars.workId = workId;
                  }),
                  isEmpty: (data) {
                    return data?.work?.comments.isEmpty;
                  },
                  builder: (data) {
                    final comments = data.work!.comments;
                    return SingleChildScrollView(
                      child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return ListTile(
                            title: Text(comment.user.name),
                            subtitle: Text(comment.text),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const Divider(height: 0),
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
                        onChanged: (value) {
                          inputText.value = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton.tonal(
                      onPressed: () {
                        controller.clear();
                        inputText.value = '';
                        client.value?.requestController.add(req);
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
