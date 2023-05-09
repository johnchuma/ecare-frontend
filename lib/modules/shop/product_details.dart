// ignore_for_file: import_of_legacy_library_into_null_safe, sized_box_for_whitespace, unused_import, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/patients/pages/appointmenttabs/canceled_tab.dart';
import 'package:doctor/modules/patients/widgets/category.dart';
import 'package:doctor/modules/patients/widgets/wishlist.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/modules/shop/shop_page.dart';
import 'package:doctor/modules/shop/shopping_cart.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductDetails(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leading: backArrow(),
        // actions: [
        //   Icon(
        //     MaterialCommunityIcons.heart,
        //     size: 25,
        //     color: BrandColor.text_color,
        //   ),
        //   const SizedBox(
        //     width: 20,
        //   ),
        //   Icon(
        //     MaterialCommunityIcons.dots_vertical,
        //     size: 25,
        //     color: BrandColor.text_color,
        //   ),
        //   const SizedBox(
        //     width: 15,
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: product.productImages.first.image,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customHeading(product.productCategory.name, 15, null,
                            BrandColor.main_color),
                        customHeading(product.name, 15, null),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            customHeading("\$150.00", 15),
                            const SizedBox(
                              width: 10,
                            ),
                            customHeading("\$150.00", 15, null, Colors.black38,
                                null, TextDecoration.lineThrough),
                            const Spacer(),
                            const Icon(Icons.remove),
                            const SizedBox(
                              width: 10,
                            ),
                            customHeading("3", 15),
                            const SizedBox(
                              width: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: Colors.grey[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: BrandColor.main_color,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.grey[100],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  customText("4.3 (48 reviews)"),
                                  const Spacer(),
                                  const Icon(
                                    Icons.delivery_dining,
                                    color: Colors.green,
                                  ),
                                  customText("Free delivery", Colors.green),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customHint(product.description),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            customHeading("Related products", 17),
                            const Spacer(),
                            customHeading(
                                "Show all", 13, null, BrandColor.main_color),
                            Icon(
                              MaterialCommunityIcons.chevron_double_right,
                              size: 15,
                              color: BrandColor.main_color,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: Photos.images
                                .map((image) => Padding(
                                      padding: const EdgeInsets.only(right: 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customAvatar(100, image['image']!,
                                              radius: 5),
                                          customHeading("Orange", 13),
                                          Row(
                                            children: [
                                              customHeading("\$150.00", 11),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              customHeading(
                                                  "\$150.00",
                                                  11,
                                                  null,
                                                  Colors.black38,
                                                  null,
                                                  TextDecoration.lineThrough),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: (() {
                  product.addToCart();
                }),
                child: Container(
                  color: BrandColor.in_background,
                  child: customButton(
                    "Add to cart",
                    BrandColor.main_color,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
