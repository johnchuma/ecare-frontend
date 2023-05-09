import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';

Widget paymentOption(String paymentMethod, String icon) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: BrandColor.in_background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                  height: 25,
                  width: 30,
                  child: CachedNetworkImage(
                    imageUrl: icon,
                    fit: BoxFit.contain,
                  )),
              const SizedBox(
                width: 10,
              ),
              customHeading(paymentMethod, 16),
              const Spacer(),
              customHeading("Connected", 13, null, BrandColor.main_color),
            ],
          ),
        ),
      ),
    ),
  );
}
