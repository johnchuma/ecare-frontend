// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/patients/pages/hospital_profile.dart';
import 'package:doctor/modules/patients/widgets/hospital.dart';
import 'package:doctor/modules/patients/widgets/search_and_filter.dart';
import 'package:doctor/modules/patients/widgets/top_shop.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class HospitalsPage extends StatelessWidget {
  const HospitalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leadingWidth: 40,
        title: customHeading("Pharmacies", 18),

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
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const HospitalProfile());
                    },
                    child: hospital(Photos.doctor1)),
                hospital(Photos.doctor2),
                hospital(Photos.doctor4)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
