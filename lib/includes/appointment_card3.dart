import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_pill.dart';
import 'package:doctor/includes/cutome_text2.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';

Widget appointmentCard3() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              customAvatar(60, Photos.doctor1),
              customHint('Patient name'),
              customText2('Karim khan')
            ],
          ),
          customPill("Start", BrandColor.main_color, Colors.white, true),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customPill(
                  " \$26", Colors.grey[200]!, BrandColor.main_color, false,
                  vertical: 10, horizontal: 30),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  customHint('Appointment ID'),
                  customText2('2389138')
                ],
              ),
            ],
          )
        ],
      ),
      Container(
        color: Colors.green.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customHint('Appointment Date'),
                  const Text(
                    "Starting in 35 mins",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  )
                ],
              ),
              customPill(
                  'REQUEST PENDING', BrandColor.main_color, Colors.white, false,
                  textSize: 11)
            ],
          ),
        ),
      )
    ],
  );
}
