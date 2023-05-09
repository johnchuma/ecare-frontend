// ignore_for_file: unnecessary_import, unused_import

import 'package:doctor/includes/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customPill(String text, Color bg, Color textColor, bool withIcon,
    {double? vertical,
    double? horizontal,
    IconData? icon,
    double? textSize,
    double? iconSize}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(40),
    child: Container(
      color: bg,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontal ?? 15, vertical: vertical ?? 3),
          child: Row(
            children: [
              withIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(
                        icon ?? Icons.add,
                        color: textColor,
                        size: iconSize ?? 17,
                      ),
                    )
                  : Container(),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: textSize ?? 12),
              ),
            ],
          )),
    ),
  );
}
