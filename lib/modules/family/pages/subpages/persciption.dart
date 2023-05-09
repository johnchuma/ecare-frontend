import 'package:doctor/includes/calender_item.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_pill.dart';
import 'package:doctor/includes/cutome_text2.dart';
import 'package:doctor/modules/family/pages/client_information.dart';
import 'package:doctor/modules/family/widget/appointment.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget pescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: BrandColor.main_color,
          ),
          const SizedBox(
            width: 20,
          ),
          customText2('March 2022', FontWeight.w800),
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: BrandColor.main_color,
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              customHint('Apr 08, 2022'),
              customText2("Today", FontWeight.w800)
            ],
          ),
          GestureDetector(
              onTap: () {
                Get.to(() => const ClientInformation());
              },
              child:
                  customPill("Add", BrandColor.main_color, Colors.white, true)),
        ],
      ),
      SizedBox(
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            {'date': '12', 'name': 'Mon'},
            {'date': '13', 'name': 'Mon'},
            {'date': '14', 'name': 'Mon'},
            {'date': '15', 'name': 'Mon'},
            {'date': '16', 'name': 'Mon'},
            {'date': '17', 'name': 'Mon'},
            {'date': '18', 'name': 'Mon'},
            {'date': '19', 'name': 'Mon'},
            {'date': '20', 'name': 'Mon'},
            {'date': '21', 'name': 'Mon'},
          ]
              .map((opt) => calenderItem(opt['date']!, opt['name']!,
                  opt['date'] == '16' ? true : false))
              .toList(),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          customHint("13:00"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customHeading("Cardiologist", 16),
                          customHint("Dan Johnson")
                        ],
                      ),
                      customAvatar(30, Photos.pic1)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      customHeading("Reminder", 18),
      customHint("Don't forget schedule for upcoming appointment"),
      const SizedBox(
        height: 10,
      ),
      appointment(),
    ],
  );
}
