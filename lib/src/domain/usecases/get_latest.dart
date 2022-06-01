import 'package:http_source/http_source.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_latest.dart';

class GetLatestUseCase extends AGetLatestUseCase {
  final AHttpSource httpRepository;

  GetLatestUseCase({required this.httpRepository});

  @override
  Future<MangasPage> getMangas(int page) async {
    return await httpRepository.fetchLatestUpdates(page);
  }
}
