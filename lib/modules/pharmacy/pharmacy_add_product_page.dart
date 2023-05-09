// ignore_for_file: unused_import, implementation_imports, sort_child_properties_last

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/modules/pharmacy/controllers/product_category_controller.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/modules/pharmacy/model/product_category.dart';
import 'package:doctor/modules/pharmacy/pages/pharmacy_add_category.dart';
import 'package:doctor/modules/pharmacy/widgets/product_category_pill.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PharmacyAddProductPage extends StatefulWidget {
  const PharmacyAddProductPage({super.key});

  @override
  State<PharmacyAddProductPage> createState() => _PharmacyAddProductPageState();
}

class _PharmacyAddProductPageState extends State<PharmacyAddProductPage> {
  ProductCategory selectedCategory = ProductCategory();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String uuid = "";
  Product product = Product();
  @override
  void initState() {
    ProductCategoryController().getProductCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: backArrow(),
        title: customHeading("Add product", 16),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 90,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 160,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customHeading("Select product category", 15),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const PharmacyAddCategory());
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ValueListenableBuilder(
                              valueListenable: Hive.box<ProductCategory>(
                                      'product_categories')
                                  .listenable(),
                              builder: (context, box, widget) {
                                List<ProductCategory>? categories =
                                    box.values.toList();
                                return Wrap(
                                  children: categories
                                      .map((category) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedCategory = category;
                                                uuid = category.uuid;
                                              });
                                            },
                                            child: productCategoryPill(
                                                category.name,
                                                category.uuid == uuid
                                                    ? true
                                                    : false),
                                          ))
                                      .toList(),
                                );
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customHeading("Add product images", 15),
                              GestureDetector(
                                  onTap: () {
                                    product.pickProductImages().then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: const Icon(Icons.add_a_photo))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: product.imageFiles.isEmpty
                                  ? [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          color: Colors.grey[200],
                                          child: Icon(
                                            Icons.image,
                                            color: BrandColor.main_color,
                                          ),
                                          height: 100,
                                          width: 100,
                                        ),
                                      )
                                    ]
                                  : product.imageFiles
                                      .map((item) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                color: Colors.grey[200],
                                                height: 100,
                                                child: Image.file(
                                                  item,
                                                  fit: BoxFit.cover,
                                                ),
                                                width: 100,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          familyForm("Product name", "Type product name",
                              textEditingController: nameController),
                          familyForm("Product price", "Type product price",
                              textEditingController: priceController,
                              textInputType: TextInputType.number),
                          familyForm("Product amount", "Type product amount",
                              textEditingController: amountController,
                              textInputType: TextInputType.number),
                          familyForm(
                              "Product discount", "Type product discount",
                              textEditingController: discountController,
                              textInputType: TextInputType.number),
                          familyForm(
                              "Product description", "Type product description",
                              textEditingController: descriptionController,
                              maxLines: 5),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customHeading("Product visibility", 15),
                                  customHint(product.visibility
                                      ? "Users can see product images"
                                      : "Users can not see product images")
                                ],
                              ),
                              Switch(
                                  value: product.visibility,
                                  focusColor: BrandColor.main_color,
                                  activeColor: BrandColor.main_color,
                                  onChanged: ((value) {
                                    setState(() {
                                      product.visibility = value;
                                    });
                                  }))
                            ],
                          ),
                        ]),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                        onTap: () {
                          product.amount = double.parse(amountController.text);
                          product.description = descriptionController.text;
                          product.discount =
                              double.parse(discountController.text);
                          product.name = nameController.text;
                          product.price = double.parse(priceController.text);
                          product.addProduct();
                        },
                        child: customButton("Add product")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
