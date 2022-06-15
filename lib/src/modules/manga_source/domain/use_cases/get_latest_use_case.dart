import 'package:http_source/http_source.dart';

import 'interfaces/aget_latest_use_case.dart';

class GetLatestUseCase extends AGetLatestUseCase {
  final AHttpSource httpRepository;

  GetLatestUseCase({required this.httpRepository});

  @override
  Future<MangasPage> getMangas(int page) async {
    return await httpRepository.fetchLatestUpdates(page);
  }
}
