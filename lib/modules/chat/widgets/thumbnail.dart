import 'package:doctor/modules/chat/model/message.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

Widget thumbnail(Message message) {
  return FutureBuilder(
      future: getThumbnailFile(message.attachment),
      builder: (context, snapshot) {
        return Container();
      });
}

Future<String?> getThumbnailFile(String link) async {
  String? fileName = await VideoThumbnail.thumbnailFile(
    video: link,
    thumbnailPath: (await getTemporaryDirectory()).path,
    imageFormat: ImageFormat.PNG,
    quality: 90,
  );
  return fileName;
}
