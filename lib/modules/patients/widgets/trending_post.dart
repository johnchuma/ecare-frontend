import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';

Widget trendingPost() {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          SizedBox(
            height: 180,
            width: 270,
            child: CachedNetworkImage(
              imageUrl: Photos.corona,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 270,
            height: 180,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  customHeading("Learn more about corona virus symptoms", 16,
                      null, Colors.white),
                  Row(
                    children: [
                      customAvatar(30, Photos.doctor2),
                      const SizedBox(
                        width: 10,
                      ),
                      customHeading("Dr amanda", 12, null, Colors.white)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
