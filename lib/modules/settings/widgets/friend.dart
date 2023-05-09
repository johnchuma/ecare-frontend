import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:flutter/cupertino.dart';

Widget friend(String doctor) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        customAvatar(50, doctor),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customHeading("Jack Chan", 16),
            customHint("+1 3233 2323 2323")
          ],
        ),
        const Spacer(),
        customButton("Invite", null, null, 33)
      ],
    ),
  );
}
