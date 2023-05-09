import 'package:doctor/modules/doctor/models/time.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

import '../../../includes/custom_heading.dart';

Widget doctorTime(Time time, {bool? active}) {
  return Padding(
    padding: const EdgeInsets.only(right: 0, bottom: 10),
    child: Container(
      width: 75,
      decoration: BoxDecoration(
          color: active == true ? BrandColor.main_color : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: BrandColor.main_color)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Center(
          child: customHeading(
              "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}",
              12,
              null,
              active == true ? Colors.white : BrandColor.main_color),
        ),
      ),
    ),
  );
}
