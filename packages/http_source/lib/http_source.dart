import 'package:http_source/models/manga_details.dart';
import 'package:http_source/models/mangas_page.dart';
import 'package:manga_source/manga_source.dart';

import 'models/filter_list.dart';
import 'models/manga.dart';

abstract class HttpSoure extends MangaSource {
  HttpSoure({required super.id, required super.name});

  String get baseUrl;
  int get versionId;
  String get lang;

  @override
  String get id => '$baseUrl/$lang/$versionId';

  /// Return a page with a list of manga
  ///
  /// [page] the page number to retrieve.
  Future<MangasPage> fetchPopularManga(int page);

  /// Return a page with a list of manga
  ///
  /// [page] the page number to retrieve.
  Future<MangasPage> fetchLatestUpdates(int page);

  /// Returns  the request for the search manga given the page.
  ///
  /// [page] the page number to retrieve.
  /// [query] the search query.
  /// [filters] the list of filters to apply.

  Future<MangasPage> fetchSearchManga(
      int page, String query, FilterList filterList);

  /// Return manga details.
  ///
  /// [Manga] a manga.
  Future<MangaDetails> fetchMangaDetails(Manga manga);
}
