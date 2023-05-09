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
import 'package:doctor/modules/appointment/review_summary.dart';
import 'package:doctor/modules/patients/widgets/packages.dart';
import 'package:doctor/modules/patients/widgets/payment.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class SelectPayment extends StatelessWidget {
  SelectPayment({super.key});
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
        title: customHeading("Payments", 20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    customText("Select the payment method you want"),
                    const SizedBox(
                      height: 10,
                    ),
                    payment(Photos.paypal, "Paypal"),
                    payment(Photos.google, "Google pay"),
                    payment(Photos.apple, "Apple pay"),
                    const SizedBox(
                      height: 20,
                    ),
                    customButton(
                        "Add new card",
                        Colors.grey[200],
                        BrandColor.main_color,
                        null,
                        null,
                        BrandColor.in_background),
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
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ReviewSummary());
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
