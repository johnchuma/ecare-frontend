// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LangaugePage extends StatefulWidget {
  const LangaugePage({super.key});

  @override
  State<LangaugePage> createState() => _LangaugePageState();
}

class _LangaugePageState extends State<LangaugePage> {
  String currentCategory = "Newest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        title: customHeading("Language", 18),
        actions: const [],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHeading("Available", 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText("English (UK)"),
                  Radio(
                      value: "true", groupValue: "true", onChanged: (value) {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
