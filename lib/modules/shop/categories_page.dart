// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/shop/products_page.dart';
import 'package:doctor/modules/patients/widgets/category.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leading: backArrow(),
        title: customHeading("Categories", 20),
        actions: [
          Icon(
            MaterialCommunityIcons.dots_vertical,
            color: BrandColor.text_color,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  category(),
                  category(image: Photos.pic2),
                  category(image: Photos.pic4),
                  category(),
                  category(image: Photos.pic2),
                  category(image: Photos.pic4),
                ]
                    .map((item) => GestureDetector(
                        onTap: (() {
                          Get.to(() => const ProductsPage());
                        }),
                        child: item))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
