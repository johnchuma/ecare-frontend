import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget familyForm(String title, String hint,
    {TextEditingController? textEditingController,
    bool? hideText,
    bool? validatePhoneNumber,
    bool? comparePassword,
    int? maxLines,
    Function? onTap,
    String? password,
    TextInputType? textInputType}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customHeading(title, 15),
      TextFormField(
        maxLines: maxLines ?? 1,
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        minLines: 1,
        validator: ((value) {
          if (comparePassword == true) {
            if (password != textEditingController!.text) {
              return 'Passwords does not match';
            }
          }
          if (validatePhoneNumber == true) {
            if (textEditingController!.text.length < 10 ||
                textEditingController.text.length > 13) {
              return 'Invalid phone number';
            }
          }
          if (value == null || value.isEmpty) {
            return 'Please enter ${title.toString().toLowerCase()}';
          }

          return null;
        }),
        obscureText: hideText ?? false,
        controller: textEditingController ?? TextEditingController(),
        keyboardType: textInputType ?? TextInputType.text,
        cursorColor: BrandColor.main_color,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: BrandColor.main_color)),
            hintStyle: const TextStyle(fontSize: 13),
            hintText: hint),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
