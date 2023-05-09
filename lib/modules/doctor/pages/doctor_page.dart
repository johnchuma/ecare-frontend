// ignore_for_file: avoid_unnecessary_containers, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/appointment_card.dart';
import 'package:doctor/includes/appointment_card2.dart';
import 'package:doctor/includes/appointment_card3.dart';
import 'package:doctor/includes/calender_item.dart';
import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_pill.dart';
import 'package:doctor/includes/cutome_text2.dart';
import 'package:doctor/includes/options.dart';
import 'package:doctor/includes/status.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/pages/appointment_page.dart';
import 'package:doctor/modules/doctor/pages/profile_page.dart';
import 'package:doctor/modules/doctor/pages/transaction_page.dart';
import 'package:doctor/modules/emergency/pages/emergency_page.dart';
import 'package:doctor/modules/patients/pages/articles_page.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_appointment_page.dart';
import 'package:doctor/modules/patients/pages/hospitals_page.dart';
import 'package:doctor/modules/patients/pages/posts_page.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Boxes.getUsers();
    User? me = box.get('me');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ProfilePage());
                    },
                    child: customAvatar(50, "${me?.image}"),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const TransactionPage());
                      },
                      child: const Icon(AntDesign.bells))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading("Welcome!"),
                      customHeading(me!.name.toString()),
                      customHint('Good morning'),
                      const SizedBox(
                        height: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.light,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Urgent care',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      customHeading("Ecare services"),
                    ],
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.grey[400],
                      width: 150,
                      child: CachedNetworkImage(
                          imageUrl:
                              'https://medeor.ae/wp-content/uploads/sites/2/2022/10/Abinaya-Balaji.png'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    {
                      'name': option("Appointment"),
                      'widget': const PatientAppointmentPage()
                    },
                    {
                      'name': option("Payments"),
                      'widget': const TransactionPage()
                    },
                    {'name': option("Posts"), 'widget': const PostsPage()},
                    {
                      'name': option("Articles"),
                      'widget': Container(child: const ArticlesPage())
                    },
                    {
                      'name': option("First aid"),
                      'widget': Container(child: const EmergencyPage())
                    },
                  ]
                      .map((opt) => GestureDetector(
                          onTap: () {
                            Get.to(() => Container(child: opt['widget']));
                          },
                          child: opt['name']))
                      .toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                    color: BrandColor.main_color,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  customText2('March 2022', FontWeight.w800),
                  const SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: BrandColor.main_color,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      customHint('Apr 08, 2022'),
                      customText2("Today", FontWeight.w800)
                    ],
                  ),
                  customPill("Add", BrandColor.main_color, Colors.white, true),
                ],
              ),
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    {'date': '12', 'name': 'Mon'},
                    {'date': '13', 'name': 'Mon'},
                    {'date': '14', 'name': 'Mon'},
                    {'date': '15', 'name': 'Mon'},
                    {'date': '16', 'name': 'Mon'},
                    {'date': '17', 'name': 'Mon'},
                    {'date': '18', 'name': 'Mon'},
                    {'date': '19', 'name': 'Mon'},
                    {'date': '20', 'name': 'Mon'},
                    {'date': '21', 'name': 'Mon'},
                  ]
                      .map((opt) => calenderItem(opt['date']!, opt['name']!,
                          opt['date'] == '16' ? true : false))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customPill('Upcoming schedule', Colors.grey[200]!,
                      BrandColor.main_color, false,
                      vertical: 8),
                  customPill('Past schedule', Colors.grey[200]!,
                      BrandColor.main_color, false,
                      vertical: 8),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      status(250, "Pending", Colors.purple),
                      status(15, "Confirmed", Colors.green),
                      status(254, "Canceled", Colors.red)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customText2("STARTING SOON", FontWeight.w800),
              const SizedBox(
                height: 20,
              ),
              appointmentCard(),
              const SizedBox(
                height: 20,
              ),
              customText2("TODAY", FontWeight.w800),
              const SizedBox(
                height: 20,
              ),
              appointmentCard2(),
              const SizedBox(
                height: 20,
              ),
              appointmentCard3(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
