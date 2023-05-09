// ignore_for_file: implementation_imports, avoid_print, prefer_typing_uninitialized_variables

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/family/models/family.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/modules/family/widget/select_form.dart';
import 'package:doctor/modules/patients/widgets/icon_background.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';

class AddFamily extends StatefulWidget {
  const AddFamily({super.key});

  @override
  State<AddFamily> createState() => _AddFamilyState();
}

class _AddFamilyState extends State<AddFamily> {
  final _formKey = GlobalKey<FormState>();
  Family family = Family();
  var profilePic;
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height / 3 - 20;
    double bottomHeight =
        MediaQuery.of(context).size.height - headerHeight - 50;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                color: BrandColor.main_color,
                width: double.infinity,
                height: headerHeight,
                child: Center(
                    child: customHeading("Add family", 25, null,
                        BrandColor.in_background, FontWeight.w400)),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: bottomHeight - 55,
                      color: BrandColor.in_background,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                familyForm("Name", "Your name",
                                    textEditingController: nameController),
                                selectForm(
                                    "Gender",
                                    "Select appropiate gender",
                                    genderController,
                                    ["Male", "Female", "Other gender"]),
                                familyForm("Weight", "Your name",
                                    textEditingController: weightController,
                                    textInputType: TextInputType.number),
                                familyForm("Length", "Your name",
                                    textEditingController: lengthController,
                                    textInputType: TextInputType.number),
                                selectForm(
                                    "Relationship",
                                    "What is your relationship with this person",
                                    relationshipController, [
                                  "Child",
                                  "Wife",
                                  "Husband",
                                  "Father",
                                  "Mother"
                                ]),
                                selectForm(
                                    "Blood group",
                                    "Select blood group",
                                    bloodGroupController,
                                    ["A", "B", "AB", "o"]),
                                familyForm("Age", "Your name",
                                    textEditingController: ageController,
                                    textInputType: TextInputType.number),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: bottomHeight + 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          family.pickProfileImage().then((value) {
                            setState(() {
                              profilePic = value;
                            });
                          });
                        },
                        child: profilePic == null
                            ? iconBackground(Icons.add_a_photo,
                                iconColor: BrandColor.main_color,
                                background: Colors.grey[200])
                            : ClipOval(
                                child: SizedBox(
                                    height: 85,
                                    width: 85,
                                    child: Image.file(
                                      profilePic,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                      ),
                    ],
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: GestureDetector(
                      onTap: () {
                        if (profilePic != null) {
                          if (_formKey.currentState!.validate()) {
                            print(genderController.text);
                            print(relationshipController.text);
                            print(bloodGroupController.text);
                            // print(genderController.text);

                            family.age = int.parse(ageController.text);
                            family.bloodGroup = bloodGroupController.text;
                            family.gender = genderController.text;
                            family.length = double.parse(lengthController.text);
                            family.name = nameController.text;
                            family.relationship = relationshipController.text;
                            family.weight = double.parse(weightController.text);
                            family.addFamilyMember();
                          }
                        } else {
                          errorToast("Profile image is required");
                        }
                      },
                      child: customButton("Add member"))),
            ],
          ),
        ),
      ),
    );
  }
}
