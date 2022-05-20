import 'package:http_source/http_source.dart';

abstract class ITmoRepository extends HttpSoure {
  @override
  String get name => 'TuMangaOnline';

  @override
  String get baseUrl => 'https://lectortmo.com';

  String get icon => 'https://nakamasweb.com/favicons/tumangaonline.ico';

  @override
  String get lang => 'es';

  @override
  int get versionId => 1;
}
