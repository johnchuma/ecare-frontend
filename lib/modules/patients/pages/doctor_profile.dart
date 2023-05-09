// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/patients/widgets/heading_paragraph.dart';
import 'package:doctor/modules/patients/widgets/review.dart';
import 'package:doctor/modules/patients/widgets/rounded_icons.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("Dr jane smith"),
        actions: const [
          Icon(
            AntDesign.message1,
            size: 17,
            color: Colors.black,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            MaterialCommunityIcons.dots_vertical,
            size: 20,
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
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 90,
                              width: 100,
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://picsum.photos/302"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        roundedIcon(Icons.group),
                        roundedIcon(Icons.image),
                        roundedIcon(Icons.star),
                        roundedIcon(Icons.message)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            customHeading(
                                "5 000+", 15, null, BrandColor.main_color),
                            customHint("Patients")
                          ],
                        ),
                        Column(
                          children: [
                            customHeading(
                                "10", 15, null, BrandColor.main_color),
                            customHint("Experience")
                          ],
                        ),
                        Column(
                          children: [
                            customHeading(
                                "4.8", 15, null, BrandColor.main_color),
                            customHint("Ratings")
                          ],
                        ),
                        Column(
                          children: [
                            customHeading(
                                "4988", 15, null, BrandColor.main_color),
                            customHint("Reviews")
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    headingParagraph("About me",
                        "Excepteur commodo eiusmod deserunt consequat duis magna. Sint aliqua officia in proident  "),
                    const SizedBox(
                      height: 10,
                    ),
                    headingParagraph(
                        "Working time", "Excepteur commodo eiusmod ."),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customHeading("Reviews", 17),
                        customHeading(
                            "See all", 14, null, BrandColor.main_color)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    review(),
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
                bottom: 20,
                right: 0,
                left: 0,
                child: customButton("Book appointment", BrandColor.main_color,
                    BrandColor.in_background),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
