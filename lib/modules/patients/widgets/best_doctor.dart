import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget bestDoctor(String profile, String subProfile) {
  return Padding(
    padding: const EdgeInsets.only(right: 7),
    child: SizedBox(
      height: 140,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 130,
              // ignore: sort_child_properties_last
              child: CachedNetworkImage(
                imageUrl: profile,
                fit: BoxFit.cover,
              ),
              color: Colors.black,
              width: 80,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                    height: 30,
                    width: 30,
                    // ignore: sort_child_properties_last
                    child: CachedNetworkImage(
                      imageUrl: subProfile,
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
