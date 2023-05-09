// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/patients/widgets/ratings_item.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double sliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
          backgroundColor: BrandColor.in_background,
          elevation: 0,
          title: customHeading("Filter Options", 20),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: customHeading("Reset", 15, null, BrandColor.main_color),
            ),
            const SizedBox(
              width: 20,
            )
          ],
          leading: GestureDetector(
            onTap: (() {
              Get.back();
            }),
            child: Icon(
              AntDesign.close,
              size: 25,
              color: BrandColor.text_color,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 80,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading("SORT BY PRICE RANGE", 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Slider(
                            value: sliderValue,
                            min: 0,
                            label: "20",
                            autofocus: true,
                            mouseCursor: MouseCursor.defer,
                            max: 100,
                            onChanged: (value) {
                              setState(() {
                                sliderValue = value;
                              });
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customHeading("SORT BY RATING", 15),
                      ratingItem("1 - 2 ratings"),
                      ratingItem("2 - 3 ratings"),
                      ratingItem("4 - 5 ratings"),
                      ratingItem("5 - 6 ratings"),
                      const SizedBox(
                        height: 20,
                      ),
                      customHeading("SORT BY DISCOUNT", 15),
                      ratingItem("10% - 20% ratings"),
                      ratingItem("25% - 50% ratings"),
                      ratingItem("50% - 70% ratings"),
                      ratingItem("70% above"),
                      const SizedBox(
                        height: 10,
                      ),
                      customHeading("SORT BY OTHERS", 15),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Row(
                              children: [
                                Checkbox(value: true, onChanged: (value) {}),
                                customText("Discount", null, 15)
                              ],
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                customText("Voucher", null, 15)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              customText("Free shipping", null, 15)
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              customText("Same day delivery", null, 15)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: const [],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customHeading("SORT BY CATEGORY", 15),
                      ratingItem("Fresh fruits"),
                      ratingItem("Chicken"),
                      ratingItem("Fresh fish"),
                      ratingItem("Fresh Diary"),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: customButton("Apply filter", BrandColor.main_color))
          ],
        ),
      ),
    );
  }
}
