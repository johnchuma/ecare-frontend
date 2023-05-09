import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget transaction() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(5),
      child: ListTile(
        leading: customAvatar(40,
            'https://s18798.pcdn.co/mavericklimccproject/wp-content/uploads/sites/14030/1986/06/Face-Profile-2-300x200.jpg'),
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Debit ', style: TextStyle(color: BrandColor.main_color)),
          const TextSpan(
              text: 'from John Chuma', style: TextStyle(color: Colors.black87))
        ])),
        subtitle: customHint('20 mins ago'),
        trailing: customHeading("\$230", 15),
      ),
    ),
  );
}
