// ignore_for_file: unused_import, implementation_imports, unnecessary_import, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/modules/patients/widgets/summary.dart';
import 'package:doctor/modules/pharmacy/controllers/product_controller.dart';
import 'package:doctor/modules/pharmacy/model/cart.dart';
import 'package:doctor/modules/pharmacy/widgets/cart_product.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  void initState() {
    ProductController().getCartProducts();
    super.initState();
  }

  double totalPrice(List<Cart> cart) {
    double totalPrice = 0;
    for (var product in cart) {
      totalPrice = product.product.cartPrice() + totalPrice;
    }
    return totalPrice;
  }

  void refresh(cart) {
    setState(() {
      totalPrice(cart);
    });
  }

  List<Cart> cartList = [];
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
            Icons.arrow_back,
            color: BrandColor.text_color,
          ),
        ),
        title: customHeading("Shopping cart", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 80,
              child: ValueListenableBuilder(
                  valueListenable: Hive.box<Cart>('cart').listenable(),
                  builder: (context, box, widget) {
                    List<Cart>? cart = box.values.toList();
                    cartList = cart;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: cart
                                  .map((item) =>
                                      CartProduct(item, refresh, cart))
                                  .toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customHeading("Total order price", 18),
                              customHeading("\$${totalPrice(cart)}", 18),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),

              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         color: Colors.grey[200],
              //         child: TextFormField(
              //           decoration: const InputDecoration(
              //               prefixIcon: Icon(Octicons.package),
              //               border: InputBorder.none,
              //               hintText: "Promo code"),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     customButton("Apply", Colors.orange[800],
              //         BrandColor.in_background, 35)
              //   ],
              // )
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                    onTap: () {
                      ProductController().orderCartProducts(cartList);
                    },
                    child: customButton("Check out")))
          ],
        ),
      ),
    );
  }
}
