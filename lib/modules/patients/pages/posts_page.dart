// ignore_for_file: implementation_imports, import_of_legacy_library_into_null_safe, unnecessary_import

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/post_item.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/controllers/post_controller.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/modules/doctor/pages/create_post_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    PostController().getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        leading: backArrow(),
        title: customHeading("Posts ", 18),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const CreatePostPage());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.grey[100],
                  height: 30,
                  width: 40,
                  child: const Icon(
                    Octicons.plus,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ValueListenableBuilder(
            valueListenable: Hive.box<Post>('posts').listenable(),
            builder: (context, box, widget) {
              List<Post>? posts = box.values.toList();
              return ListView(
                children: posts.map((item) => PostItem(item)).toList(),
              );
            }),
      ),
    );
  }
}
