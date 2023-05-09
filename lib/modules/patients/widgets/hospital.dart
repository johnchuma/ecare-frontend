// ignore_for_file: unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget hospital(String image) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 10,
    ),
    child: Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ClipOval(
                    child: SizedBox(
                      height: 85,
                      width: 85,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover, imageUrl: image),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customHeading("Infinity Pharmacy", 16, null,
                            BrandColor.text_color),
                        Row(
                          children: [
                            const Icon(
                              MaterialCommunityIcons.map_marker,
                              color: Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            customHint("Kinondoni Dar es salaam"),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                const Icon(MaterialCommunityIcons.dots_vertical)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: customText(
                      "Ullamco aute Lorem quis occaecat ullamco officia aliqua. Sint laboris ",
                      null,
                      12),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                  child: Icon(
                    AntDesign.message1,
                    size: 17,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                customButton('Follow', BrandColor.main_color, null, 35, 13)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    customHeading("25", 20),
                    customText('Posts', null, 13)
                  ],
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.black,
                ),
                Column(
                  children: [
                    customHeading("25", 20),
                    customText('Articles', null, 13)
                  ],
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.black,
                ),
                Column(
                  children: [
                    customHeading("25", 20),
                    customText('Followers', null, 13)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ),
  );
}
