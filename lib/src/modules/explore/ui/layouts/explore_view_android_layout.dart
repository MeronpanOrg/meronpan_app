import 'package:flutter/material.dart';
import 'package:http_source/models/manga.dart';

import '../widgets/sliver_manga_grid.dart';

class ExploreViewAndroidLayout extends StatelessWidget {
  final List<Manga> mangas;
  const ExploreViewAndroidLayout({Key? key, required this.mangas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return SliverMangaGrid(
        mangas: mangas,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // childAspectRatio: 4 / 7,
            crossAxisCount: 5,
            mainAxisExtent: 280),
      );
    }
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverMangaGrid(
        mangas: mangas,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4, crossAxisCount: 3, mainAxisExtent: 240),
      ),
    );
  }
}
