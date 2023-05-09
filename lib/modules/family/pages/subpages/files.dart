// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last, import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/modules/family/widget/document.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';

class Files extends StatefulWidget {
  const Files({super.key});

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> {
  var currentOption = 'Photos';
  @override
  Widget build(BuildContext context) {
    List filesOptions = [
      {
        'name': 'Photos',
        'view': Wrap(
          children: Photos.images
              .map((image) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        child: CachedNetworkImage(
                            imageUrl: image['image']!, fit: BoxFit.cover),
                      ),
                    ),
                  ))
              .toList(),
        )
      },
      {
        'name': 'Documents',
        'view': Column(
          children: [document()],
        )
      },
      {'name': 'Videos', 'view': Container()}
    ];
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: filesOptions
                    .map((item) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentOption = item['name'];
                            });
                          },
                          child: customButton(
                              item['name'],
                              item['name'] == currentOption
                                  ? BrandColor.main_color
                                  : Colors.grey.withOpacity(0.1),
                              item['name'] == currentOption
                                  ? Colors.white
                                  : BrandColor.text_color,
                              30),
                        ))
                    .toList(),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          filesOptions
              .where((element) => element['name'] == currentOption)
              .first['view'],
          const SizedBox(
            height: 20,
          ),
          ClipOval(
            child: Container(
              height: 40,
              color: BrandColor.main_color,
              child: Icon(Icons.add, color: BrandColor.in_background),
              width: 40,
            ),
          )
        ],
      ),
    );
  }
}
