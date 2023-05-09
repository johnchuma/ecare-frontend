import 'package:doctor/includes/chart2.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget analytics() {
  return Column(
    children: [
      const SizedBox(height: 200, child: LineChartSample2()),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ListTile(
          tileColor: Colors.grey[200],
          title: customHeading("Abril"),
          subtitle: customHint("Infrome complete"),
          trailing: ClipOval(
            child: Container(
                height: 50,
                width: 50,
                color: Colors.grey[200],
                child: Icon(
                  Icons.list,
                  color: BrandColor.main_color,
                )),
          ),
        ),
      ),
      const SizedBox(height: 200, child: LineChartSample2()),
    ],
  );
}
