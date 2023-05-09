// ignore_for_file: import_of_legacy_library_into_null_safe, file_names, prefer_const_literals_to_create_immutables

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/textarea.dart';

import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/custom_dialogs.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteReview extends StatelessWidget {
  const WriteReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leadingWidth: 40,
        title: customHeading("Write a review", 20),

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
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customAvatar(150, Photos.doctor2),
                      const SizedBox(
                        height: 10,
                      ),
                      customHeading(
                          "How was you experience \nwith Dr. Drake Boeson",
                          17,
                          TextAlign.center),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_outline,
                            color: BrandColor.main_color,
                            size: 35,
                          ),
                          Icon(
                            Icons.star_outline,
                            color: BrandColor.main_color,
                            size: 35,
                          ),
                          Icon(
                            Icons.star_outline,
                            color: BrandColor.main_color,
                            size: 35,
                          ),
                          Icon(
                            Icons.star_outline,
                            color: BrandColor.main_color,
                            size: 35,
                          ),
                          Icon(
                            Icons.star_outline,
                            color: BrandColor.main_color,
                            size: 35,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          customHeading("Write you review", 17),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      textarea(
                          maxlines: 2,
                          minlines: 2,
                          textEditingController: TextEditingController(
                              text:
                                  "Sit labore eiusmod magna consequat elit aliqua ut tempor ut sint non ad. Sint aliquip proident ad eu esse quis qui consectetur aliqua excepteur. Ex ea laboris duis nostrud commodo pariatur irure.")),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: customHeading(
                                "Would you recommend Dr. Drake Boeson to you friends ?",
                                17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          // Expanded(child: customRadio("Yes")),
                          // Expanded(child: customRadio("No")),
                          const Spacer(
                            flex: 3,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Container(
                  color: BrandColor.in_background,
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
                        child: GestureDetector(
                          onTap: () {
                            customDialog.writeReview();
                          },
                          child: customButton(
                              "Submit",
                              BrandColor.main_color,
                              BrandColor.in_background,
                              null,
                              null,
                              BrandColor.in_background),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
