import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/doctor/models/post_comment.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

Widget comment(PostComment comment) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            customAvatar(40, comment.user.image),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHeading(comment.user.name, 16),
              customHint(comment.comment)
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        customText(Jiffy(comment.createdAt).fromNow(), null, 12)
      ],
    ),
  );
}
