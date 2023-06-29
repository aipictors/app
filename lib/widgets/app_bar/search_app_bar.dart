import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class SearchContainer extends HookConsumerWidget {
  SearchContainer({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  final Function(String search) onSubmit;

  final _controller = useTextEditingController();

  void _onSubmit(BuildContext context, String text) {
    if (text == '') {
      _controller.clear();
    }
    onSubmit(text);
    final currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(context, ref) {
    final isFilled = useState(false);

    return Row(
      children: [
        Flexible(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, right: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).hoverColor,
            ),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'キーワード検索',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                if (isFilled.value == false && value.isNotEmpty) {
                  isFilled.value = true;
                }
                if (isFilled.value == true && value.isEmpty) {
                  isFilled.value = false;
                }
              },
              onSubmitted: (text) {
                if (text.isEmpty) {
                  isFilled.value = false;
                }
                _onSubmit(context, text);
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (isFilled.value == true)
          IconButton(
            icon: const Icon(Icons.clear_rounded),
            onPressed: () {
              isFilled.value = false;
              _onSubmit(context, '');
            },
          ),
        if (isFilled.value == false)
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {
              isFilled.value = false;
              _onSubmit(context, '');
            },
          ),
      ],
    );
  }
}
