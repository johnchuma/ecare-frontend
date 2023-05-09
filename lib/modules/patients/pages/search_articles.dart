// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/pill.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/controllers/article_controlller.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/doctor/models/article_category.dart';
import 'package:doctor/modules/patients/widgets/articles_view.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchArticles extends StatefulWidget {
  const SearchArticles({super.key});

  @override
  State<SearchArticles> createState() => _SearchArticlesState();
}

class _SearchArticlesState extends State<SearchArticles> {
  String currentArticleUuid = "Newest";
  String currentCategory = "";

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    ArticleController().getArticleCategories();
    ArticleController().getArticles();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  style: const TextStyle(fontSize: 13),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search article",
                      hintStyle: TextStyle(fontSize: 13)),
                ),
              )),
        ),
        // actions: [
        //   GestureDetector(
        //     onTap: (() {
        //       Get.to(() => Container());
        //     }),
        //     child: const Icon(
        //       AntDesign.message1,
        //       size: 20,
        //       color: Colors.black,
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 10,
        //   )
        // ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 38,
                child: ValueListenableBuilder(
                    valueListenable:
                        Hive.box<ArticleCategory>('article_categories')
                            .listenable(),
                    builder: (context, box, widget) {
                      List<ArticleCategory>? articleCategories = [];
                      articleCategories.add(ArticleCategory.fromJson(
                          {"uuid": "", "name": "All"}));
                      articleCategories.addAll(box.values.toList());
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: articleCategories
                            .map((item) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      setState(() {
                                        currentCategory = item.uuid;
                                      });
                                    });
                                  },
                                  child: pill(item.name,
                                      active: currentCategory == item.uuid),
                                ))
                            .toList(),
                      );
                    }),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                  valueListenable: Hive.box<Article>('articles').listenable(),
                  builder: (context, box, widget) {
                    List<Article>? articles = box.values.toList();
                    return Column(
                        children: articles
                            .where((item) =>
                                item.category.uuid.contains(currentCategory))
                            .where((item) => item.title
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase()))
                            .map((item) => articleView(item))
                            .toList());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
