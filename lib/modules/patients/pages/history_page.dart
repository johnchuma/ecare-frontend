// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/patients/pages/historytabs/audio_history_tab.dart';
import 'package:doctor/modules/patients/pages/historytabs/message_history_tab.dart';
import 'package:doctor/modules/patients/pages/historytabs/video_history_tab.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    List tabs = [
      {"name": "Message", "view": const messageHistoryTab()},
      {"name": "Video call", "view": const videoHistoryTab()},
      {"name": "Audio call", "view": const audioHistoryTab()},
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: BrandColor.in_background,
        appBar: AppBar(
          backgroundColor: BrandColor.in_background,
          title: customHeading("History", 18),
          leading: Container(),
          leadingWidth: 1,
          bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              indicatorColor: Colors.black,
              labelStyle: GoogleFonts.poppins(fontSize: 18),
              indicatorSize: TabBarIndicatorSize.label,
              padding: const EdgeInsets.only(right: 30),
              isScrollable: true,
              tabs: tabs
                  .map((tab) => customText(tab['name'], null, 15))
                  .toList()),
          actions: [
            const Icon(
              AntDesign.search1,
              size: 20,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
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
                .map((tab) => Container(
                      child: tab['view'],
                    ))
                .toList()),
      ),
    );
  }
}
