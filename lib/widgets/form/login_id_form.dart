import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginIDForm extends StatefulWidget {
  const LoginIDForm({
    Key? key,
    required this.readOnly,
    required this.onChanged,
    required this.onValidate,
    required this.decoration,
  }) : super(key: key);

  final bool readOnly;
  final Function(String value) onChanged;
  final Function(bool valid) onValidate;
  final InputDecoration decoration;

  @override
  State<LoginIDForm> createState() => _LoginIDFormState();
}

class _LoginIDFormState extends State<LoginIDForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: TextFormField(
      readOnly: widget.readOnly,
      keyboardType: TextInputType.emailAddress,
      decoration: widget.decoration,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[0-9a-z@_]'),
        ),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        widget.onChanged(value);
      },
      validator: (value) {
        if (value!.length < 4 || 14 < value.length) {
          widget.onValidate(false);
          return 'IDは4文字以上14文字以下である必要があります'.i18n;
        }
        if (!value.contains(RegExp(r'[a-z]'))) {
          widget.onValidate(false);
          return 'IDにはアルファベットが含まれている必要があります'.i18n;
        }
        widget.onValidate(true);
        return null;
      },
    ));
  }
}
