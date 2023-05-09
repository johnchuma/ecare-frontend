// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_form.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  String currentCategory = "Newest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        title: customHeading("Edit profile", 18),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 90,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        customAvatar(100, Photos.doctor3),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ClipOval(
                            child: Container(
                                height: 40,
                                width: 40,
                                color: BrandColor.main_color,
                                child: Icon(
                                  Icons.edit,
                                  color: BrandColor.in_background,
                                )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customForm("John Doe", "Edit username", nameController),
                    customForm(
                        "0627792374", "Edit phone number", nameController),
                    customForm("johnvchuma@gmail.com", "Edit phone number",
                        nameController),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 10, right: 0, left: 0, child: customButton("Update"))
          ],
        ),
      ),
    );
  }
}
