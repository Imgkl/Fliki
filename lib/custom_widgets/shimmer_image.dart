import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CacheImage extends StatelessWidget {
  final String url;

  const CacheImage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Shimmer.fromColors(
        enabled: false,
        direction: ShimmerDirection.ltr,
        baseColor: Colors.transparent,
        highlightColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.black,
          ),
          width: 80,
          height: 80,
        ),
      ),
      errorWidget: (context, url, error) => Image.network(url),
      height: 80,
      width: 80,
      fit: BoxFit.cover,
    );
  }
}
