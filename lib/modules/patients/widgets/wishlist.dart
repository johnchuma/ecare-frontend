// ignore_for_file: unnecessary_import, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/modules/shop/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget wishlist(Product product) {
  return GestureDetector(
    onTap: () {
      Get.to(() => ProductDetails(product));
    },
    child: Container(
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 150,
                      width: 120,
                      child: CachedNetworkImage(
                        imageUrl: product.productImages.first.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 30,
                right: 10,
                child: Icon(
                  Icons.favorite,
                  color: Colors.orange,
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 30,
                  child: Center(
                    child: Container(
                      height: 20,
                      color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: customHeading(
                            "${product.discountPercent()}% OFF",
                            12,
                            null,
                            Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHeading(product.name, 15),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15,
                  ),
                  customText("4.3", null, 13),
                  const SizedBox(
                    width: 20,
                  ),
                  customText("45 ratings", Colors.orange, 13),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  customHeading("\$${product.price - product.discount}", 14),
                  const SizedBox(
                    width: 10,
                  ),
                  customHeading("\$${product.price}", 14, null, Colors.black38,
                      null, TextDecoration.lineThrough),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.discount,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customHint(
                      "${product.discountPercent()}% off up to \$${product.discount}"),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
