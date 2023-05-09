// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/pill.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/controllers/post_controller.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/modules/doctor/models/post_category.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: implementation_imports

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  void initState() {
    PostController().getPostCategories();
    super.initState();
  }

  Post post = Post();
  var currentPostUuid = "";
  final _fromKey = GlobalKey<FormState>();
  TextEditingController captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("Post", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: _fromKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading("Select post category", 15),
                      const SizedBox(
                        height: 5,
                      ),
                      ValueListenableBuilder(
                          valueListenable:
                              Hive.box<PostCategory>('post_categories')
                                  .listenable(),
                          builder: (context, box, widget) {
                            List<PostCategory>? postCategories =
                                box.values.toList();
                            return Wrap(
                              children: postCategories
                                  .map((item) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentPostUuid = item.uuid;
                                          });
                                        },
                                        child: pill(item.name,
                                            active:
                                                currentPostUuid == item.uuid),
                                      ))
                                  .toList(),
                            );
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customHeading("Add post images", 15),
                          GestureDetector(
                              onTap: () {
                                post.pickPostImages().then((value) {
                                  setState(() {});
                                });
                              },
                              child: const Icon(Icons.add_a_photo))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: post.imageFiles.isEmpty
                              ? [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      color: Colors.grey[200],
                                      child: Icon(
                                        Icons.image,
                                        color: BrandColor.main_color,
                                      ),
                                      height: 100,
                                      width: 100,
                                    ),
                                  )
                                ]
                              : post.imageFiles
                                  .map((item) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            color: Colors.grey[200],
                                            height: 100,
                                            child: Image.file(
                                              item,
                                              fit: BoxFit.cover,
                                            ),
                                            width: 100,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      familyForm("Post caption", "Write your post here...",
                          textEditingController: captionController,
                          maxLines: 5),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    if (currentPostUuid == "" || post.imageFiles.isEmpty) {
                      errorToast("Please fill all fields before adding post");
                    } else {
                      if (_fromKey.currentState!.validate()) {
                        post.caption = captionController.text;
                        post.category.uuid = currentPostUuid;

                        post.addPost();
                      }
                    }
                  },
                  child: customButton("Add post", BrandColor.main_color,
                      BrandColor.in_background),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
