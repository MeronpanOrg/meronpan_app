import 'package:http_source/http_source.dart';

import 'interfaces/aget_details_use_case.dart';

class GetDetailsUseCase extends AGetDetailsUseCase {
  final AHttpSource httpRepository;

  GetDetailsUseCase({required this.httpRepository});

  @override
  Future<MangaDetails> getMangaDetails(Manga manga) async {
    return await httpRepository.fetchMangaDetails(manga);
  }
}
