import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:flutter/cupertino.dart';

Widget summary(String left, String right) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [customHint(left), customText(right)],
  );
}
