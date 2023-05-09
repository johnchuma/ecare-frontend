import 'package:doctor/modules/initialization/controller/initialization_controller.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

Widget customSelect(
  String hint,
  List items, {
  double? height,
  double? width,
  Color? color,
  IconData? iconData,
  double? fontSize,
  Color? dropdownItemTextColor,
  InitializationController? find,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      color: color ?? Colors.grey[200],
      height: height ?? 38,
      width: width ?? 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: DropdownButtonFormField(
          dropdownColor: Colors.white,
          onChanged: ((value) {
            find?.changeUserType(value);
            find?.changeDropdownItemTextColor(BrandColor.in_background);
          }),
          enableFeedback: true,
          autofocus: true,
          onTap: () {
            find?.changeDropdownItemTextColor(BrandColor.text_color);
          },
          iconEnabledColor: find?.dropdownItemTextColor.value,
          hint: customText(
            hint,
            BrandColor.text_color,
            fontSize ?? 13,
          ),
          style: const TextStyle(fontSize: 13, color: Colors.white),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 10),
              focusColor: dropdownItemTextColor,
              border: InputBorder.none),
          items: items
              .map((item) => DropdownMenuItem(
                    // ignore: sort_child_properties_last
                    child:
                        customText(item, find?.dropdownItemTextColor.value, 13),
                    value: item,
                  ))
              .toList(),
        ),
      ),
    ),
  );
}
