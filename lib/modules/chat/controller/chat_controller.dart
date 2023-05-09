import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:doctor/modules/chat/model/message.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/endpoint.dart';
import 'package:doctor/utils/loader.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get.dart';

class ChatController extends GetxController {
  Appointment appointment;
  ChatController(this.appointment);
  Rx<List<Message>> messageListener = Rx<List<Message>>([]);
  List<Message> get messages => messageListener.value;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    messageListener.bindStream(getMessages());
    super.onInit();
  }

  void sendMessage(Message message) async {
    if (message.attachment.isNotEmpty) {
      launchLoader();
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(message.file.path,
            filename: message.attachment.split('/').last)
      });
      var response = await Dio().post('${production}file/',
          options: Options(
            headers: {'Authorization': 'bearer ${getMyInfo().tokens}'},
          ),
          data: formData);
      message.attachment = response.data['body']['link'];
      removeGetWidget();
    }

    Timestamp time = Timestamp.now();
    String id = time.toDate().toLocal().toString();
    await _firestore
        .collection("appointments")
        .doc(appointment.uuid)
        .collection("chats")
        .doc(id)
        .set({
      "id": id,
      "message": message.message,
      "type": message.type,
      "createdAt": message.createdAt,
      "sender": message.sender,
      "attachment": message.attachment,
    });

    message.emptyAttributes();
  }

  Stream<List<Message>> getMessages() {
    return _firestore
        .collection("appointments")
        .doc(appointment.uuid)
        .collection("chats")
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Message> messages = [];
      for (var element in querySnapshot.docs) {
        messages.add(Message.fromDocumentSnapshot(element));
      }
      return messages;
    });
  }
}
