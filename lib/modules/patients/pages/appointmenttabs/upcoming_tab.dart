// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/modules/patients/widgets/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ValueListenableBuilder(
          valueListenable: Hive.box<Appointment>('appointments').listenable(),
          builder: (context, box, widget) {
            List<Appointment>? appointments = box.values.toList();
            return ListView(
              padding: const EdgeInsets.only(top: 10),
              children: appointments
                  .where((item) => item.status == "upcoming")
                  .map((appointment) => upcoming(appointment))
                  .toList(),
            );
          }),
    );
  }
}
