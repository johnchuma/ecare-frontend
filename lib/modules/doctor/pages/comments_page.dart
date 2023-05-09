// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/comment.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class CommentsPage extends StatelessWidget {
  Post post;
  CommentsPage(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BrandColor.in_background,
          elevation: 0,
          // ignore: prefer_const_constructors
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: customHeading("Comments"),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 90,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ValueListenableBuilder(
                    valueListenable: Hive.box<Post>('posts').listenable(),
                    builder: (context, box, widget) {
                      List<Post>? posts = box.values.toList();
                      return Expanded(
                        child: ListView(
                          children: posts
                              .where((element) => element.uuid == post.uuid)
                              .first
                              .comments
                              .map((item) => comment(item))
                              .toList(),
                        ),
                      );
                    }),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 15,
              left: 15,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            maxLines: 4,
                            minLines: 1,
                            controller: commentController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 14),
                                hintText: "Type your comment here..."),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (commentController.text.isNotEmpty) {
                        post.addComment(commentController.text);
                      }
                    },
                    child: ClipOval(
                      child: Container(
                        height: 50,
                        width: 50,
                        color: BrandColor.main_color,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
