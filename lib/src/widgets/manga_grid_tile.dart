import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http_source/models/manga.dart';

class MangaGridTile extends StatelessWidget {
  const MangaGridTile({
    Key? key,
    required this.manga,
    this.onTap,
    this.showTitle = true,
  }) : super(key: key);

  final Manga manga;
  final void Function()? onTap;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: GridTile(
          footer: _buildFooter(),
          child: Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: manga.thumbnailUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }

  ListTile? _buildFooter() {
    return showTitle
        ? ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            dense: true,
            title: Text(
              (manga.title),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          )
        : null;
  }
}
