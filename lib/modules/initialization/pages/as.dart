// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_pill.dart';
import 'package:doctor/includes/custom_select.dart';
import 'package:doctor/modules/authentication/pages/registration_page.dart';
import 'package:doctor/modules/authentication/pages/registration_page2.dart';
import 'package:doctor/modules/authentication/pages/signin_page.dart';
import 'package:doctor/modules/initialization/controller/initialization_controller.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class As extends StatefulWidget {
  const As({super.key});

  @override
  State<As> createState() => _AsState();
}

class _AsState extends State<As> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repeatPasswordController = TextEditingController();

  bool patientActive = true;

  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height / 2;
    double bottomHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height / 2;
    List proffesionals = [
      "Doctor",
      "Pharmacy",
      "Hospital",
      "Fire & Rescue",
      "Nurse"
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height,
          child: GetX(
              init: InitializationController(),
              builder: (find) {
                String userType = find.as.value;
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: BrandColor.main_color,
                      ),
                      width: double.infinity,
                      height: headerHeight,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: headerHeight - 160,
                              child: CachedNetworkImage(
                                  imageUrl: userType == "Patient"
                                      ? Photos.patientAvatar
                                      : Photos.doctorAvatar)),
                          customHeading("Register as", 25, null,
                              BrandColor.in_background, FontWeight.w300),
                          customHint(
                              "Select appropiate option using buttons below",
                              null,
                              BrandColor.in_background.withOpacity(0.5))
                        ],
                      )),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 55),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(00),
                            child: Container(
                              height: bottomHeight - 55,
                              color: BrandColor.in_background,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              customAvatar(
                                                  90, Photos.patientAvatar),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      find.changeUserType(
                                                          "Patient");
                                                      find.changeDropdownItemTextColor(
                                                          BrandColor
                                                              .text_color);
                                                      // changeOption(true);
                                                      // InitializationController()
                                                      //     .changeUserType(
                                                      //         "Patient");
                                                    },
                                                    child: customPill(
                                                        "Patient",
                                                        userType == "Patient"
                                                            ? BrandColor
                                                                .main_color
                                                            : Colors.grey[200]!,
                                                        userType == "Patient"
                                                            ? Colors.white
                                                            : Colors.black,
                                                        false,
                                                        vertical: 10,
                                                        horizontal: 50,
                                                        icon: null,
                                                        textSize: 13),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                customAvatar(
                                                    90, Photos.doctorAvatar),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                GestureDetector(
                                                  // onTap: () {},
                                                  child: customSelect(
                                                      "Proffesional",
                                                      proffesionals,
                                                      find: find,
                                                      color:
                                                          userType != "Patient"
                                                              ? BrandColor
                                                                  .main_color
                                                              : null),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      // Text(userType)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 20,
                        left: 60,
                        right: 60,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (userType == "Patient") {
                                    Get.to(() => RegistrationPage());
                                  } else {
                                    Get.to(() => RegistrationPage2());
                                  }
                                },
                                child: customButton("Next")),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customHeading("Have an account ?", 14, null,
                                    null, FontWeight.w500),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => SignInPage());
                                  },
                                  child: customHeading("Sign in", 14, null,
                                      BrandColor.main_color, FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
