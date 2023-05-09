// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, unused_import

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_form.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/patients/widgets/custom_radio.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

class MedicationPurpose extends StatelessWidget {
  const MedicationPurpose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: Icon(
          Icons.arrow_back,
          color: BrandColor.text_color,
        ),
        title: customHeading("Add medication", 18),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Container(
              height: MediaQuery.of(context).size.height - 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading(
                          "What is the purpose of taking medication", 16),
                      const SizedBox(
                        height: 10,
                      ),
                      customForm(
                          "Medication purpose",
                          "Add medication purpose",
                          TextEditingController(text: ""),
                          null,
                          null,
                          null,
                          null,
                          null,
                          null,
                          10),
                      customHeading(
                          "How do you ofter take this medicine ?", 16),
                      const SizedBox(
                        height: 5,
                      ),
                      // customRadio("Daily"),
                      // customRadio("Once a week"),
                      // customRadio("2 days a week"),
                      // customRadio("3 days a week"),
                      // customRadio("4 days a week", groupValue: "true"),
                      // customRadio("5 days a week"),
                      // customRadio("6 days a week"),
                      // customRadio("Once a week"),
                      // customRadio("Alternate days"),
                      const SizedBox(
                        height: 20,
                      ),
                      customHeading("Choose days you need to the med ", 16),
                      // customRadio("Monday"),
                      // customRadio("Tuesday"),
                      // customRadio("Wednesday", groupValue: "true"),
                      // customRadio("Thursday"),
                      // customRadio("Friday"),
                      // customRadio("Thursday"),
                      const SizedBox(
                        height: 20,
                      ),
                      customHeading(
                          "At what time do you take your first dose ? ", 16),
                      // customRadio("Morning"),
                      // customRadio("Afternoon"),
                      // customRadio("Evening", groupValue: "true"),
                      // customRadio("Night"),
                      // customRadio("Before food"),
                      // customRadio("After food"),
                      // customRadio("Anytime"),
                      const SizedBox(
                        height: 20,
                      ),
                      customHeading("Set time", 16),
                      Container(
                          height: 420,
                          child: TimePickerDialog(
                              initialEntryMode: TimePickerEntryMode.dialOnly,
                              initialTime: TimeOfDay.now()))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: customButton("Add medication"))
        ],
      ),
    );
  }
}
