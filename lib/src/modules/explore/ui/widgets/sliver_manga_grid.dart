import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/models/manga.dart';

import '../../../../providers/selected/selected_manga_provider.dart';
import 'manga_cover.dart';


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
          return GestureDetector(
            onTap: () {
              // print(mangas[index].toJson());
              ref.read(selectedMangaProvider.notifier).state = mangas[index];
              Navigator.pushNamed(context, '/manga');
            },
            child: GridTile(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 5 / 7,
                    child: MangaCover(
                      manga: mangas[index],
                    ),
                  ),
                  Text(
                    mangas[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          );
        },
        childCount: mangas.length,
      ),
      gridDelegate: gridDelegate,
    );
  }
}
