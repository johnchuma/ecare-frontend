// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/controllers/article_controlller.dart';
import 'package:doctor/modules/doctor/models/article_bookmark.dart';
import 'package:doctor/modules/patients/widgets/articles_view.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ArticlesBookmarks extends StatefulWidget {
  const ArticlesBookmarks({super.key});

  @override
  State<ArticlesBookmarks> createState() => _ArticlesBookmarksState();
}

class _ArticlesBookmarksState extends State<ArticlesBookmarks> {
  String currentCategory = "Newest";
  @override
  void initState() {
    ArticleController().getArticleBookmarks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        title: customHeading("My bookmarks", 18),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(
            AntDesign.search1,
            size: 20,
            color: Colors.black,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ValueListenableBuilder(
            valueListenable:
                Hive.box<ArticleBookmark>('article_bookmarks').listenable(),
            builder: (context, box, widget) {
              List<ArticleBookmark>? bookmarks = box.values.toList();
              return ListView(
                  children: bookmarks
                      .map((item) => articleView(item.article, bookmark: item))
                      .toList());
            }),
      ),
    );
  }
}
