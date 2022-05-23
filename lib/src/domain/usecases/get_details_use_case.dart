import 'package:http_source/http_source.dart';
import 'package:http_source/models/manga.dart';
import 'package:http_source/models/manga_details.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_details_use_case.dart';

class GetDetailsUseCase extends AGetDetailsUseCase {
  final HttpSource httpRepository;

  GetDetailsUseCase({required this.httpRepository});

  @override
  Future<MangaDetails> getMangaDetails(Manga manga) async {
    return await httpRepository.fetchMangaDetails(manga);
  }
}
