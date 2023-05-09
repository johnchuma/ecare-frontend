// ignore_for_file: implementation_imports, unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/settings/widgets/payment_option.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCardsPage extends StatefulWidget {
  const PaymentCardsPage({super.key});

  @override
  State<PaymentCardsPage> createState() => _PaymentCardsPageState();
}

class _PaymentCardsPageState extends State<PaymentCardsPage> {
  String currentCategory = "Newest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        leading: backArrow(),
        title: customHeading("Payment", 18),
        actions: const [Icon(Icons.qr_code_scanner)],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              paymentOption("Apple pay", Photos.apple),
              paymentOption("Google pay", Photos.google),
              paymentOption("xxxx xxxx xxxx xx56", Photos.mastercard),
              const SizedBox(
                height: 20,
              ),
              customButton("Add new card", BrandColor.main_color),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
