// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/pill.dart';
import 'package:doctor/modules/doctor/controllers/article_controlller.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/doctor/models/article_category.dart';
import 'package:doctor/modules/doctor/pages/create_articles_page.dart';
import 'package:doctor/modules/patients/pages/articles_bookmarks.dart';
import 'package:doctor/modules/patients/pages/search_articles.dart';
import 'package:doctor/modules/patients/widgets/articles_view.dart';
import 'package:doctor/modules/patients/widgets/trending_card.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  void initState() {
    ArticleController().getArticleCategories();
    ArticleController().getArticles();

    super.initState();
  }

  String currentCategory = "";
  String currentArticleUuid = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        title: customHeading("Articles", 18),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: BrandColor.text_color,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const SearchArticles());
            },
            child: const Icon(
              AntDesign.search1,
              size: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: (() {
              Get.to(() => const ArticlesBookmarks());
            }),
            child: const Icon(
              Icons.bookmark,
              size: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: (() {
              Get.to(() => const CreateArticlesPage());
            }),
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customHeading("Trending", 18),
                  GestureDetector(
                      onTap: (() {
                        Get.to(() => const SearchArticles());
                      }),
                      child: customHeading("See all", 12, null, Colors.grey))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                  valueListenable: Hive.box<Article>('articles').listenable(),
                  builder: (context, box, widget) {
                    List<Article>? articles = box.values.toList();
                    return SizedBox(
                        height: 210,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: articles.reversed
                                .toList()
                                .map((item) => trendingCard(context, item))
                                .toList()));
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customHeading("Article", 18),
                  GestureDetector(
                      onTap: (() {
                        Get.to(() => const SearchArticles());
                      }),
                      child: customHeading("See all", 12, null, Colors.grey))
                ],
              ),
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
                                      currentCategory = item.uuid;
                                    });
                                  },
                                  child: pill(item.name,
                                      active: currentCategory == item.uuid),
                                ))
                            .toList(),
                      );
                    }),
              ),
              ValueListenableBuilder(
                  valueListenable: Hive.box<Article>('articles').listenable(),
                  builder: (context, box, widget) {
                    List<Article>? articles = box.values.toList();
                    return Column(
                        children: articles
                            .where((item) =>
                                item.category.uuid.contains(currentCategory))
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
