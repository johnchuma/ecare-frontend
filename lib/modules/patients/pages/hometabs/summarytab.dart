import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/patients/pages/doctors_page.dart';
import 'package:doctor/modules/patients/pages/posts_page.dart';
import 'package:doctor/modules/patients/widgets/caategory.dart';
import 'package:doctor/modules/patients/widgets/home_category_item.dart';
import 'package:doctor/modules/patients/widgets/nearby_doctors.dart';
import 'package:doctor/modules/patients/widgets/popular.dart';
import 'package:doctor/modules/patients/widgets/trending_post.dart';
import 'package:doctor/modules/shop/products_page.dart';
import 'package:doctor/modules/shop/shop_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryTab extends StatefulWidget {
  const SummaryTab({super.key});

  @override
  State<SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  String currentCategory = "Injection";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customHeading("Nearby doctors", 18),
                    GestureDetector(
                        onTap: (() {
                          Get.to(() => const DoctorsPage());
                        }),
                        child: customHeading(
                            "See all", 12, null, BrandColor.main_color))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const NearbyDoctors(),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customHeading("Trending posts", 18),
                    GestureDetector(
                        onTap: (() {
                          Get.to(() => const PostsPage());
                        }),
                        child: customHeading(
                            "See all", 12, null, BrandColor.main_color))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [trendingPost(), trendingPost(), trendingPost()]
                        .map((post) => GestureDetector(
                            onTap: () {
                              // Get.to(()=>)
                            },
                            child: post))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customHeading("Popular products", 18),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const ShopPage());
                        },
                        child: customHeading(
                            "See all", 12, null, BrandColor.main_color))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      homeCategoryItem(Photos.pic2),
                      homeCategoryItem(Photos.pic3),
                      homeCategoryItem(Photos.pic4),
                      homeCategoryItem(Photos.pic2),
                      homeCategoryItem(Photos.pic3),
                      homeCategoryItem(Photos.pic4),
                    ]
                        .map((item) => GestureDetector(
                            onTap: () {
                              Get.to(() => const ProductsPage());
                            },
                            child: item))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [],
          ),
          Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      'Injection',
                      "Inhaler",
                      'Drops',
                      'Capsules',
                      'Tablets',
                      'Liquid'
                    ]
                        .map((item) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentCategory = item;
                              });
                            },
                            child: Container(
                                child: productCategory(item,
                                    item == currentCategory ? true : false))))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      popularProducts(Photos.product1, width: 150),
                      popularProducts(Photos.product2, width: 150),
                      popularProducts(Photos.product3, width: 150),
                      popularProducts(Photos.product4, width: 150),
                    ]
                        .map((item) => GestureDetector(
                            onTap: () {
                              // Get.to(() => const ProductDetails());
                            },
                            child: item))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customHeading("Nearby pharmacies", 18),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const ShopPage());
                        },
                        child: customHeading(
                            "See all", 12, null, BrandColor.main_color))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [trendingPost(), trendingPost(), trendingPost()],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
