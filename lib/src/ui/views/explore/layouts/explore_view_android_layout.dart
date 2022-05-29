import 'package:flutter/material.dart';
import 'package:http_source/models/manga.dart';
import 'package:meronpan_app/src/ui/widgets/manga_cover.dart';

class ExploreViewAndroidLayout extends StatelessWidget {
  final List<Manga> mangas;
  const ExploreViewAndroidLayout({Key? key, required this.mangas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return _SliverMangaGrid(
        mangas: mangas,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 4 / 7,
          crossAxisCount: 5,
        ),
      );
    }
    return _SliverMangaGrid(
      mangas: mangas,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 8,
        crossAxisCount: 3,
        mainAxisExtent: 220,
      ),
    );
  }
}

class _SliverMangaGrid extends StatelessWidget {
  const _SliverMangaGrid(
      {Key? key, required this.mangas, required this.gridDelegate})
      : super(key: key);

  final List<Manga> mangas;
  final SliverGridDelegate gridDelegate;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              // print(mangas[index].toJson());
              // ref.read(selectedMangaProvider.notifier).state =
              //     mangas[index];
              // Navigator.pushNamed(context, '/manga');
            },
            child: GridTile(
              child: Column(
                children: [
                  MangaCover(
                    manga: mangas[index],
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
