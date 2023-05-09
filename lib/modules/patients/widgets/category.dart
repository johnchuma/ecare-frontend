// ignore_for_file: unnecessary_import, avoid_unnecessary_containers, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget category({String? image}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Material(
      elevation: 1,
      color: BrandColor.in_background,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: SizedBox(
                      height: 100,
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: CachedNetworkImage(
                            imageUrl: image ?? Photos.pic3,
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHeading("Pumpkin", 17),
              customHint("111 items"),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
