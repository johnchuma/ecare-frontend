// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe, unused_import

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/doctor/widgets/notification.dart';
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

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String currentCategory = "Newest";
  List tabs = [
    {"tab": "Ambulance", "view": const AmbulanceTab()},
    {"tab": "Doctor", "view": const DoctorTab()},
    {"tab": "Midwife", "view": const MidwifeTab()},
    {"tab": "Fire", "view": const FireTab()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BrandColor.in_background,
        appBar: AppBar(
          backgroundColor: BrandColor.in_background,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: customHeading("Notifications", 18),
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
              width: 20,
            )
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [notification(), notification()],
          ),
        ));
  }
}
