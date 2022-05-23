
import 'package:http_source/models/filter_list.dart';
import 'package:http_source/models/mangas_page.dart';

abstract class AGetSearchUseCase {
  Future<MangasPage> getMangas(int page, String query, FilterList filterList) ;
}