import 'package:http_source/models/manga.dart';

abstract class AGetDetailsUseCase {
  Future getMangaDetails(Manga manga) ;
}