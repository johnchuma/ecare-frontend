// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/modules/patients/widgets/caategory.dart';
import 'package:doctor/utils/faq_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FaqTab extends StatefulWidget {
  const FaqTab({super.key});

  @override
  State<FaqTab> createState() => _FaqTabState();
}

class _FaqTabState extends State<FaqTab> {
  TextEditingController searchController = TextEditingController();
  String currentCategory = "General";
  List faqs = [
    {
      "question": "What is medicine",
      "answer":
          "Non nostrud do ut qui Lorem amet ut ea. Incididunt fugiat occaecat eiusmod esse commodo nulla sint irure qui adipisicing qui veniam officia laborum. Veniam duis labore aliquip id quis nulla ut sit do ad. Commodo duis do aute adipisicing tempor quis aliqua sunt Lorem elit. Deserunt amet est ullamco dolor cupidatat aute Lorem proident nostrud nisi ipsum adipisicing aliquip. Do consequat magna nostrud id fugiat eu ipsum cillum occaecat dolor id exercitation pariatur.",
      "expand": false
    },
    {
      "question": "Second question",
      "answer":
          "Non nostrud do ut qui Lorem amet ut ea. Incididunt fugiat occaecat eiusmod esse commodo nulla sint irure qui adipisicing qui veniam officia laborum. Veniam duis labore aliquip id quis nulla ut sit do ad. Commodo duis do aute adipisicing tempor quis aliqua sunt Lorem elit. Deserunt amet est ullamco dolor cupidatat aute Lorem proident nostrud nisi ipsum adipisicing aliquip. Do consequat magna nostrud id fugiat eu ipsum cillum occaecat dolor id exercitation pariatur.",
      "expand": true
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  'General',
                  "Inhaler",
                  'Drops',
                  'Capsules',
                  'Tablets',
                  'Liquid'
                ]
                    .map((item) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentCategory = item;
                          });
                        },
                        child: Container(
                            child: productCategory(
                                item, item == currentCategory ? true : false))))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.grey[200],
                child: TextFormField(
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(
                        AntDesign.search1,
                        size: 20,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: faqs
                  .map((faq) => GestureDetector(
                        onTap: () {
                          setState(() {
                            faq['expand'] = !faq['expand'];
                          });
                        },
                        child: faqQuestion(
                            faq['question'], faq['answer'], faq['expand']),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
