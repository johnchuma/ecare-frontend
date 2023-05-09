// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe, unused_import

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/initialization/pages/waypage_page.dart';
import 'package:doctor/modules/patients/pages/patient_index.dart';
import 'package:doctor/modules/settings/pages/edit_profile.dart';
import 'package:doctor/modules/settings/pages/help_center.dart';
import 'package:doctor/modules/settings/pages/invite_friends.dart';
import 'package:doctor/modules/settings/pages/language_page.dart';
import 'package:doctor/modules/settings/pages/notification_settings.dart';
import 'package:doctor/modules/settings/pages/payment_cards_page.dart';
import 'package:doctor/modules/settings/pages/security_page.dart';
import 'package:doctor/modules/settings/widgets/setting_option.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/custom_dialogs.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String currentCategory = "Newest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        title: customHeading("Profile", 18),
        actions: [
          GestureDetector(
            onTap: (() {
              Get.to(() => Container());
            }),
            child: const Icon(
              AntDesign.message1,
              size: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              customAvatar(100, Photos.doctor3),
              customHeading("Dr Grace JR"),
              const SizedBox(
                height: 2,
              ),
              customHint("+25562779239"),
              const SizedBox(
                height: 20,
              ),
              settingOption(AntDesign.user, "Edit Profile", function: () {
                Get.to(() => const EditProfile());
              }),
              settingOption(Icons.notifications_none, "Notification",
                  function: () {
                Get.to(() => const NotificationSettings());
              }),
              settingOption(Octicons.credit_card, "Payments", function: () {
                Get.to(() => const PaymentCardsPage());
              }),
              settingOption(Octicons.lock, "Security", function: () {
                Get.to(() => const SecurityPage());
              }),
              settingOption(Icons.language, "Language",
                  widget: customHint("English (Us)"), function: () {
                Get.to(() => const LangaugePage());
              }),
              Row(
                children: [
                  const Icon(
                    Octicons.light_bulb,
                    color: Colors.black54,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customHeading(
                    "Dark mode",
                    15,
                  ),
                  const Spacer(),
                  Switch(value: false, onChanged: (value) {})
                ],
              ),
              settingOption(Icons.help_center_outlined, "Help center",
                  function: () {
                Get.to(() => const HelpCenter());
              }),
              settingOption(Icons.insert_invitation, "Invite friends",
                  function: () {
                Get.to(() => const InviteFriends());
              }),
              Row(
                children: [
                  const Icon(
                    Octicons.sign_out,
                    color: Colors.red,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        child: Container(
                          color: BrandColor.in_background,
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                customHeading(
                                    "Logout", 20, TextAlign.center, Colors.red),
                                const SizedBox(
                                  height: 20,
                                ),
                                customHeading(
                                    "Are you sure you want to logout ?", 13),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: customButton(
                                            "Cancel",
                                            Colors.grey[200],
                                            BrandColor.main_color),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Box box = Boxes.getUsers();
                                          User me = box.get('me');
                                          me.tokens = "";
                                          me.save();
                                          Get.back();
                                          Get.to(() => const WayPage());
                                        },
                                        child: customButton(
                                            "Yes, logout",
                                            BrandColor.main_color,
                                            BrandColor.in_background,
                                            null,
                                            13),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )),
                        ),
                      ));
                    },
                    child: customHeading(
                      "Logout",
                      15,
                      null,
                      Colors.red,
                    ),
                  ),
                ],
              ),
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
