// ignore_for_file: unused_import, import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables

import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/doctor/pages/doctor_page.dart';
import 'package:doctor/includes/chart2.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/pharmacy/widgets/calender_date.dart';
import 'package:doctor/modules/pharmacy/widgets/transaction.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class PharmacyTransactionPage extends StatelessWidget {
  const PharmacyTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            MaterialCommunityIcons.arrow_left,
            color: BrandColor.text_color,
          ),
        ),
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     Get.to(() => const DoctorPage());
          //   },
          //   child: const Icon(
          //     Icons.menu,
          //     color: Colors.black,
          //   ),
          // ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 90,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      customHint('Total balance'),
                      customHeading("\$24,000", 30),
                      const SizedBox(child: LineChartSample2()),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customHeading("Transactions"),
                            Row(
                              children: [
                                customText("From"),
                                const SizedBox(
                                  width: 10,
                                ),
                                calenderDate("2023-01-23"),
                                const SizedBox(
                                  width: 10,
                                ),
                                customText("To"),
                                const SizedBox(
                                  width: 10,
                                ),
                                calenderDate("2023-02-2")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            transaction(),
                            transaction(),
                            transaction(),
                            transaction(),
                            transaction(),
                            transaction(),
                            transaction(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 00,
            //   left: 00,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(30),
            //         child: Container(
            //           color: BrandColor.main_color,
            //           child: const Padding(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            //             child: Text(
            //               "New Transaction",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
