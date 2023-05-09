// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/pages/signin_page.dart';
import 'package:doctor/modules/doctor/pages/doctor_page.dart';
import 'package:doctor/modules/patients/pages/patient_index.dart';
import 'package:doctor/modules/pharmacy/pharmacy_home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class WayPage extends StatefulWidget {
  const WayPage({super.key});

  @override
  State<WayPage> createState() => _WayPageState();
}

class _WayPageState extends State<WayPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print("Online");
    } else {
      print("Offline");
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<User>('users').listenable(),
      builder: (context, box, widget) {
        User? user = box.get('me');
        return user == null
            ? SignInPage()
            : user.tokens == ""
                ? SignInPage()
                : user.type == "Patient"
                    ? const PatientIndex()
                    : user.type == "Pharmacy"
                        ? const PharmacyHomePage()
                        : const DoctorPage();
      },
    );
  }
}
