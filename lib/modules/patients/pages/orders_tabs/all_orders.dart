// ignore_for_file: implementation_imports

import 'package:doctor/modules/patients/widgets/order_widget.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../pharmacy/model/order.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<Order>('orders').listenable(),
        builder: (context, box, widget) {
          List<Order>? orders = box.values.toList();
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView(
              children: orders
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: OrderWidget(item),
                      ))
                  .toList(),
            ),
          );
        });
  }
}
