// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/pill.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/controllers/post_controller.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/doctor/models/article_category.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: implementation_imports

class CreateArticlesPage extends StatefulWidget {
  const CreateArticlesPage({super.key});

  @override
  State<CreateArticlesPage> createState() => _CreateArticlesPageState();
}

class _CreateArticlesPageState extends State<CreateArticlesPage> {
  @override
  void initState() {
    PostController().getPostCategories();
    super.initState();
  }

  Article article = Article();
  var currentPostUuid = "";
  final _fromKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("Create new article", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 70,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Form(
                  key: _fromKey,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 80,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: ListView(
                        children: [
                          customHeading("Select article category", 15),
                          const SizedBox(
                            height: 5,
                          ),
                          ValueListenableBuilder(
                              valueListenable: Hive.box<ArticleCategory>(
                                      'article_categories')
                                  .listenable(),
                              builder: (context, box, widget) {
                                List<ArticleCategory>? articleCategories =
                                    box.values.toList();
                                return Wrap(
                                  children: articleCategories
                                      .map((item) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                currentPostUuid = item.uuid;
                                              });
                                            },
                                            child: pill(item.name,
                                                active: currentPostUuid ==
                                                    item.uuid),
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
                              customHeading("Add article images", 15),
                              GestureDetector(
                                  onTap: () {
                                    article.pickPostImages().then((value) {
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
                              children: article.imageFiles.isEmpty
                                  ? [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          color: Colors.grey[200],
                                          height: 100,
                                          width: 100,
                                          child: Icon(
                                            Icons.image,
                                            color: BrandColor.main_color,
                                          ),
                                        ),
                                      )
                                    ]
                                  : article.imageFiles
                                      .map((item) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                color: Colors.grey[200],
                                                height: 100,
                                                width: 100,
                                                child: Image.file(
                                                  item,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          familyForm(
                            "Title",
                            "Enter article title",
                            textEditingController: titleController,
                          ),
                          familyForm("Description", "Enter description title",
                              textEditingController: DescriptionController,
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
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      if (currentPostUuid == "" || article.imageFiles.isEmpty) {
                        errorToast("Please fill all fields before adding post");
                      } else {
                        if (_fromKey.currentState!.validate()) {
                          article.title = titleController.text;
                          article.description = DescriptionController.text;
                          article.category.uuid = currentPostUuid;

                          article.addArticle();
                        }
                      }
                    },
                    child: customButton("Add article", BrandColor.main_color,
                        BrandColor.in_background),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
