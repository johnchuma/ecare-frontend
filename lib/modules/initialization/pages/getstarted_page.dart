import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';

import 'package:doctor/includes/ecare_heading.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

class GetstartedPage extends StatelessWidget {
  const GetstartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ecare(),
            customHeading(
                "Improve the quality of servers for patient's happiness",
                null,
                TextAlign.center),
            const SizedBox(
              height: 20,
            ),
            customButton('Sign in', BrandColor.main_color),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customHeading("I don't have an account ?", 14, null, null,
                    FontWeight.w500),
                const SizedBox(
                  width: 5,
                ),
                customHeading("Register", 14, null, BrandColor.main_color,
                    FontWeight.w600),
              ],
            )
          ],
        ),
      ),
    );
  }
}
