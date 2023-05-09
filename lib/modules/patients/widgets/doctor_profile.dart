import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:flutter/cupertino.dart';

Widget doctorProfile() {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 85,
          width: 85,
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "https://pebc.ca/wp-content/uploads/2021/03/pharmacist-tech-image-1.png"),
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
              Row(
                children: [
                  customHeading("Dr Christian Backer", 18),
                ],
              ),
              customText("Neurosurgion", null, 12),
              customHint("Kinondoni Dar es salaam"),
            ],
          )
        ],
      ),
    ],
  );
}
