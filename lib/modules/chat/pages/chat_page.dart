// ignore_for_file: depend_on_referenced_packages, import_of_legacy_library_into_null_safe, unused_import, unused_element, prefer_final_fields

import 'package:bubble/bubble.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/chat/controller/chat_controller.dart';
import 'package:doctor/modules/chat/model/message.dart';
import 'package:doctor/modules/chat/widgets/attachment_option.dart';
import 'package:doctor/modules/chat/widgets/chat_bubble.dart';
import 'package:doctor/modules/chat/widgets/emoji_picker.dart';
import 'package:doctor/modules/chat/widgets/file_picker_options.dart';
import 'package:doctor/modules/chat/widgets/thumbnail.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  Appointment appointment;
  ChatPage(this.appointment, {super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  bool showEmoji = false;
  bool showAttachmentOptions = false;
  ScrollController _scrollController = ScrollController();
  Message message = Message();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        actions: const [
          // Icon(
          //   AntDesign.search1,
          //   size: 20,
          //   color: Color.fromARGB(255, 189, 27, 27),
          // ),
          // SizedBox(
          //   width: 20,
          // ),
          // Icon(AntDesign.message1, size: 20, color: Colors.black),
          // SizedBox(
          //   width: 10,
          // )
        ],
        leading: backArrow(),
        title: customHeading(widget.appointment.doctor.name, 18),
      ),
      body: GetX<ChatController>(
          init: ChatController(widget.appointment),
          builder: (find) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: _scrollController,
                      reverse: true,
                      children: find.messages.reversed
                          .map(
                            (chat) => chatBubble(chat),
                          )
                          .toList(),
                    ),
                  ),
                  inputChatField()
                ],
              ),
            );
          }),
    );
  }

  void changeEmoiVisibility(bool value) {
    setState(() {
      showEmoji = value;
      showAttachmentOptions = false;
    });
  }

  Widget inputChatField() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: TextFormField(
                          controller: messageController,
                          onTap: () {
                            changeEmoiVisibility(false);
                          },
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  changeAttachmentOptonsVisibility(
                                      !showAttachmentOptions);
                                },
                                child: const Icon(
                                  MaterialCommunityIcons.attachment,
                                  color: Colors.grey,
                                ),
                              ),
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  changeEmoiVisibility(!showEmoji);
                                },
                                child: const Icon(
                                  Icons.emoji_emotions,
                                  color: Colors.grey,
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: "Type text here..."),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  message.message = messageController.text;
                  message.sendMessage(widget.appointment);
                  messageController.text = "";
                },
                child: ClipOval(
                  child: Container(
                    color: BrandColor.main_color,
                    child: const Padding(
                      padding: EdgeInsets.all(13),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          showAttachmentOptions
              ? filePickerOptions(
                  hideFileUploadOptions, message, widget.appointment)
              : Container(),
          AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: showEmoji ? 190 : 0,
              child: emojiPicker(messageController))
        ],
      ),
    );
  }

  void hideFileUploadOptions() {
    setState(() {
      showAttachmentOptions = false;
    });
  }

  void changeAttachmentOptonsVisibility(bool value) {
    setState(() {
      showAttachmentOptions = value;
      showEmoji = false;
    });
  }
}
