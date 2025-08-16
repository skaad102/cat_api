import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {
  const TextFieldBase(
      {super.key,
      required this.controller,
      required this.onChanged,
      this.iconData});
  final TextEditingController controller;
  final void Function(String) onChanged;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
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
