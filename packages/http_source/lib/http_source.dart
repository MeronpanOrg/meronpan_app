import 'package:manga_source/manga_source.dart';

import 'models/filter_list.dart';
import 'models/manga.dart';

abstract class HttpSoure extends MangaSource {
  String get baseUrl;
  int get versionId;
  String get lang;

  @override
  String get id => '$baseUrl/$lang/$versionId';

  /// Return a page with a list of manga
  ///
  /// [page] the page number to retrieve.
  Future<dynamic> fetchPopularManga(int page);

  /// Return a page with a list of manga
  ///
  /// [page] the page number to retrieve.
  Future<dynamic> fetchLatestUpdates(int page);

  /// Returns  the request for the search manga given the page.
  ///
  /// [page] the page number to retrieve.
  /// [query] the search query.
  /// [filters] the list of filters to apply.

  Future<dynamic> fetchSearchManga(
      int page, String query, FilterList filterList);

  Future<dynamic> fetchMangaDetails(Manga manga);
}
