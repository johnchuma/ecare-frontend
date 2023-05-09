// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/patients/widgets/recent_search.dart';
import 'package:doctor/modules/patients/widgets/search_and_filter.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: BrandColor.in_background,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              AntDesign.close,
              size: 25,
              color: BrandColor.text_color,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchAndFilter(searchController),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customHeading("Recent searches", 18),
                const Spacer(),
                customHeading("Clear all", 14, null, Colors.orange),
              ],
            ),
            recentSearch("Potato"),
            recentSearch("Fried chicken"),
            recentSearch("Potato"),
            const SizedBox(
              height: 10,
            ),
            customHeading("Search result", 18),
            Expanded(
                child: ListView(
              children: const [
                // wishlist(image: Photos.shop), wishlist()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
