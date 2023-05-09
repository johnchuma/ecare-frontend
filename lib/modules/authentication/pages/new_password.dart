// ignore_for_file: must_be_immutable, unused_local_variable, sized_box_for_whitespace

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:get/get.dart';

class NewPasswordPage extends StatelessWidget {
  User user;
  NewPasswordPage(this.user, {super.key});
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height / 3;
    double bottomHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height / 3;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: BrandColor.in_background,
        leadingWidth: 40,
        title: customHeading(
          "Create new password",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(00),
                  child: Container(
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
                              familyForm(
                                  "Recovery code", "Enter code we sent you",
                                  textEditingController: codeController),
                              familyForm("New password", "Your name",
                                  textEditingController: passwordController,
                                  hideText: true),
                              familyForm("Repeat password", "Your name",
                                  textEditingController:
                                      repeatPasswordController,
                                  hideText: true,
                                  comparePassword: true,
                                  password: passwordController.text),
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
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              user.code = codeController.text;
                              user.password = passwordController.text;
                              user.updatePassword();
                            }
                          },
                          child: customButton("Save password")),
                      const SizedBox(
                        height: 10,
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
