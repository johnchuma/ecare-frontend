// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/settings/widgets/custom_switch.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  String currentCategory = "Newest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        title: customHeading("Security", 18),
        actions: const [],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customSwitch("Remember me", true),
              customSwitch("Price ID", true),
              customSwitch("Biometric ID", false),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Google authenticator", null, 15),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customButton("Change PIN", BrandColor.main_color.withOpacity(0.1),
                  BrandColor.main_color),
              const SizedBox(
                height: 10,
              ),
              customButton("Change Password",
                  BrandColor.main_color.withOpacity(0.1), BrandColor.main_color)
            ],
          ),
        ),
      ),
    );
  }
}
