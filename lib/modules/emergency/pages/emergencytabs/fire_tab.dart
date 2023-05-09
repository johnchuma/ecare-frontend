// ignore_for_file: implementation_imports, unused_import, unnecessary_import

import 'package:doctor/modules/emergency/widgets/emergency_widget.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FireTab extends StatelessWidget {
  const FireTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          emergencyWidget("Kijazi fire fighters", "Available", Photos.fire),
        ],
      ),
    );
  }
}
