// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/pharmacy/model/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:random_color/random_color.dart';

class OrderWidget extends StatefulWidget {
  Order order;

  Color? color;
  OrderWidget(this.order, {super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

bool expanded = false;

class _OrderWidgetState extends State<OrderWidget> {
  RandomColor generate = RandomColor();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        color: widget.order.getColor().withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(MaterialCommunityIcons.calendar,
                              size: 30, color: widget.order.getColor()),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customHeading(
                            "Order ID ${widget.order.uuid.characters.take(5).join("")}",
                            16),
                        customHint("12 items on Delivery")
                      ],
                    ),
                  ),
                  const SizedBox(),
                  const Icon(
                    MaterialCommunityIcons.chevron_down,
                    color: Colors.grey,
                  )
                ],
              ),
              expanded
                  ? Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: true,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {}),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customHeading("Order placed", 14),
                                  customHint("12:50 PM 19 Jun 2022")
                                ],
                              )
                            ],
                          ),Navigator.pushReplacementNamed
                          Row(
                            children: [
                              Checkbox(
                                  value: false,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {}),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customHeading("Order confirmed", 15),
                                  customHint("12:50 PM 19 Jun 2022")
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: false,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {}),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customHeading(
                                      "Order order is on delevery", 15),
                                  customHint("12:50 PM 19 Jun 2022")
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: false,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {}),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customHeading("Order Delivery", 15),
                                  customHint("12:50 PM 19 Jun 2022")
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
