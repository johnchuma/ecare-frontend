import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/doctor/models/article_bookmark.dart';
import 'package:doctor/modules/patients/pages/read_article.dart';
import 'package:doctor/modules/patients/pages/read_bookmark-article.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

Widget articleView(Article article, {ArticleBookmark? bookmark}) {
  return GestureDetector(
    onTap: () {
      if (bookmark != null) {
        Get.to(() => ReadBookmarkArticle(bookmark));
      } else {
        Get.to(() => ReadArticle(article));
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                imageUrl: article.images.first.picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customHint(Jiffy(article.createdAt).fromNow()),
                customHeading(article.title, 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: customText(
                            article.category.name, BrandColor.main_color, 12),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
