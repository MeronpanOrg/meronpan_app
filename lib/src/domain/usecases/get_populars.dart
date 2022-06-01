

import 'package:http_source/http_source.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_populars.dart';

class GetPopularsUseCase extends AGetPopularsUseCase {
  final AHttpSource httpRepository;

  GetPopularsUseCase({required this.httpRepository});

  @override
  Future<MangasPage> getMangas(int page) async {
    return await httpRepository.fetchPopularManga(page);
  }
}
