import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_trivia/constants/constants.dart';
import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  final String url;

  const ImageContainerWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      imageUrl: url,
      useOldImageOnUrlChange: true,
      placeholder: (context, url) => const SizedBox(
        height: loadingIndicatorSize,
        width: loadingIndicatorSize,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
