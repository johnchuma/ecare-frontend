// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/doctor/models/article_bookmark.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ReadBookmarkArticle extends StatelessWidget {
  ArticleBookmark bookmark;

  ReadBookmarkArticle(this.bookmark, {super.key});

  String currentCategory = "Newest";
  @override
  Widget build(BuildContext context) {
    Article article = bookmark.article;

    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        actions: [
          GestureDetector(
            onTap: () {
              if (article.isBookmarked) {
                bookmark.removeBookmark();
              } else {
                article.bookmarkArticle();
              }
            },
            child: Icon(
              article.isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              size: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            AntDesign.sharealt,
            size: 20,
            color: Colors.black,
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: (() {
              Get.to(() => Container());
            }),
            child: const Icon(
              AntDesign.message1,
              size: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
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
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                      imageUrl: article.images.first.picture)),
              customHeading(article.title),
              Row(
                children: [
                  customHint(Jiffy(article.createdAt).fromNow()),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child:
                              customText("Health", BrandColor.main_color, 12),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              customText(article.description),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
