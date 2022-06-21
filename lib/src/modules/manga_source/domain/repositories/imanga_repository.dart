import 'package:http_source/http_source.dart';

abstract class IMangaRepository {
  Future<MangasPage> getPage(
      {required String query, required FilterList filterList, required int page});
}
