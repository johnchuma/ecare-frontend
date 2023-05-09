import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';

import 'package:flutter/material.dart';

Widget notification() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                color: Colors.blue.withOpacity(0.1),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                ))),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHeading("Notification from dr isack", 16),
              customHint(
                  "Mollit consectetur consectetur anim deserunt laborum. Nostrud")
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        customHint("21 mins")
      ],
    ),
  );
}
