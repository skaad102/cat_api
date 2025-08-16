import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {
  const TextFieldBase(
      {super.key,
      required this.controller,
      required this.onChanged,
      this.focusNode,
      this.iconData});
  final TextEditingController controller;
  final void Function(String) onChanged;
  final IconData? iconData;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: iconData != null ? Icon(iconData) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: 'Enter text',
        ),
        onChanged: onChanged,
      ),
    );
  }
}
