// ignore_for_file: unused_import, import_of_legacy_library_into_null_safe, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget popularProducts(String image, {double? width}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Container(
                  height: 150,
                  width: width ?? 250,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                  )),
              const Positioned(
                  top: 20,
                  right: 20,
                  child: Icon(
                    AntDesign.heart,
                    color: Colors.black45,
                  )),
              Positioned(
                  top: 20,
                  left: 20,
                  child: Center(
                    child: Container(
                      height: 20,
                      color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: customHeading("5% OFF", 12, null, Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        customHeading("Pineapple", 16),
        Row(
          children: [
            Icon(
              Icons.star,
              size: 15,
              color: Colors.orange[800],
            ),
            const SizedBox(
              width: 5,
            ),
            customText("4.3", null, 14),
            const SizedBox(
              width: 20,
            ),
            customHint("45 ratings"),
          ],
        ),
      ],
    ),
  );
}
