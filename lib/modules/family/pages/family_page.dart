// ignore_for_file: implementation_imports, import_of_legacy_library_into_null_safe, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/family/pages/subpages/analytics.dart';
import 'package:doctor/modules/family/pages/subpages/files.dart';
import 'package:doctor/modules/family/pages/subpages/persciption.dart';
import 'package:doctor/modules/family/pages/subpages/reports.dart';
import 'package:doctor/modules/family/widget/heading_bottom_text.dart';
import 'package:doctor/modules/family/widget/medical_option.dart';
import 'package:doctor/modules/patients/widgets/icon_background.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  List subpages = [
    {
      'name': 'Medicines',
      'icon': MaterialCommunityIcons.periscope,
      'view': pescription()
    },
    {'name': 'Illness history', 'icon': Icons.history, 'view': pescription()},
    {'name': 'Events', 'icon': Icons.calendar_month, 'view': pescription()},
    {'name': 'Analytics', 'icon': Icons.analytics, 'view': analytics()},
    {'name': 'Reports', 'icon': Octicons.repo, 'view': reports()},
    {'name': 'Files', 'icon': AntDesign.file1, 'view': const Files()},
  ];

  var currentSubpage = 'Medicines';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
          backgroundColor: BrandColor.in_background,
          elevation: 0,
          leading: Container(),
          leadingWidth: 1,
          title: customHeading("My Family", 18),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ClipOval(
                child: SizedBox(
                  height: 20,
                  width: 36,
                  child: CachedNetworkImage(
                    imageUrl: Photos.pic1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ]),
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
                child: Container(
                  color: BrandColor.main_color,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            customAvatar(30, Photos.pic1),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customHeading("Monica", 15, null, Colors.white),
                                customHint("Daughter 15yrs A+ 155g 45kg", null,
                                    Colors.white)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(SingleChildScrollView(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Container(
                                  color: BrandColor.in_background,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 30),
                                    child: Column(
                                      children: [pescription()],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              color: Colors.black12,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                            child: Container(
                                          color: BrandColor.in_background,
                                          child: Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: customAvatar(30,
                                                  "https://freepngimg.com/thumb/pills/27320-1-pills-transparent-background.png")),
                                        )),
                                        ClipOval(
                                            child: Container(
                                          color: BrandColor.in_background,
                                          child: Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: customAvatar(30,
                                                  "https://upload.wikimedia.org/wikipedia/commons/0/0a/201306_needle_syringe.png")),
                                        )),
                                        const SizedBox(
                                          width: 21,
                                        ),
                                        Expanded(
                                            child: customHeading(
                                                "Varicela , No hispitalization",
                                                16,
                                                null,
                                                BrandColor.in_background))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: subpages
                      .map((item) => GestureDetector(
                            onTap: () {
                              Get.bottomSheet(SingleChildScrollView(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Container(
                                    color: BrandColor.in_background,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 30),
                                      child: Column(
                                        children: [
                                          item['name'] == "Illness history"
                                              ? SizedBox(
                                                  height: 125,
                                                  child: ListView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          iconBackground(
                                                              Octicons.home,
                                                              iconColor:
                                                                  BrandColor
                                                                      .main_color,
                                                              padding: 10,
                                                              iconSize: 25,
                                                              background: BrandColor
                                                                  .main_color
                                                                  .withOpacity(
                                                                      0.1)),
                                                          headingBottomText(
                                                              "2", "Covid"),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          iconBackground(
                                                              Octicons.database,
                                                              iconColor:
                                                                  BrandColor
                                                                      .main_color,
                                                              padding: 10,
                                                              iconSize: 25,
                                                              background: BrandColor
                                                                  .main_color
                                                                  .withOpacity(
                                                                      0.1)),
                                                          headingBottomText(
                                                              "2", "Flu"),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          iconBackground(
                                                              Octicons.verified,
                                                              iconColor:
                                                                  BrandColor
                                                                      .main_color,
                                                              padding: 10,
                                                              iconSize: 25,
                                                              background: BrandColor
                                                                  .main_color
                                                                  .withOpacity(
                                                                      0.1)),
                                                          headingBottomText(
                                                              "4", "Bacteria"),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          iconBackground(
                                                              Octicons
                                                                  .telescope,
                                                              iconColor:
                                                                  BrandColor
                                                                      .main_color,
                                                              padding: 10,
                                                              iconSize: 25,
                                                              background: BrandColor
                                                                  .main_color
                                                                  .withOpacity(
                                                                      0.1)),
                                                          headingBottomText(
                                                              "10", "Athma"),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          iconBackground(
                                                              Octicons.x,
                                                              iconColor:
                                                                  BrandColor
                                                                      .main_color,
                                                              padding: 10,
                                                              iconSize: 25,
                                                              background: BrandColor
                                                                  .main_color
                                                                  .withOpacity(
                                                                      0.1)),
                                                          headingBottomText(
                                                              "30", "Covid"),
                                                        ],
                                                      ),
                                                    ]
                                                        .map(
                                                            (item) =>
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      Get.bottomSheet(
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius: const BorderRadius.only(
                                                                              topLeft: Radius.circular(20),
                                                                              topRight: Radius.circular(20)),
                                                                          child:
                                                                              Container(
                                                                            color:
                                                                                BrandColor.in_background,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                                                                              child: Column(
                                                                                children: [
                                                                                  pescription()
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ));
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              21),
                                                                      child:
                                                                          item,
                                                                    )))
                                                        .toList(),
                                                  ))
                                              : Container(),
                                          item['view']
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                            },
                            child: medicalOption(currentSubpage == item['name'],
                                name: item['name'], iconData: item['icon']),
                          ))
                      .toList()),
              const SizedBox(
                height: 10,
              ),
              subpages
                  .where((item) => item['name'] == currentSubpage)
                  .first['view'],
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
