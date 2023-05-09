// ignore_for_file: import_of_legacy_library_into_null_safe, sized_box_for_whitespace, prefer_const_constructors, file_names

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/patients/widgets/search_and_filter.dart';
import 'package:doctor/modules/patients/widgets/wishlist.dart';
import 'package:doctor/modules/pharmacy/controllers/product_controller.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/modules/pharmacy/pharmacy_add_product_page.dart';
import 'package:doctor/modules/shop/shopping_cart.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PharmacyProductPage extends StatefulWidget {
  const PharmacyProductPage({super.key});

  @override
  State<PharmacyProductPage> createState() => _PharmacyProductPageState();
}

class _PharmacyProductPageState extends State<PharmacyProductPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    ProductController().getProducts();
    super.initState();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leading: backArrow(),
        title: customHeading("Products", 18),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => ShoppingCart());
            },
            child: Icon(
              MaterialCommunityIcons.cart,
              color: BrandColor.text_color,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => PharmacyAddProductPage());
            },
            child: Icon(
              MaterialCommunityIcons.plus,
              color: BrandColor.text_color,
            ),
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
            searchAndFilter(searchController, function: refresh),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: Hive.box<Product>('products').listenable(),
                  builder: (context, box, widget) {
                    List<Product>? products = box.values
                        .toList()
                        .reversed
                        .toList()
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()))
                        .toList();
                    return ListView(
                      children:
                          products.map((product) => wishlist(product)).toList(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
