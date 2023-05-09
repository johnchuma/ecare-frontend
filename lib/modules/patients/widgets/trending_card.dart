import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/modules/patients/pages/read_article.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget trendingCard(BuildContext context, Article article) {
  return GestureDetector(
    onTap: () => {Get.to(() => ReadArticle(article))},
    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width - 130,
                child: CachedNetworkImage(
                  imageUrl: article.images.first.picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            customHeading(article.title, 16)
          ],
        ),
      ),
    ),
  );
}
