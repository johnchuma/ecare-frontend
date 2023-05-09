// ignore_for_file: must_be_immutable, import_of_legacy_library_into_null_safe, unused_import

import 'package:doctor/modules/family/pages/family_page.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_appointment_page.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_articles_page.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_history_page.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_home_page.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_home_page2.dart';
import 'package:doctor/modules/patients/pages/bottompages/patient_user_page.dart';
import 'package:doctor/modules/patients/pages/doctors_page.dart';
import 'package:doctor/modules/patients/pages/hospitals_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/map_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PatientIndex extends StatefulWidget {
  const PatientIndex({super.key});

  @override
  State<PatientIndex> createState() => _PatientIndexState();
}

class _PatientIndexState extends State<PatientIndex> {
  List navitems = [
    {"icon": Octicons.home, "label": "Home", "view": const PatientHomePage2()},
    {
      "icon": Octicons.calendar,
      "label": "Doctors",
      "view": const DoctorsPage()
    },
    {
      "icon": Octicons.history,
      "label": "Pharmacy",
      "view": const HospitalsPage()
    },
    {
      "icon": Octicons.file_directory,
      "label": "Appointment",
      "view": const PatientAppointmentPage()
    },
    {"icon": Octicons.person, "label": "Family", "view": const FamilyPage()},
  ];

  var currentTab = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: BrandColor.in_background,
          elevation: 0,
          enableFeedback: true,
          currentIndex: currentTab,
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          selectedLabelStyle: const TextStyle(fontSize: 10),
          onTap: (value) {
            setState(() {
              currentTab = value;
            });
          },
          unselectedItemColor: Colors.black.withOpacity(0.6),
          selectedItemColor: BrandColor.text_color,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          items: navitems
              .map((item) => BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(item["icon"]),
                  label: item['label']))
              .toList()),
      body: navitems[currentTab]['view'],
    );
  }
}
