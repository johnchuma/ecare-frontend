// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/appointment/create_appointment.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/pages/reviews_page.dart';
import 'package:doctor/modules/patients/widgets/doctor_profile.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class SpecialistPage extends StatelessWidget {
  User doctor;
  SpecialistPage(this.doctor, {super.key});
  @override
  Widget build(BuildContext context) {
    var images = [
      {"image": 'https://picsum.photos/300', "name": "Jackson"},
      {"image": 'https://picsum.photos/302', "name": "Meland"},
      {"image": 'https://picsum.photos/303', "name": "Jackson"},
      {"image": 'https://picsum.photos/307', "name": "Meland"},
      {"image": 'https://picsum.photos/309', "name": "Jackson"},
      {"image": 'https://picsum.photos/310', "name": "Meland"},
      {"image": 'https://picsum.photos/320', "name": "Jackson"},
      {"image": 'https://picsum.photos/312', "name": "Meland"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      children: [
                        doctorProfile(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 17,
                                  color: BrandColor.main_color,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                customHeading('Monday, Dec 23', 13)
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Row(
                              children: [
                                Icon(
                                  MaterialCommunityIcons.clock,
                                  size: 17,
                                  color: BrandColor.main_color,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                customHeading('12:00 - 20-30', 13)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customText(
                            "Ullamco aute Lorem quis occaecat ullamco officia aliqua. Sint laboris ",
                            null,
                            12),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: customButton(
                                  'Follow', BrandColor.main_color, null, 35),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => CreateAppointment(doctor));
                              },
                              child: Expanded(
                                child: customButton(
                                    'Make appointment',
                                    BrandColor.in_background,
                                    BrandColor.main_color,
                                    35,
                                    11,
                                    BrandColor.main_color),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    MaterialCommunityIcons.dots_vertical,
                    color: Colors.black,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 22,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customHint("Rating"),
                          customHeading("4.8 out of 5", 14)
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (() {
                      Get.to(() => const ReviewsPage());
                    }),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: BrandColor.main_color,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                  "View reviews", BrandColor.in_background, 11),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.white70, size: 8),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Icon(
                      //   Icons.people,
                      //   size: 15,
                      //   color: Colors.black54,
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      Column(
                        children: [
                          customHeading(
                              "5 000+", 20, null, BrandColor.text_color),
                          customHint("Patients")
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.no_accounts,
                      //   size: 15,
                      //   color: Colors.black54,
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      Column(
                        children: [
                          customHeading("10", 20, null, BrandColor.text_color),
                          customHint("Experience")
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.reviews,
                      //   size: 15,
                      //   color: Colors.black54,
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      Column(
                        children: [
                          customHeading(
                              "4988", 20, null, BrandColor.text_color),
                          customHint("Reviews")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              customHeading("Followers", 14),
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: images
                      .map((image) => Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                customAvatar(50, image['image']!),
                                customHint(image['name']!)
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customHeading("Posts", 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 5,
                    children: images
                        .map((image) => ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                  imageUrl: image['image']!, fit: BoxFit.cover),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
