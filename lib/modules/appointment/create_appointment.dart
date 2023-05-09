// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/controllers/timetable_controller.dart';
import 'package:doctor/modules/family/controller/family_controller.dart';
import 'package:doctor/modules/family/models/family.dart';
import 'package:doctor/modules/appointment/book_appointment.dart';
import 'package:doctor/modules/family/pages/add_family.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CreateAppointment extends StatefulWidget {
  User doctor;
  CreateAppointment(this.doctor, {super.key});

  @override
  State<CreateAppointment> createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    FamilyController().getFamily();
    TimetableController().findDoctorTimetable(widget.doctor);
    super.initState();
  }

  Appointment appointment = Appointment();

  @override
  Widget build(BuildContext context) {
    appointment.doctor = widget.doctor;
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("Appointment", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 90,
                              width: 100,
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: widget.doctor.image),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customHeading(widget.doctor.name, 16),
                            customHint(widget.doctor.email),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 19,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 19,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 19,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 19,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 39,
                                ),
                                Row(
                                  children: [
                                    customHeading("\$", 12, null, Colors.green),
                                    customHeading("28.00/hr", 15),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customHeading("Appointment for", 16),
                    const SizedBox(
                      height: 10,
                    ),
                    familyForm(
                      "Patient name",
                      "Enter patient name",
                      textInputType: TextInputType.none,
                      textEditingController:
                          TextEditingController(text: appointment.member.name),
                    ),
                    // familyForm(
                    //   "Phone number",
                    //   "Contact number",
                    //   textEditingController:
                    //       TextEditingController(text: getMyInfo().phone),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customHeading("Who is this patient", 15),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const AddFamily());
                            },
                            child: const Icon(Icons.add))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      child: ValueListenableBuilder(
                          valueListenable:
                              Hive.box<Family>('family').listenable(),
                          builder: (context, box, widget) {
                            List<Family>? members = box.values.toList();
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: members
                                  .map((member) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            appointment.member = member;
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: CachedNetworkImage(
                                                    imageUrl: member.image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                appointment.member.uuid ==
                                                        member.uuid
                                                    ? Container(
                                                        height: 100,
                                                        width: 100,
                                                        color: Colors.black54,
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.check,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => BookAppointment(appointment));
                  },
                  child: customButton(
                      "Next", BrandColor.main_color, BrandColor.in_background),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
