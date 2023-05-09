// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/pages/doctor_timetable.dart';
import 'package:doctor/modules/doctor/pages/doctor_packages.dart';
import 'package:doctor/modules/settings/pages/settings_page.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
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
    var me = getMyInfo();
    DateFormat format = DateFormat.MMMMEEEEd();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("My profile"),
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
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customHeading(me.name, 18),
                                        customHint("Kinondoni Dar es salaam"),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 35,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                customHint("Rating"),
                                                customHeading(
                                                    "4.8 out of 5", 16)
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  height: 85,
                                  width: 85,
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover, imageUrl: me.image),
                                ),
                              ),
                            ],
                          ),
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
                                  customHeading(
                                      format.format(DateTime.now()), 12)
                                ],
                              ),
                              const SizedBox(
                                width: 5,
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
                                  customHeading('12:00 - 20-30', 12)
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
                          GestureDetector(
                            onTap: (() {
                              Get.to(() => const SettingsPage());
                            }),
                            child: customButton(
                              'Edit profile',
                              BrandColor.main_color,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  PopupMenuButton(itemBuilder: ((context) {
                    return [
                      PopupMenuItem(
                          child: GestureDetector(
                        onTap: () {
                          Get.to(() => const CreateTimetable());
                        },
                        child: Row(
                          children: [
                            customText("My timetable"),
                          ],
                        ),
                      )),
                      PopupMenuItem(
                          child: GestureDetector(
                        onTap: () {
                          Get.to(() => const DoctorPackages());
                        },
                        child: Row(
                          children: [
                            customText("My packages"),
                          ],
                        ),
                      )),
                      // PopupMenuItem(
                      //     child: Row(
                      //   children: [
                      //     customText("Logout", Colors.red),
                      //   ],
                      // )),
                    ];
                  })),
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
                      customHeading("25", 20),
                      customText('Posts', null, 13)
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 50,
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
                    height: 50,
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
