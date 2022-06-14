import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/models/manga.dart';

final selectedMangaProvider = StateProvider<Manga>((ref) {
  return Manga(title: '', url: '');
}, name: 'Selected Manga');
