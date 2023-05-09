import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget faqQuestion(String title, String subtitle, bool expand) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customHeading(title, 15),
                  Icon(
                    Icons.arrow_drop_down,
                    color: BrandColor.main_color,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              expand ? Container() : customHint(subtitle)
            ],
          ),
        ),
      ),
    ),
  );
}
