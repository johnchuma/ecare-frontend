// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/modules/chat/model/message.dart';
import 'package:doctor/modules/chat/widgets/attachment_option.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/utils/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget filePickerOptions(
    Function hideAttachment, Message message, Appointment appointment) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      hideAttachment();
                      pickDocuments();
                    },
                    child: attachmentOption("Documents",
                        MaterialCommunityIcons.file_document, Colors.green),
                  ),
                  GestureDetector(
                    onTap: () {
                      hideAttachment();
                      message.pickFile(pickVideos, "video", appointment);
                    },
                    child: attachmentOption(
                        "Videos", MaterialCommunityIcons.camera, Colors.red),
                  ),
                  GestureDetector(
                      onTap: () {
                        hideAttachment();
                        pickAudio();
                      },
                      child: attachmentOption(
                          "Audio", Icons.music_note, Colors.orange))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  attachmentOption("Location",
                      MaterialCommunityIcons.map_marker, Colors.blue),
                  attachmentOption(
                      "Camera", MaterialCommunityIcons.camera, Colors.pink),
                  GestureDetector(
                    onTap: () {
                      hideAttachment();
                      pickImages();
                    },
                    child: attachmentOption(
                        "Image", MaterialCommunityIcons.image, Colors.yellow),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
