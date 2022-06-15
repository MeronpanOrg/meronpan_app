import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/models/manga.dart';

import '../../../../widgets/manga_grid_tile.dart';

class SliverMangaGrid extends ConsumerWidget {
  const SliverMangaGrid(
      {Key? key, required this.mangas, required this.gridDelegate})
      : super(key: key);

  final List<Manga> mangas;
  final SliverGridDelegate gridDelegate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MangaGridTile(
            manga: mangas[index],
          );
        },
        childCount: mangas.length,
      ),
      gridDelegate: gridDelegate,
    );
  }
}
