// ignore_for_file: avoid_unnecessary_containers, unused_import, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_pill.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/includes/options.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/pages/appointment_page.dart';
import 'package:doctor/modules/doctor/pages/notification_page.dart';
import 'package:doctor/modules/doctor/pages/profile_page.dart';
import 'package:doctor/modules/doctor/pages/transaction_page.dart';
import 'package:doctor/modules/emergency/pages/emergency_page.dart';
import 'package:doctor/modules/family/pages/subpages/persciption.dart';
import 'package:doctor/modules/patients/pages/articles_page.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_articles_page.dart';
import 'package:doctor/modules/patients/pages/doctors_page.dart';
import 'package:doctor/modules/patients/pages/hometabs/summarytab.dart';
import 'package:doctor/modules/patients/pages/hospitals_page.dart';
import 'package:doctor/modules/patients/pages/posts_page.dart';
import 'package:doctor/modules/patients/widgets/best_doctor.dart';
import 'package:doctor/modules/shop/shop_page.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/map_functions.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientHomePage2 extends StatefulWidget {
  const PatientHomePage2({super.key});

  @override
  State<PatientHomePage2> createState() => _PatientHomePage2State();
}

class _PatientHomePage2State extends State<PatientHomePage2> {
  @override
  void initState() {
    myCoordinates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var box = Boxes.getUsers();
    User? me = box.get('me');
    print(me!.image);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ProfilePage());
                      },
                      child: customAvatar(50, Photos.doctor2),
                    ),
                    const Spacer(),
                    const Icon(
                      AntDesign.search1,
                      size: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const NotificationPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Stack(
                          children: [
                            const Icon(
                              Icons.notifications,
                              size: 25,
                              color: Colors.black,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: ClipOval(
                                child: Container(
                                  height: 12,
                                  width: 12,
                                  color: BrandColor.main_color,
                                  child: Center(
                                      child: customText(
                                          "3", BrandColor.in_background, 8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customHeading("Welcome!"),
                          customHeading(me.name),
                          customHint('Good morning'),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.light,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Urgent care',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customHeading("Ecare services"),
                        ],
                      ),
                    ),
                    ClipOval(
                      child: Container(
                        color: Colors.grey[400],
                        width: 150,
                        child: CachedNetworkImage(
                            imageUrl:
                                'https://medeor.ae/wp-content/uploads/sites/2/2022/10/Abinaya-Balaji.png'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      {'name': option("Post"), 'widget': const PostsPage()},
                      {
                        'name': option("Articles"),
                        'widget': const ArticlesPage()
                      },
                      {
                        'name': option("First aid"),
                        'widget': const EmergencyPage()
                      },
                      {
                        'name': option("Hospitals"),
                        'widget': Container(child: const HospitalsPage())
                      },
                    ]
                        .map((opt) => GestureDetector(
                            onTap: () {
                              Get.to(() => Container(child: opt['widget']));
                            },
                            child: opt['name']))
                        .toList(),
                  ),
                ),
                const SummaryTab()
              ],
            ),
          )),
    );
  }
}
