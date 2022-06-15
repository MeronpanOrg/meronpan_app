

import 'package:http_source/http_source.dart';

import 'interfaces/aget_search_use_case.dart';

class GetSearchUseCase extends AGetSearchUseCase {
  final AHttpSource httpRepository;

  GetSearchUseCase({required this.httpRepository});

  @override
  Future<MangasPage> getMangas(int page, String query, FilterList filterList) async {
    return await httpRepository.fetchSearchManga(page, query, filterList);
  }


}
