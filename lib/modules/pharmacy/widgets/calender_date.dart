import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

Widget calenderDate(String date) {
  return GestureDetector(
    onTap: () {
      Get.defaultDialog(
          title: "Select date",
          content: SizedBox(
            width: 500,
            child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 5000)),
                lastDate: DateTime.now(),
                onDateChanged: ((value) {})),
          ));
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: BrandColor.main_color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Octicons.calendar,
                size: 15,
                color: BrandColor.main_color,
              ),
              const SizedBox(
                width: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: customHeading(date, 12, null, BrandColor.main_color),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
