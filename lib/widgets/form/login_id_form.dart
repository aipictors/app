import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginIDForm extends StatefulWidget {
  const LoginIDForm({
    super.key,
    required this.readOnly,
    required this.onValidate,
    required this.decoration,
  });

  final bool readOnly;
  final Function(bool valid, String id) onValidate;
  final InputDecoration decoration;

  @override
  State<LoginIDForm> createState() => _LoginIDFormState();
}

class _LoginIDFormState extends State<LoginIDForm> {
  @override
  Widget build(BuildContext context) {
    final regExp = RegExp(r'^[a-zA-Z0-9.@_-]+$');

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
        if (!value!.contains(RegExp(r'[a-zA-Z]'))) {
          widget.onValidate(false, value);
          return 'IDにはアルファベットが含まれている必要があります'.i18n;
        }
        widget.onValidate(true, value);
        return null;
      },
    ));
  }
}
