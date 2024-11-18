import 'package:flutter/material.dart';

class SimpleInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const SimpleInputField({
    Key? key,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
      ),
    );
  }
}
