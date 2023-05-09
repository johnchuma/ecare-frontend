// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';

Widget homeCategoryItem(String image) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl: image,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: customAvatar(30, Photos.doctor2),
          )
        ],
      ),
      customHeading("Suppliment", 15),
      customHint("100 items")
    ],
  );
}
