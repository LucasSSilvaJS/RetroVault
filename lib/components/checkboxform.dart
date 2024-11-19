import 'package:flutter/material.dart';

class CheckboxForm extends StatefulWidget {
  @override
  _CheckboxFormState createState() => _CheckboxFormState();
}

class _CheckboxFormState extends State<CheckboxForm> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? newValue) {
        setState(() {
          isChecked = newValue ?? false;
        });
      },
    );
  }
}