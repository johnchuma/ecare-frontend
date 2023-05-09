// ignore_for_file: implementation_imports

import 'package:doctor/modules/emergency/widgets/emergency_widget.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';

class AmbulanceTab extends StatelessWidget {
  const AmbulanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          emergencyWidget(
              "Masana hospital Available", "Available", Photos.ambulance),
          emergencyWidget(
              "Masana hospital Available", "Available", Photos.ambulance),
          emergencyWidget(
              "Masana hospital Available", "Available", Photos.ambulance),
        ],
      ),
    );
  }
}
