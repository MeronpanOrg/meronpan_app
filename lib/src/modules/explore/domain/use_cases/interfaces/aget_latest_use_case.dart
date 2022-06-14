import 'package:http_source/models/mangas_page.dart';

abstract class AGetLatestUseCase {
  Future<MangasPage> getMangas(int page);
}
