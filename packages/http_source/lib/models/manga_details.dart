import 'chapter.dart';
import 'manga.dart';

class MangaDetails {
  final Manga manga;
  final List<Chapter> chapters;

  MangaDetails({required this.manga, required this.chapters});

  @override
  String toString() {
    return '${manga.title} chapters: ${chapters.length}';
  }
}
