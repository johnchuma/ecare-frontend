import 'package:doctor/includes/custom_text.dart';
import 'package:flutter/material.dart';

Widget customSwitch(String text, bool status) {
  return Row(
    children: [
      customText(
        text,
        null,
        16,
      ),
      const Spacer(),
      Switch(value: status, onChanged: (value) {})
    ],
  );
}
