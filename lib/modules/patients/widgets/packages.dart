import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/doctor/models/package.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget packageWidget(Package package,
    {bool? selectable, Function? function, String? selectedValue}) {
  return Row(
    children: [
      ClipOval(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              package.packageIcon(),
              size: 20,
              color: BrandColor.main_color,
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customHeading(package.name, 15),
          customHint(package.packageDescription())
        ],
      ),
      const Spacer(),
      Column(
        children: [
          customHeading("\$${package.price}", 15, null, BrandColor.main_color),
          customHint("${package.duration}Min")
        ],
      ),
      selectable == null
          ? const SizedBox(
              width: 20,
            )
          : Container(),
      selectable == null
          ? SizedBox(
              height: 10,
              width: 10,
              child: Radio(
                  value: package.name,
                  splashRadius: 10,
                  focusColor: BrandColor.main_color,
                  activeColor: BrandColor.main_color,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    if (function != null) {
                      function();
                    }
                  }),
            )
          : Container()
    ],
  );
}
