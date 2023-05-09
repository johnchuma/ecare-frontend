// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors, unused_import
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/patients/widgets/top_shop.dart';
import 'package:doctor/modules/shop/product_details.dart';
import 'package:doctor/modules/shop/products_page.dart';
import 'package:doctor/modules/patients/widgets/popular.dart';
import 'package:doctor/modules/patients/widgets/search_and_filter.dart';
import 'package:doctor/modules/patients/widgets/wishlist.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leading: backArrow(),
        centerTitle: true,
        title: searchAndFilter(searchController),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            topShop(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customHeading("Popular deals", 18),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const ProductsPage());
                    },
                    child: customHeading("Show all", 14, null, Colors.orange)),
                const Icon(
                  MaterialCommunityIcons.chevron_double_right,
                  size: 20,
                  color: Colors.orange,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  popularProducts(Photos.product1),
                  popularProducts(Photos.product2),
                  popularProducts(Photos.product3),
                  popularProducts(Photos.product4),
                ]
                    .map((item) => GestureDetector(
                        onTap: () {
                          // Get.to(() => ProductDetails());
                        },
                        child: item))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            customHeading("All glocery", 18),
            // wishlist()
          ],
        ),
      ),
    );
  }
}
