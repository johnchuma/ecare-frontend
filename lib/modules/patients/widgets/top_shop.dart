// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/patients/widgets/home_category_item.dart';
import 'package:doctor/modules/shop/categories_page.dart';
import 'package:doctor/modules/shop/products_page.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

Widget topShop() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: Photos.shop,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 5,
              width: 15,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 5,
              width: 30,
              color: Colors.orange,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 5,
              width: 15,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customHeading("Categories", 18),
          const Spacer(),
          GestureDetector(
              onTap: () {
                Get.to(() => const CategoriesPage());
              },
              child: customHeading("Show all", 14, null, Colors.orange)),
          const Icon(
            MaterialCommunityIcons.chevron_double_right,
            size: 20,
            color: Colors.orange,
          )
        ],
      ),
      SizedBox(
        height: 160,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            homeCategoryItem(Photos.pic2),
            homeCategoryItem(Photos.pic3),
            homeCategoryItem(Photos.pic4),
            homeCategoryItem(Photos.pic2),
            homeCategoryItem(Photos.pic3),
            homeCategoryItem(Photos.pic4),
          ]
              .map((item) => GestureDetector(
                  onTap: () {
                    Get.to(() => const ProductsPage());
                  },
                  child: item))
              .toList(),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}
