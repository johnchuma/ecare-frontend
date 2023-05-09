// ignore_for_file: implementation_imports, unused_import, unnecessary_import, empty_statements, dead_code

import 'package:doctor/modules/emergency/widgets/emergency_widget.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MidwifeTab extends StatelessWidget {
  const MidwifeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          emergencyWidget("Dr Maria Serungi", "Midwife", Photos.doctor2),
        ],
      ),
    );
  }
}
