// ignore_for_file: unused_import, implementation_imports, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/widgets/pill_icons.dart';
import 'package:doctor/modules/doctor/widgets/review.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leading: backArrow(),
        title: customHeading("4.8 (4,523 reviews)", 16),
        actions: [
          Icon(
            AntDesign.message1,
            color: BrandColor.text_color,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Wrap(
                      children: [
                        pillIcons(
                          "All",
                          false,
                        ),
                        pillIcons("5", true),
                        pillIcons("3", true),
                        pillIcons("7", true),
                        pillIcons("9", true),
                        pillIcons("2", true),
                        pillIcons("6", true),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              review(Photos.doctor2,
                  "Sint ipsum magna mollit aute nostrud aliquip veniam. 👩‍🔧👩‍🔧👩‍🔧👩‍🔧 Nulla erure dolore aliqua nisi. "),
              review(Photos.doctor3,
                  "Occaecat tempor ipsum consectetur nostrud laboris ut esse do voluptate aliqua officia laborum non."),
              review(Photos.doctor1,
                  "Laborum exercitation iqua nisi eiusmod sit Lorem. Sunt velit aliquip elit 🌳 crunt id minim duis laborum."),
              review(Photos.doctor4,
                  "Qui aliquip sunt et qui nisiolor fugiat. Occaecat eiusmod 🤣"),
            ],
          ),
        ),
      ),
    );
  }
}
