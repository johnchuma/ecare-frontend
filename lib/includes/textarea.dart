import 'package:flutter/material.dart';

Widget textarea(
    {int? minlines,
    int? maxlines,
    TextEditingController? textEditingController,
    String? hint}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextFormField(
          maxLines: maxlines ?? 10,
          minLines: minlines ?? 1,
          decoration: InputDecoration(
              hintStyle: const TextStyle(fontSize: 15),
              border: InputBorder.none,
              hintText: hint),
        ),
      ),
    ),
  );
}
