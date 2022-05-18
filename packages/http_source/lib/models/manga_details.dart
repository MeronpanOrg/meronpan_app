import 'chapter.dart';
import 'manga.dart';

class MangaDetails {
  final Manga manga;
  final List<Chapter> chapters;

  MangaDetails({this.manga, this.chapters});

  @override
  String toString() {
    return '${manga.title} chapters: ${chapters.length}';
  }
}
