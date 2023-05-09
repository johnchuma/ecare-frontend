// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/doctor/models/post.dart';
import 'package:doctor/modules/doctor/pages/comments_page.dart';
import 'package:doctor/modules/doctor/pages/view_article_images.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class PostItem extends StatefulWidget {
  Post post;
  PostItem(this.post, {super.key});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                customAvatar(40, widget.post.creator.image),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading(widget.post.creator.name, 16),
                      customHint(
                        Jiffy(widget.post.createdAt).fromNow(),
                        null,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.post.deletePost();
                  },
                  child: const Icon(
                    AntDesign.delete,
                    size: 17,
                  ),
                )
              ],
            ),
            customText(widget.post.caption, null, 13),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() =>
                          ViewPostImages(widget.post.images, currentPage));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CarouselSlider(
                            items: widget.post.images
                                .map((image) => SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Hero(
                                        tag: image.picture,
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: image.picture),
                                      ),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlay: true,
                              onPageChanged: ((index, reason) {
                                setState(() {
                                  currentPage = index;
                                });
                              }),
                            ))),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                      children: widget.post.images
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: ClipOval(
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    color: item.uuid ==
                                            widget.post.images[currentPage].uuid
                                        ? BrandColor.main_color
                                        : Colors.grey[300],
                                  ),
                                ),
                              ))
                          .toList())
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Stack(
                    children: widget.post.likes
                        .take(4)
                        .map((item) => Positioned(
                            child: customAvatar(25, item.user.image)))
                        .toList(),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    widget.post.isLiked()
                        ? widget.post.findMyLike().removeLike()
                        : widget.post.likePost();
                  },
                  child: Row(
                    children: [
                      widget.post.likes
                              .where((like) =>
                                  like.user.email == getMyInfo().email)
                              .isNotEmpty
                          ? const Icon(
                              AntDesign.heart,
                              size: 15,
                              color: Colors.red,
                            )
                          : Icon(
                              AntDesign.hearto,
                              size: 15,
                              color: Colors.grey[600],
                            ),
                      const SizedBox(
                        width: 5,
                      ),
                      customHeading(widget.post.likes.length.toString(), 13),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => CommentsPage(widget.post));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        AntDesign.message1,
                        size: 15,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      customHeading(widget.post.comments.length.toString(), 13)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
