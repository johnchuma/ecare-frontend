// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe, unused_import

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/emergency/pages/emergencytabs/ambulance_tab.dart';
import 'package:doctor/modules/emergency/pages/emergencytabs/doctor_tab.dart';
import 'package:doctor/modules/emergency/pages/emergencytabs/midwife_tab.dart';
import 'package:doctor/modules/emergency/pages/emergencytabs/fire_tab.dart';
import 'package:doctor/modules/settings/pages/edit_profile.dart';
import 'package:doctor/modules/settings/pages/help_center_tabs/contact_us_tab.dart';
import 'package:doctor/modules/settings/pages/help_center_tabs/faq_tab.dart';
import 'package:doctor/modules/settings/pages/invite_friends.dart';
import 'package:doctor/modules/settings/pages/language_page.dart';
import 'package:doctor/modules/settings/pages/notification_settings.dart';
import 'package:doctor/modules/settings/pages/payment_cards_page.dart';
import 'package:doctor/modules/settings/pages/security_page.dart';
import 'package:doctor/modules/settings/widgets/setting_option.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  String currentCategory = "Newest";
  List tabs = [
    {"tab": "Ambulance", "view": const AmbulanceTab()},
    {"tab": "Doctor", "view": const DoctorTab()},
    {"tab": "Midwife", "view": const MidwifeTab()},
    {"tab": "Fire", "view": const FireTab()}
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          backgroundColor: BrandColor.in_background,
          appBar: AppBar(
            backgroundColor: BrandColor.in_background,
            bottom: TabBar(
                labelColor: BrandColor.main_color,
                isScrollable: true,
                unselectedLabelColor: BrandColor.text_color,
                labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                tabs: tabs
                    .map((item) => Tab(
                          text: item['tab'],
                        ))
                    .toList()),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: customHeading("Emergency services", 18),
            actions: [
              GestureDetector(
                onTap: (() {
                  Get.to(() => Container());
                }),
                child: const Icon(
                  AntDesign.message1,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
            elevation: 0,
          ),
          body: TabBarView(
              children: tabs
                  .map((item) => Container(
                        child: item['view'],
                      ))
                  .toList())),
    );
  }
}
