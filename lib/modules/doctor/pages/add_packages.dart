// ignore_for_file: non_constant_identifier_names

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/includes/pill.dart';
import 'package:doctor/modules/doctor/models/package.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';

class AddPackages extends StatefulWidget {
  const AddPackages({super.key});

  @override
  State<AddPackages> createState() => _AddPackagesState();
}

class _AddPackagesState extends State<AddPackages> {
  String selectedType = "";
  TimeOfDay? starting_time;
  TimeOfDay? ending_time;
  TextEditingController priceController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List types = [
    "Voice call",
    "Video call",
    "Messaging",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customHeading("Add package", 16),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (selectedType != "") {
                            Package package = Package();
                            // print(priceController.text.toString().trim());
                            package.name = selectedType;
                            package.price = int.parse(
                                priceController.text.toString().trim());
                            package.duration = int.parse(
                                durationController.text.toString().trim());
                            package.addPackage();
                          } else {
                            errorToast("Please select all asked informations");
                          }
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: pill('Save', active: true),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                customText("Choose packages type", null, 12),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  children: types
                      .map((type) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = type;
                            });
                          },
                          child: pill(type, active: type == selectedType)))
                      .toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                familyForm("Price (in dollars)", "Add package price",
                    textEditingController: priceController,
                    textInputType: TextInputType.number),
                familyForm("Duration (in minutes)", "Add package duration",
                    textEditingController: durationController,
                    textInputType: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
