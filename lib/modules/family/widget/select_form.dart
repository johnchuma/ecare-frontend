import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget selectForm(String title, String hint,
    TextEditingController textEditingController, List items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customHeading(title, 15),
      DropdownButtonFormField(
        dropdownColor: Colors.white,
        onChanged: ((value) {
          textEditingController.text = value.toString();
        }),
        enableFeedback: true,
        autofocus: true,
        onTap: () {},
        hint: customHint(hint, null, null, 14),
        style: const TextStyle(fontSize: 13, color: Colors.white),
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: BrandColor.main_color)),
          contentPadding: const EdgeInsets.only(bottom: 10),
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  // ignore: sort_child_properties_last
                  child: customText(item, Colors.black, 13),
                  value: item,
                ))
            .toList(),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
