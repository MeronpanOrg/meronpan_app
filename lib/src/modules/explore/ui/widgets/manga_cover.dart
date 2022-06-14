import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http_source/models/manga.dart';

class MangaCover extends StatelessWidget {
  const MangaCover({
    Key? key,
    required this.manga,
  }) : super(key: key);

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // if you need this
          side: const BorderSide(color: Colors.black)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: manga.thumbnailUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
