// ignore_for_file: avoid_unnecessary_containers, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_pill.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/includes/options.dart';
import 'package:doctor/modules/doctor/pages/notification_page.dart';
import 'package:doctor/modules/doctor/pages/profile_page.dart';
import 'package:doctor/modules/doctor/pages/transaction_page.dart';
import 'package:doctor/modules/family/pages/subpages/persciption.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_articles_page.dart';
import 'package:doctor/modules/patients/pages/doctors_page.dart';
import 'package:doctor/modules/patients/pages/hometabs/summarytab.dart';
import 'package:doctor/modules/patients/pages/hospitals_page.dart';
import 'package:doctor/modules/patients/pages/posts_page.dart';
import 'package:doctor/modules/patients/widgets/best_doctor.dart';
import 'package:doctor/modules/shop/shop_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List homeTabs = [
      {'name': 'Summary', 'view': const SummaryTab()},
      {'name': 'Medicines', 'view': Container()},
      {'name': 'Hospitals', 'view': const HospitalsPage()},
      {'name': 'Articles', 'view': Container()},
      {'name': 'Posts', 'view': const PostsPage()},
    ];
    return DefaultTabController(
      length: homeTabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(),
          leadingWidth: 1,
          backgroundColor: BrandColor.in_background,
          title: customHeading("Home", 18),
          bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              indicatorColor: Colors.black,
              labelStyle: GoogleFonts.poppins(
                fontSize: 15,
              ),
              labelColor: BrandColor.text_color,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: homeTabs
                  .map((tab) => Tab(
                        text: tab['name'],
                      ))
                  .toList()),
          actions: [
            // ignore: prefer_const_constructors
            Icon(
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
                padding: const EdgeInsets.only(top: 15),
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
                              child:
                                  customText("3", BrandColor.in_background, 8)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: ClipOval(
                child: SizedBox(
                  height: 40,
                  width: 36,
                  child: CachedNetworkImage(
                    imageUrl: Photos.pic1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TabBarView(
              children: homeTabs
                  .map((tab) => Container(
                        child: tab['view'],
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
