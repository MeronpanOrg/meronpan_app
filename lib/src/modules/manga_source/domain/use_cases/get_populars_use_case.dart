

import 'package:http_source/http_source.dart';

import 'interfaces/aget_populars_use_case.dart';

class GetPopularsUseCase extends AGetPopularsUseCase {
  final AHttpSource httpRepository;

  GetPopularsUseCase({required this.httpRepository});

  @override
  Future<MangasPage> getMangas(int page) async {
    return await httpRepository.fetchPopularManga(page);
  }
}
