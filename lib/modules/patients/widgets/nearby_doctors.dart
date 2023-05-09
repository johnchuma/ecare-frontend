// ignore_for_file: unused_import, implementation_imports

import 'package:doctor/modules/patients/pages/specialist_page.dart';
import 'package:doctor/modules/patients/widgets/best_doctor.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';

class NearbyDoctors extends StatelessWidget {
  const NearbyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Photos.doctor1,
          Photos.doctor2,
          Photos.doctor3,
          Photos.doctor4,
          Photos.doctor1,
          Photos.doctor2,
        ]
            .map((img) => GestureDetector(
                onTap: () {
                  // Get.to(() => co SpecialistPage());
                },
                child: bestDoctor(img, img)))
            .toList(),
      ),
    );
  }
}
