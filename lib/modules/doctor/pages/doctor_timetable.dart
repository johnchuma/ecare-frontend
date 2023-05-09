// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/models/timetable.dart';
import 'package:doctor/modules/doctor/pages/add_weekday_schedule.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: implementation_imports

class CreateTimetable extends StatefulWidget {
  const CreateTimetable({super.key});

  @override
  State<CreateTimetable> createState() => _CreateTimetableState();
}

class _CreateTimetableState extends State<CreateTimetable> {
  @override
  void initState() {
    User user = getMyInfo();
    user.findMyTimetable();
    super.initState();
  }

  TextEditingController captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(const AddWeekdaySchedule());
        },
        backgroundColor: BrandColor.main_color,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),

        title: customHeading("My timetable", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ValueListenableBuilder(
            valueListenable: Hive.box<User>('users').listenable(),
            builder: (context, box, widget) {
              List<Timetable>? timetables = box.get('me')?.timetables;
              return ListView(
                children: timetables!
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                                elevation: 50,
                                color: Colors.white,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Row(
                                      children: [
                                        ClipOval(
                                          child: Container(
                                              color: Colors.grey[200],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  color: BrandColor.main_color,
                                                ),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customHeading(item.weekday, 15),
                                            Row(
                                              children: [
                                                customHint("From"),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                customHint(
                                                  item.startingTime,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                customHint("to"),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                customHint(
                                                  item.startingTime,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ))
                    .toList(),
              );
            }),
      ),
    );
  }
}
