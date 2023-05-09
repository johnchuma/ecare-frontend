import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget doctorPackage(IconData iconData, String package, String description,
    String price, String time,
    {bool? selectable}) {
  return Row(
    children: [
      ClipOval(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              iconData,
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
        children: [customHeading(package, 15), customHint(description)],
      ),
      const Spacer(),
      Column(
        children: [
          customHeading(price, 15, null, BrandColor.main_color),
          customHint(time)
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
                  value: true,
                  splashRadius: 10,
                  groupValue: const [true, false],
                  onChanged: (value) {}),
            )
          : Container()
    ],
  );
}
