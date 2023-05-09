// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/patients/widgets/hospital.dart';
import 'package:doctor/modules/shop/shop_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalProfile extends StatelessWidget {
  const HospitalProfile({super.key});
  @override
  Widget build(BuildContext context) {
    var images = [
      {"image": 'https://picsum.photos/300', "name": "Jackson"},
      {"image": 'https://picsum.photos/302', "name": "Meland"},
      {"image": 'https://picsum.photos/303', "name": "Jackson"},
      {"image": 'https://picsum.photos/307', "name": "Meland"},
      {"image": 'https://picsum.photos/309', "name": "Jackson"},
      {"image": 'https://picsum.photos/310', "name": "Meland"},
      {"image": 'https://picsum.photos/320', "name": "Jackson"},
      {"image": 'https://picsum.photos/312', "name": "Meland"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        centerTitle: false,
        title: customHeading("Profile", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
              ),
              hospital(Photos.doctor2),
              const SizedBox(
                height: 20,
              ),
              customHeading("Doctors", 14),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: images
                      .map((image) => Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                customAvatar(50, image['image']!),
                                customHint(image['name']!)
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: customButton(
                          'Posts', BrandColor.main_color, null, 30, 13)),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: customButton(
                          'Articles', BrandColor.main_color, null, 30, 13)),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: customButton(
                          'Products', BrandColor.main_color, null, 30, 13))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 5,
                    children: images
                        .map((image) => GestureDetector(
                              onTap: () {
                                Get.to(() => const ShopPage());
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                    imageUrl: image['image']!,
                                    fit: BoxFit.cover),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
