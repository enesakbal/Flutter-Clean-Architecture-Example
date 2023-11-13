import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../indicator/base_indicator.dart';

class BaseNetworkImage extends StatelessWidget {
  const BaseNetworkImage(this.url, {super.key});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      progressIndicatorBuilder: (context, url, progress) => const BaseIndicator(),
      errorWidget: (_, __, ___) => const BaseIndicator(),
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
