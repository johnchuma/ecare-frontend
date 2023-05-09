// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/patients/controller/appointment_controller.dart';
import 'package:doctor/modules/patients/pages/appointmenttabs/canceled_tab.dart';
import 'package:doctor/modules/patients/pages/appointmenttabs/completed_tab.dart';
import 'package:doctor/modules/patients/pages/appointmenttabs/upcoming_tab.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientAppointmentPage extends StatefulWidget {
  const PatientAppointmentPage({super.key});

  @override
  State<PatientAppointmentPage> createState() => _PatientAppointmentPageState();
}

class _PatientAppointmentPageState extends State<PatientAppointmentPage> {
  @override
  void initState() {
    AppointmentController().getAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List tabs = [
      {"name": "Upcoming", "view": const UpcomingTab()},
      {"name": "Completed", "view": const CompletedTab()},
      {"name": "Canceled", "view": const CanceledTab()},
      {"name": "Waiting", "view": const UpcomingTab()},
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: BrandColor.in_background,
        appBar: AppBar(
          backgroundColor: BrandColor.in_background,
          title: customHeading("My appointments", 18),
          leading: backArrow(),
          bottom: TabBar(
              labelColor: BrandColor.main_color,
              isScrollable: true,
              indicatorColor: BrandColor.main_color,
              unselectedLabelColor: BrandColor.text_color,
              labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              tabs: tabs
                  .map((tab) => Tab(
                        text: tab['name'],
                      ))
                  .toList()),
          actions: const [],
          elevation: 0,
        ),
        body: TabBarView(
            children: tabs
                .map((tab) => Container(
                      child: tab['view'],
                    ))
                .toList()),
      ),
    );
  }
}
