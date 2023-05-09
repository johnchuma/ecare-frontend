// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/modules/settings/widgets/contact_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ContactUsTab extends StatelessWidget {
  const ContactUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            contactOption(Icons.headphones_outlined, "Customer service"),
            contactOption(AntDesign.twitter, "Twitter"),
            contactOption(Icons.facebook, "Facebook"),
            contactOption(AntDesign.instagram, "Instagram"),
            contactOption(MaterialCommunityIcons.web, "Website")
          ],
        ),
      ),
    );
  }
}
