// ignore_for_file: import_of_legacy_library_into_null_safe, sized_box_for_whitespace, prefer_const_constructors, unused_import

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/patients/widgets/search_and_filter.dart';
import 'package:doctor/modules/patients/widgets/wishlist.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leading: backArrow(),
        title: customHeading("Fruits", 20),
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
            searchAndFilter(searchController),
            Expanded(
              child: ListView(
                children: const [
                  // wishlist(), wishlist(), wishlist()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
