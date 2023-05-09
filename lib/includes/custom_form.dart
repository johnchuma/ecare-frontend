// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget customForm(
    String title, String hint, TextEditingController textEditingController,
    [IconData? iconData,
    TextInputType? textInputType,
    bool? obscureText,
    bool? isPassword,
    Function? toggleView,
    String? password,
    double? radius]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // customHint(title),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.grey[100],
          child: TextFormField(
            controller: textEditingController,
            obscureText: obscureText ?? false,
            cursorColor: Colors.black,
            validator: ((value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${title.toString().toLowerCase()}';
              }
              if (password != null) {
                if (value != password) {
                  return 'Passwords does not match';
                }
              }
              return null;
            }),
            keyboardType: textInputType ?? TextInputType.text,
            style: const TextStyle(
                fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              floatingLabelStyle:
                  const TextStyle(fontSize: 17, color: Colors.black54),
              labelText: title,
              border: InputBorder.none,
              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(radius ?? 30),
              //     borderSide: const BorderSide(color: Colors.black38)),
              // enabledBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(radius ?? 30),
              //     borderSide: const BorderSide(color: Colors.black38)),
              // disabledBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(radius ?? 30),
              //     borderSide: const BorderSide(color: Colors.black)),
              labelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
              focusColor: Colors.black,
              suffixIcon: iconData != null
                  ? Icon(
                      iconData,
                      color: Colors.black38,
                      size: 20,
                    )
                  : isPassword != null
                      ? obscureText == true
                          ? GestureDetector(
                              onTap: () {
                                toggleView!();
                              },
                              child: const Icon(
                                Ionicons.ios_eye_off,
                                color: Colors.black54,
                              ))
                          : GestureDetector(
                              onTap: () {
                                toggleView!();
                              },
                              child: const Icon(
                                Ionicons.ios_eye,
                                color: Colors.black54,
                              ))
                      : const Icon(
                          Foundation.eye,
                          color: Colors.transparent,
                        ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10),
                  borderSide: const BorderSide(color: Colors.black26)),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
