import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

Widget customAvatar(double size, String image, {double? radius}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius ?? size),
    child: SizedBox(
      height: size,
      width: size,
      child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: image),
    ),
  );
}
