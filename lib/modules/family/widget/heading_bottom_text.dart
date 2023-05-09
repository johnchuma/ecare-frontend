import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';

Widget headingBottomText(String heading, String description, {Color? color}) {
  return Column(
    children: [
      customHeading(heading, 18),
      customText(description, color ?? BrandColor.main_color, 13)
    ],
  );
}
