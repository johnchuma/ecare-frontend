// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/includes/textarea.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:flutter/material.dart';

class ClientInformation extends StatelessWidget {
  const ClientInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: customHeading("Client information"),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: backArrow(),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 5, right: 5, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            familyForm("Test type", "test type"),
                            const SizedBox(
                              height: 10,
                            ),
                            familyForm("Date", "enter date"),
                            const SizedBox(
                              height: 10,
                            ),
                            familyForm("Start time", "enter start date"),
                            const SizedBox(
                              height: 10,
                            ),
                            familyForm("End time", "enter end date"),
                            const SizedBox(
                              height: 10,
                            ),
                            familyForm("Hospital name", "enter date"),
                            const SizedBox(
                              height: 10,
                            ),
                            familyForm("Doctor name", "enter date"),
                            const SizedBox(
                              height: 10,
                            ),
                            customHeading("Types notes app", 16),
                            textarea(
                                maxlines: 2,
                                minlines: 2,
                                textEditingController: TextEditingController(
                                    text:
                                        "Eiusmod dolor culpa reprehenderit amet et deserunt mollit. Qui fugiat Lorem est aliqua amet laboris do anim occaecat minim aliquip ut cupidatat. Aliquip nostrud proident anim amet elit quis eiusmod irure. Laborum laborum magna in id ipsum et ea aute adipisicing nostrud esse ipsum esse. Mollit eiusmod do consectetur eu non labore laborum proident veniam cupidatat pariatur aliquip ipsum cillum. Exercitation voluptate ex commodo sunt exercitation eu tempor aute ex voluptate.")),
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (value) {}),
                                customText("Add reminder")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: customButton("Save event"))
            ],
          ),
        ),
      ),
    );
  }
}
