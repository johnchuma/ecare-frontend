// ignore_for_file: must_be_immutable, unused_import, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/controller/auth_controller.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/pages/signin_page.dart';
import 'package:doctor/modules/initialization/controller/initialization_controller.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';

import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/modules/patients/widgets/icon_background.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repeatPasswordController = TextEditingController();
  InitializationController initializationController =
      Get.put(InitializationController());
  User user = User();
  final _formKey = GlobalKey<FormState>();

  File? profilePic;
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
                  color: BrandColor.main_color,
                ),
                width: double.infinity,
                height: headerHeight,
                child: Center(
                    child: customHeading("Create an account", 25, null,
                        BrandColor.in_background, FontWeight.w500)),
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
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                familyForm("Name", "Enter your name",
                                    textEditingController: nameController),
                                familyForm(
                                    "Email address", "Enter email address",
                                    textEditingController: emailController,
                                    textInputType: TextInputType.emailAddress),
                                familyForm("Phone number", "Enter phone number",
                                    textEditingController: phoneController,
                                    validatePhoneNumber: true,
                                    textInputType: TextInputType.phone),
                                familyForm("Password", "Enter password",
                                    textEditingController: passwordController,
                                    hideText: true,
                                    textInputType:
                                        TextInputType.visiblePassword),
                                familyForm(
                                    "Confirm password", "Repeat password",
                                    textEditingController:
                                        repeatPasswordController,
                                    hideText: true,
                                    password: passwordController.text,
                                    comparePassword: true,
                                    textInputType:
                                        TextInputType.visiblePassword),
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
              ),
              Positioned(
                  bottom: bottomHeight - 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          user.pickProfileImage().then((value) {
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
                                      profilePic!,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                      ),
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
                      GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (profilePic != null) {
                                // print("Registration");
                                user.type = initializationController.as.value;
                                user.name = nameController.text;
                                user.email = emailController.text;
                                user.phone = phoneController.text;
                                user.password = passwordController.text;
                                user.registerUser();
                              } else {
                                errorToast("Upload profile picture");
                              }
                            }
                          },
                          child: customButton("Register")),
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
