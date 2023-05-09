// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/patients/widgets/summary.dart';
import 'package:doctor/modules/pharmacy/model/cart.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  Cart cart;
  Function refresh;
  List<Cart> listCart;
  CartProduct(this.cart, this.refresh, this.listCart, {super.key});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.cart.showDetails = !widget.cart.showDetails;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey[100],
                  child: CachedNetworkImage(
                    imageUrl: widget.cart.product.productImages.first.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHeading(widget.cart.product.name, 15),
                    customHint(widget.cart.product.description),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customHeading(
                                "\$${widget.cart.product.cartPrice()} ", 13),
                            customHeading(
                                "\$${widget.cart.product.cartDiscount()}",
                                13,
                                null,
                                Colors.grey[500],
                                null,
                                TextDecoration.lineThrough),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.cart.product.total > 1) {
                                    widget.cart.product.total--;
                                    widget.refresh(widget.listCart);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            customHeading("${widget.cart.product.total}", 13),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.cart.product.total++;
                                  widget.refresh(widget.listCart);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          widget.cart.showDetails
              ? customHeading("Bill details", 15)
              : Container(),
          widget.cart.showDetails
              ? Material(
                  elevation: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      children: [
                        summary(
                            "Item total", widget.cart.product.total.toString()),
                        // summary("Delivery fee", "+ \$10.25"),
                        summary("Taxes and charge",
                            "\$${widget.cart.product.cartPrice()}")
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
