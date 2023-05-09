// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable, unused_import, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_form.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_select.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/patients/pages/patient_details.dart';
import 'package:doctor/modules/patients/widgets/doctor_profile.dart';
import 'package:doctor/modules/patients/widgets/packages.dart';
import 'package:doctor/modules/patients/widgets/payment.dart';
import 'package:doctor/modules/patients/widgets/summary.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/custom_dialogs.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class ReviewSummary extends StatelessWidget {
  ReviewSummary({super.key});
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("Review summary", 20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 90,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      doctorProfile(),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: [
                              summary("Date & Hours", "Dec 23,2024 | 10:00AM"),
                              summary("Package", "Messaging"),
                              summary("Duration", "35 mins"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: [
                              summary("Amount", "\$20"),
                              summary("Duration (30mins)", "1 x \$20"),
                              const SizedBox(
                                height: 20,
                              ),
                              summary("Total", "\$20"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: CachedNetworkImage(
                                    imageUrl: Photos.mastercard,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                customText("XXXX XXXX XXXX X234"),
                                const Spacer(),
                                customHeading(
                                    "Change", 12, null, BrandColor.main_color)
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 90,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    customDialog.appointmentSuccess();
                  },
                  child: customButton(
                      "Next", BrandColor.main_color, BrandColor.in_background),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
