import 'package:doctor/includes/custom_hint.dart';
import 'package:flutter/material.dart';

Widget attachmentOption(
  String title,
  IconData icon,
  Color color,
) {
  return Column(
    children: [
      ClipOval(
        child: Container(
            color: color.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Icon(
                icon,
                size: 25,
                color: Colors.white,
              ),
            )),
      ),
      const SizedBox(
        height: 5,
      ),
      customHint(title)
    ],
  );
}
