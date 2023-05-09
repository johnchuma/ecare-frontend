// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/patients/widgets/icon_background.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class ConsultationEnded extends StatelessWidget {
  const ConsultationEnded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leadingWidth: 40,

        // ignore: prefer_const_constructors
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconBackground(MaterialCommunityIcons.clock,
                        padding: 30, iconSize: 40),
                    const SizedBox(
                      height: 20,
                    ),
                    customHeading("The consultation session has ended", 17,
                        TextAlign.center),
                    customHint("Recordings has been saved in activity"),
                    const SizedBox(
                      height: 20,
                    ),
                    customAvatar(150, Photos.doctor2),
                    const SizedBox(
                      height: 10,
                    ),
                    customHeading("Dr drake", 17, TextAlign.center),
                    customText("Immunogists"),
                    customHint("The valley in Hospital in California US"),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: customButton(
                          "Back to home",
                          Colors.grey[200],
                          BrandColor.main_color,
                          null,
                          null,
                          BrandColor.in_background),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: customButton(
                          "Leave a review",
                          BrandColor.main_color,
                          BrandColor.in_background,
                          null,
                          null,
                          BrandColor.in_background),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
