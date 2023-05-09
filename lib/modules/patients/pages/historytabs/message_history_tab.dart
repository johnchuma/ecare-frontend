// ignore_for_file: camel_case_types

import 'package:doctor/modules/patients/widgets/history_doctor_profile.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';

class messageHistoryTab extends StatelessWidget {
  const messageHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            historyDoctorProfile(Photos.doctor4, "Messaging - ", Icons.message),
            historyDoctorProfile(Photos.doctor2, "Voice call - ", Icons.call),
            historyDoctorProfile(
                Photos.doctor3, "Video call - ", Icons.video_call),
          ],
        ),
      ),
    );
  }
}
