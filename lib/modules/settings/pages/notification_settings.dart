// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/settings/widgets/custom_switch.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  String currentCategory = "Newest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        title: customHeading("Notifications", 18),
        actions: const [],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customSwitch("General notifications", true),
              customSwitch("Sound", true),
              customSwitch("Vibrate", false),
              customSwitch("Special offers", true),
              customSwitch("Payments", true),
              customSwitch("Cashbook", false),
              customSwitch("App update", true),
              customSwitch("New service available", false),
              customSwitch("New tips available", false),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
