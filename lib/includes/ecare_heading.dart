// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget ecare() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        MaterialCommunityIcons.medical_bag,
        color: BrandColor.main_color,
        size: 30,
      ),
      const SizedBox(
        width: 5,
      ),
      customHeading("Ecare", 25, null, BrandColor.text_color, FontWeight.w600),
    ],
  );
}
