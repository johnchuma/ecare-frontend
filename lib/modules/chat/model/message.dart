// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/modules/chat/controller/chat_controller.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/utils/authentication.dart';

class Message {
  late String message = "";
  late String id = "";
  late Timestamp createdAt = Timestamp.now();
  late String sender = getMyInfo().email;
  late String type;
  late String attachment = "";
  late File file;

  void emptyAttributes() {
    message = "";
    id = "";
    type = "normal";
    attachment = "";
  }

  bool isSender() {
    return getMyInfo().email == sender;
  }

  bool hasAttachment() {
    return attachment.isNotEmpty;
  }

  void sendMessage(Appointment appointment) {
    ChatController(appointment).sendMessage(this);
    print(type);
  }

  void pickFile(Function function, typ, Appointment appointment) async {
    try {
      function().then((List<File> response) {
        // print(response.first.path);
        attachment = response.first.path;
        file = response.first;
        file = file;
        type = typ;
        print(type);
        sendMessage(appointment);
      });
    } catch (e) {
      print(e);
    }
  }

  Message();
  Message.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    message = documentSnapshot["message"];
    id = documentSnapshot["id"];
    createdAt = documentSnapshot["createdAt"];
    sender = documentSnapshot["sender"];
    attachment = documentSnapshot["attachment"];
    type = documentSnapshot["type"];
  }
}
