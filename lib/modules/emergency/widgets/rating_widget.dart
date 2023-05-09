import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:flutter/material.dart';

Widget ratingWIdget(String title, String subtitle) {
  return Row(
    children: [
      Icon(
        Icons.star,
        size: 16,
        color: Colors.orange[800],
      ),
      const SizedBox(
        width: 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customHint(title),
          customText(subtitle, null, 14),
        ],
      ),
    ],
  );
}
