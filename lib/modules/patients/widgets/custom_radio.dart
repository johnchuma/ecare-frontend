// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget customRadio(String text, String selectedReason, Function function) {
  return RadioListTile(
      value: text,
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      title: customText(text),
      groupValue: selectedReason,
      activeColor: BrandColor.main_color,
      onChanged: (value) {
        function(value);
        // print(value);
      });
}
