import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:flutter/material.dart';

Widget payment(String image, String title, {bool? selectable}) {
  return Row(
    children: [
      ClipOval(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 30,
              width: 30,
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
              ),
            )),
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customHeading(title, 15),
        ],
      ),
      const Spacer(),
      selectable == null
          ? const SizedBox(
              width: 20,
            )
          : Container(),
      selectable == null
          ? SizedBox(
              height: 10,
              width: 10,
              child: Radio(
                  value: true,
                  splashRadius: 10,
                  groupValue: const [true, false],
                  onChanged: (value) {}),
            )
          : Container()
    ],
  );
}
