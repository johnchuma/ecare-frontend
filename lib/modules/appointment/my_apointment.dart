// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/patients/widgets/patient_info.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

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
        title: customHeading("My Appointment", 20),
        actions: const [
          Icon(
            AntDesign.message1,
            size: 17,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 90,
                              width: 100,
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover, imageUrl: Photos.doctor3),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customHeading("Dr jane mathwew", 16),
                            const SizedBox(
                              height: 10,
                            ),
                            customHint("Immuninasdfkjad"),
                            customHint("North america, carifonia"),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customHeading("Schuduled appointment", 17),
                    customHint("Today December 20 2022"),
                    customHint("13:00 - 13:30 (30mins)"),
                    const SizedBox(
                      height: 10,
                    ),
                    customHeading("Patient information", 17),
                    const SizedBox(
                      height: 10,
                    ),
                    patientInfo("Full name", "John Chuma"),
                    patientInfo("Gender", "Male"),
                    patientInfo("Age", "29"),
                    patientInfo("Problem",
                        "Sint nisi incididunt velit fugiat sit cillum Lorem ullamco."),
                    const SizedBox(
                      height: 10,
                    ),
                    customHeading("Your package", 17),
                    const SizedBox(
                      height: 5,
                    ),
                    // packageWidget(MaterialCommunityIcons.message, "Message",
                    //     "Chat messages with doctor", "\$20", "20 Mins",
                    //     selectable: true),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 14,
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
                child: customButton("Message (start at 3:20)",
                    BrandColor.main_color, BrandColor.in_background),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
