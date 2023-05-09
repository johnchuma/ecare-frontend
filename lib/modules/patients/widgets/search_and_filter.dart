// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/modules/shop/filter_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

Widget searchAndFilter(TextEditingController textEditingController,
    {Function? function}) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: 40,
          child: TextFormField(
            onChanged: (value) {
              if (function != null) {
                function();
              }
            },
            controller: textEditingController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.all(0),
                hintText: "Search",
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: (() {
          Get.to(() => const FilterPage());
        }),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black12)),
          child: Center(
              child: Icon(
            MaterialCommunityIcons.filter,
            color: BrandColor.text_color,
          )),
        ),
      )
    ],
  );
}
