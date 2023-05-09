// ignore_for_file: must_be_immutable

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/pages/signin_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/modules/patients/widgets/icon_background.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height / 3;
    double bottomHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height / 3;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  BrandColor.main_color,
                  BrandColor.main_color,
                ])),
                width: double.infinity,
                height: headerHeight,
                child: Center(
                    child: customHeading("Create an account", 25, null,
                        BrandColor.in_background)),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              familyForm("Name", "Your name"),
                              familyForm("Email", "Your name"),
                              familyForm("Phone", "Your name"),
                              familyForm("Password", "Your name"),
                              familyForm("Repeat password", "Your name"),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: bottomHeight - 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconBackground(Icons.add_a_photo,
                          iconColor: BrandColor.main_color,
                          background: Colors.grey[200]),
                    ],
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
                      customButton("Register"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customHeading("Already registered ?", 14, null, null,
                              FontWeight.w500),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignInPage());
                            },
                            child: customHeading("Login", 14, null,
                                BrandColor.main_color, FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
