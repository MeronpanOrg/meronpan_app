import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/ahttp_source.dart';
import 'package:http_source/models/mangas_page.dart';
import 'package:http_source/models/filter_list.dart';
import 'package:meronpan_app/src/modules/manga_source/domain/repositories/imanga_repository.dart';

import '../../domain/exceptions/no_results_exception.dart';

class MangaRepository implements IMangaRepository {
  final AHttpSource httpSource;

  MangaRepository(this.httpSource);

  @override
  Future<MangasPage> getPage(
      {required String query,
      required FilterList filterList,
      required int page}) async {
    MangasPage mangas;

    if (query.isEmpty && filterList.list.isEmpty) {
      mangas = await httpSource.fetchPopularManga(page);
    } else {
      mangas = await httpSource.fetchSearchManga(page, query, filterList);
    }

    if (mangas.mangas.isNotEmpty) {
      return mangas;
    } else {
      throw NoResultsException('Imposible obtener mangas');
    }
  }
}
