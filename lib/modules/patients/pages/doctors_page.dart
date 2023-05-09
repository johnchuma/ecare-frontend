// ignore_for_file: unnecessary_import, implementation_imports, import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/authentication/controller/auth_controller.dart';
import 'package:doctor/modules/patients/pages/specialist_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../authentication/models/user.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  void initState() {
    AuthController().getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List tabs = [
      {"tab": "Peditrician", "widget": Container()},
      {"tab": "Neurosurgeon", "widget": Container()},
      {"tab": "Cardiologist", "widget": Container()},
      {"tab": "Paycheck", "widget": Container()}
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: BrandColor.in_background,
              leading: Container(),
              leadingWidth: 0,
              bottom: TabBar(
                  labelColor: BrandColor.main_color,
                  isScrollable: true,
                  unselectedLabelColor: BrandColor.text_color,
                  labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  tabs: tabs
                      .map((item) => Tab(
                            text: item['tab'],
                          ))
                      .toList()),
              elevation: 0,
              actions: [
                Icon(
                  Octicons.search,
                  color: BrandColor.text_color,
                  size: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  AntDesign.message1,
                  color: BrandColor.text_color,
                  size: 20,
                ),
                const SizedBox(
                  width: 20,
                )
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // customText("Available"),
                  customHeading("Specialists", 18)
                ],
              )),
          body: TabBarView(
              children: tabs
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ValueListenableBuilder(
                                valueListenable:
                                    Hive.box<User>('doctors').listenable(),
                                builder: (context, box, widget) {
                                  List<User>? doctors = box.values.toList();
                                  return Expanded(
                                      child: GridView.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    children: doctors
                                        .map((doctor) => GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    SpecialistPage(doctor));
                                              },
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Container(
                                                      color: Colors.grey[200],
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              20,
                                                      height: 125,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  customHeading(
                                                                      doctor
                                                                          .name,
                                                                      11),
                                                                  customHint(
                                                                      doctor
                                                                          .profession
                                                                          .title,
                                                                      null,
                                                                      null,
                                                                      10),
                                                                  Row(
                                                                    // ignore: prefer_const_literals_to_create_immutables
                                                                    children: [
                                                                      Icon(
                                                                        Octicons
                                                                            .star,
                                                                        color: Colors
                                                                            .orange,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                      Icon(
                                                                        Octicons
                                                                            .star,
                                                                        color: Colors
                                                                            .orange,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                      Icon(
                                                                        Octicons
                                                                            .star,
                                                                        color: Colors
                                                                            .orange,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                      Icon(
                                                                        Octicons
                                                                            .star,
                                                                        color: Colors
                                                                            .orange,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // customHint(
                                                                  //     "Exprience",
                                                                  //     null,
                                                                  //     null,
                                                                  //     10),
                                                                  // customHeading(
                                                                  //     "4 years",
                                                                  //     11),
                                                                  customHint(
                                                                      "patients",
                                                                      null,
                                                                      null,
                                                                      10),
                                                                  customHeading(
                                                                      "50k",
                                                                      11),
                                                                  Row(
                                                                    children: [
                                                                      customHint(
                                                                          "Location",
                                                                          null,
                                                                          null,
                                                                          10),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        MaterialCommunityIcons
                                                                            .map_marker,
                                                                        size:
                                                                            15,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            3,
                                                                      ),
                                                                      customHeading(
                                                                          doctor
                                                                              .getDistanceFromService(),
                                                                          11),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          ClipOval(
                                                            child: SizedBox(
                                                              height: 50,
                                                              width: 50,
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: doctor
                                                                    .image,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ));
                                })
                          ],
                        ),
                      ))
                  .toList())),
    );
  }
}
