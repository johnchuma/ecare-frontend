// ignore_for_file: unused_import, implementation_imports

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/modules/pharmacy/model/product_category.dart';
import 'package:doctor/modules/pharmacy/widgets/product_category_pill.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';

class PharmacyAddCategory extends StatefulWidget {
  const PharmacyAddCategory({super.key});

  @override
  State<PharmacyAddCategory> createState() => _PharmacyAddCategoryState();
}

class _PharmacyAddCategoryState extends State<PharmacyAddCategory> {
  ProductCategory category = ProductCategory();
  String localImage = "";
  final _formKey = GlobalKey<FormState>();
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: backArrow(),
        title: customHeading("Add product category", 16),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 90,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 160,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            customHeading("Add category image", 15),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                category.pickImage().then((value) {
                                  setState(() {
                                    // localImage = value!.path;
                                  });
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  color: BrandColor.main_color.withOpacity(0.1),
                                  width: double.infinity,
                                  height: 200,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    child: category.imageFile.isAbsolute ==
                                            false
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add_a_photo,
                                                size: 50,
                                                color: BrandColor.main_color,
                                              ),
                                            ],
                                          )
                                        : Image.file(
                                            category.imageFile,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            familyForm("Category title", "Type category title",
                                textEditingController: categoryController),
                          ]),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (category.imageFile.isAbsolute == false) {
                              errorToast("Please upload image");
                            } else {
                              category.name = categoryController.text;
                              category.addCategory();
                            }
                          }
                        },
                        child: customButton("Add category")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
