import 'package:bubble/bubble.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/chat/model/message.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Bubble chatBubble(Message chat) {
  return Bubble(
    margin: const BubbleEdges.only(top: 10),
    padding: const BubbleEdges.symmetric(vertical: 10, horizontal: 10),
    alignment: chat.isSender() ? Alignment.topRight : Alignment.topLeft,
    nipWidth: 8,
    nipHeight: 5,
    nip: chat.isSender() ? BubbleNip.leftTop : BubbleNip.rightTop,
    color: chat.isSender() ? BrandColor.main_color : Colors.grey[200],
    child: customText(
        chat.attachment, chat.isSender() ? Colors.white : Colors.black),
  );
}
