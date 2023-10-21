import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginIDForm extends StatefulWidget {
  const LoginIDForm({
    Key? key,
    required this.readOnly,
    required this.onValidate,
    required this.decoration,
  }) : super(key: key);

  final bool readOnly;
  final Function(bool valid, String id) onValidate;
  final InputDecoration decoration;

  @override
  State<LoginIDForm> createState() => _LoginIDFormState();
}

class _LoginIDFormState extends State<LoginIDForm> {
  @override
  Widget build(BuildContext context) {
    final regExp = RegExp(r'^[a-zA-Z0-9.@_]+$');

    return Form(
        child: TextFormField(
      readOnly: widget.readOnly,
      keyboardType: TextInputType.emailAddress,
      decoration: widget.decoration,
      inputFormatters: [
        FilteringTextInputFormatter.allow(regExp),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.length < 4 || 254 < value.length) {
          widget.onValidate(false, value);
          return 'IDは4文字以上254文字以下である必要があります'.i18n;
        }
        if (!value.contains(RegExp(r'[a-z]'))) {
          widget.onValidate(false, value);
          return 'IDにはアルファベットが含まれている必要があります'.i18n;
        }
        widget.onValidate(true, value);
        return null;
      },
    ));
  }
}
