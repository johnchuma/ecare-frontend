// ignore_for_file: implementation_imports

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BulbApp extends StatefulWidget {
  const BulbApp({super.key});

  @override
  State<BulbApp> createState() => _BulbAppState();
}

class _BulbAppState extends State<BulbApp> {
  bool on = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            on
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: CachedNetworkImage(
                        imageUrl:
                            "https://o.remove.bg/downloads/cfa7363c-6f05-4101-aec6-13551ee077e7/light-bulb-on-off-png-11553940186lbyqngqg1y-removebg-preview.png"),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://o.remove.bg/downloads/9584b6e4-9f20-4030-ac98-7db228d94577/672-6727141_light-bulb-off-removebg-preview.png",
                      fit: BoxFit.cover,
                    ),
                  ), // Icon(
            //   Octicons.light_bulb,
            //   size: 200,
            //   color: Colors.white,
            // ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      on = false;
                    });
                  },
                  child: Container(
                    color: on ? Colors.white24 : Colors.red,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text(
                        "OFF",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      on = true;
                    });
                  },
                  child: Container(
                    color: on ? Colors.green : Colors.white24,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text(
                        "ON",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
