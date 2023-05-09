import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/controllers/package_controller.dart';
import 'package:doctor/modules/doctor/models/package.dart';
import 'package:doctor/modules/doctor/pages/add_packages.dart';
import 'package:doctor/modules/patients/widgets/packages.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DoctorPackages extends StatefulWidget {
  const DoctorPackages({super.key});

  @override
  State<DoctorPackages> createState() => _DoctorPackagesState();
}

class _DoctorPackagesState extends State<DoctorPackages> {
  @override
  void initState() {
    PackageController().findDoctorPackages(getMyInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("My packages", 18),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: BrandColor.main_color,
          onPressed: (() {
            Get.bottomSheet(const AddPackages());
          }),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<User>('users').listenable(),
          builder: (context, box, widget) {
            List<Package>? items = box.get('me')?.packages;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: items!
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: packageWidget(item),
                        ))
                    .toList(),
              ),
            );
          }),
    );
  }
}
