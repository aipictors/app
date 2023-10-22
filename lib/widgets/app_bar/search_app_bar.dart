import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchContainer extends HookConsumerWidget {
  SearchContainer({
    Key? key,
    required this.isFilled,
    this.initialText,
    required this.onSubmit,
    required this.onFill,
  })  : _controller = useTextEditingController(text: initialText), //初期値を設定
        super(key: key);

  final bool isFilled;

  final Function(TextEditingController controller) onSubmit;

  final Function(bool value) onFill;

  final String? initialText;

  final TextEditingController _controller;

  void _onSubmit(BuildContext context, String text) {
    if (text == '') {
      _controller.clear();
    }
    final currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    onSubmit(_controller);
  }

  void clear() {
    _controller.clear();
  }

  @override
  Widget build(context, ref) {
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
              decoration: InputDecoration(
                isDense: true,
                hintText: 'キーワード検索'.i18n,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                if (isFilled == false && value.isNotEmpty) {
                  onFill(true);
                }
                if (isFilled == true && value.isEmpty) {
                  onFill(false);
                }
              },
              onSubmitted: (text) {
                if (text.isEmpty) {
                  onFill(false);
                }
                _onSubmit(context, text);
              },
            ),
          ),
        ),
      ],
    );
  }
}
