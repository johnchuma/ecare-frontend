// ignore_for_file: unused_import, import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables

import 'package:doctor/modules/doctor/pages/doctor_page.dart';
import 'package:doctor/includes/chart2.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 90,
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
                          customHeading("Transaction"),
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(5),
                            child: ListTile(
                              leading: customAvatar(40,
                                  'https://s18798.pcdn.co/mavericklimccproject/wp-content/uploads/sites/14030/1986/06/Face-Profile-2-300x200.jpg'),
                              title: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'Debit ',
                                    style: TextStyle(
                                        color: BrandColor.main_color)),
                                const TextSpan(
                                    text: 'from John Chuma',
                                    style: TextStyle(color: Colors.black87))
                              ])),
                              subtitle: customHint('20 mins ago'),
                              trailing: customHeading("\$230", 15),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(5),
                            child: ListTile(
                              leading: customAvatar(40,
                                  'https://s18798.pcdn.co/mavericklimccproject/wp-content/uploads/sites/14030/1986/06/Face-Profile-2-300x200.jpg'),
                              title: RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                    text: 'Credit ',
                                    style: TextStyle(color: Colors.green)),
                                TextSpan(
                                    text: 'from John Chuma',
                                    style: TextStyle(color: Colors.black87))
                              ])),
                              subtitle: customHint('20 mins ago'),
                              trailing: customHeading("\$230", 15),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 00,
            left: 00,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: BrandColor.main_color,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                      child: Text(
                        "New Transaction",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
