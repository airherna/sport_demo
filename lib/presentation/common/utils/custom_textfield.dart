import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
  final TextEditingController textEditingController;
  final String hint;
  final String suffixText;
  final TextInputType keyboardType;

  const CustomTextField(
      this.textEditingController, this.hint, this.suffixText, this.keyboardType,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow, width: 2)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          suffixText: suffixText,
          suffixStyle: const TextStyle(color: Colors.white)),
    );
  }
}
