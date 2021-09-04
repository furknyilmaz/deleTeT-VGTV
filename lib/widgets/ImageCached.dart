import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageCached extends StatelessWidget {
  String url;
  double? width;
  double? height;

  ImageCached({
    required this.url,
    this.width = 30.0,
    this.height = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        child: CachedNetworkImage(
          imageUrl: url,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
