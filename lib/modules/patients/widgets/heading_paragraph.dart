import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:flutter/cupertino.dart';

Widget headingParagraph(String heading, String paragraph) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customHeading(heading, 16),
      customHint(
        paragraph,
      ),
    ],
  );
}
