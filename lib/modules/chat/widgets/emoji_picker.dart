import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

Widget emojiPicker(TextEditingController messageController) {
  return EmojiPicker(
    textEditingController:
        messageController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
    config: const Config(
      columns: 8,
      emojiSizeMax: 25,
      verticalSpacing: 0,
      horizontalSpacing: 0,
      gridPadding: EdgeInsets.zero,
      bgColor: Color(0xFFF2F2F2),
      indicatorColor: Colors.blue,
      iconColor: Colors.grey,
      iconColorSelected: Colors.blue,
      backspaceColor: Colors.blue,
      skinToneDialogBgColor: Colors.white,
      skinToneIndicatorColor: Colors.grey,
      enableSkinTones: true,
      showRecentsTab: true,
      recentsLimit: 28,
      noRecents: Text(
        'No Recents',
        style: TextStyle(fontSize: 20, color: Colors.black26),
        textAlign: TextAlign.center,
      ), // Needs to be const Widget
      loadingIndicator: SizedBox.shrink(), // Needs to be const Widget
      tabIndicatorAnimDuration: kTabScrollDuration,
      categoryIcons: CategoryIcons(),
      buttonMode: ButtonMode.MATERIAL,
    ),
  );
}
