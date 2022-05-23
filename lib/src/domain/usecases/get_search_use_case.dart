

import 'package:http_source/http_source.dart';
import 'package:http_source/models/filter_list.dart';
import 'package:http_source/models/mangas_page.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_search_use_case.dart';

class GetSearchUseCase extends AGetSearchUseCase {
  final HttpSource httpRepository;

  GetSearchUseCase({required this.httpRepository});

  @override
  Future<MangasPage> getMangas(int page, String query, FilterList filterList) async {
    return await httpRepository.fetchSearchManga(page, query, filterList);
  }


}
