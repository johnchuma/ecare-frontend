// ignore_for_file: implementation_imports, unnecessary_import

import 'package:doctor/modules/emergency/widgets/emergency_widget.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoctorTab extends StatelessWidget {
  const DoctorTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          emergencyWidget("Dr James Edward", "Pedisterian", Photos.doctor3),
          emergencyWidget("Dr Maria JR", "Dentist", Photos.doctor2),
          emergencyWidget("Dr John Doe", "Pedisterian", Photos.doctor1),
        ],
      ),
    );
  }
}
