import 'package:doctor/includes/cutome_text2.dart';
import 'package:flutter/material.dart';

Widget status(int number, String name, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Text(
                    "$number+",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: color),
                  ),
                  customText2(name)
                ],
              )),
        ),
      ],
    ),
  );
}
