import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';

Widget contactOption(IconData iconData, String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: BrandColor.in_background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 20,
                color: BrandColor.main_color,
              ),
              const SizedBox(
                width: 10,
              ),
              customHeading(title, 15)
            ],
          ),
        ),
      ),
    ),
  );
}
