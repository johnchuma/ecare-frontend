import 'package:doctor/includes/custom_heading.dart';
import 'package:flutter/material.dart';

Widget settingOption(IconData icon, String title,
    {Widget? widget, Function? function}) {
  return GestureDetector(
    onTap: () {
      if (function != null) {
        function();
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black54,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          customHeading(title, 15),
          const Spacer(),
          widget ?? Container(),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16,
          )
        ],
      ),
    ),
  );
}
