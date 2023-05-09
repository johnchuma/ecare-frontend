// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor/modules/doctor/models/post_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPostImages extends StatelessWidget {
  List<PostImage> postImages = [];
  int currentPage;
  ViewPostImages(this.postImages, this.currentPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: CarouselSlider(
          items: postImages
              .map((item) => SizedBox(
                  width: double.infinity,
                  child: Hero(
                    tag: item.picture,
                    child: CachedNetworkImage(
                      imageUrl: item.picture,
                      fit: BoxFit.cover,
                    ),
                  )))
              .toList(),
          options: CarouselOptions(
            initialPage: currentPage,
            viewportFraction: 1,
            aspectRatio: 3 / 4,
            enlargeCenterPage: false,
          ),
        ),
      ),
    );
  }
}
