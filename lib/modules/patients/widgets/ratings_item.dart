import 'package:doctor/includes/custom_text.dart';
import 'package:flutter/material.dart';

Widget ratingItem(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customText(text),
      Radio(value: true, groupValue: const [true, false], onChanged: (value) {})
    ],
  );
}
