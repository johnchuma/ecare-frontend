import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/patients/pages/orders_tabs/all_orders.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    List tabs = [
      {
        'title': 'All',
        "view": const AllOrders(),
        'icon': ClipOval(
            child: Container(
          height: 10,
          width: 10,
          color: Colors.transparent,
        ))
      },
      {
        'title': 'On delivery',
        "view": const AllOrders(),
        'icon': ClipOval(
            child: Container(
          height: 10,
          width: 10,
          color: Colors.orange,
        ))
      },
      {
        'title': 'Completed',
        "view": const AllOrders(),
        'icon': ClipOval(
            child: Container(height: 10, width: 10, color: Colors.green))
      },
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: BrandColor.in_background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColor.in_background,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: customHeading("My orders", 18),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.orange,
              labelColor: Colors.black,
              tabs: tabs
                  .map((tab) => Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            tab['title'] == "All" ? Container() : tab['icon'],
                            const SizedBox(
                              width: 5,
                            ),
                            Text(tab['title'])
                          ],
                        ),
                      ))
                  .toList()),
        ),
        body: TabBarView(
            children: tabs
                .map((item) => Container(
                      child: item['view'],
                    ))
                .toList()),
      ),
    );
  }
}
