
import 'package:http_source/models/mangas_page.dart';

abstract class AGetPopularsUseCase {
  Future<MangasPage> getMangas(int page) ;
}