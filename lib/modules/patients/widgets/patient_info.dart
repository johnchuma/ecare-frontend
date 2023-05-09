import 'package:doctor/includes/custom_hint.dart';
import 'package:flutter/cupertino.dart';

Widget patientInfo(String left, String right) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHint(left),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [customHint(right)],
          ),
        )
      ],
    ),
  );
}
