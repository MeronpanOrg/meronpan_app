import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/models/manga.dart';
import 'package:http_source/models/manga_details.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_details_use_case.dart';
import 'package:meronpan_app/src/domain/uses_cases.dart';
import 'package:meronpan_app/src/ui/providers/manga/page_state.dart';
import 'package:meronpan_app/src/ui/providers/selected/selected_manga_provider.dart';


final mangaPageProvider =
    StateNotifierProvider.autoDispose<MangaPageNotifier, PageState>(
  (ref) {
    return MangaPageNotifier(
        ref.watch(getDetailsUseCaseProvider), ref.watch(selectedMangaProvider));
  },
  name: 'Manga Page Provider',
);

class MangaPageNotifier extends StateNotifier<PageState> {
  final AGetDetailsUseCase getMangaDetailsUseCase;
  final Manga selectedManga;

  MangaPageNotifier(this.getMangaDetailsUseCase, this.selectedManga)
      : super(PageState(
            mangaDetails: MangaDetails(manga: selectedManga, chapters: [])));

  fetchMangaDetails() async {
    if (state.status == PageStatus.ongoing) {
      return;
    }
    state = state.copyWith(status: PageStatus.ongoing);

    final details = await getMangaDetailsUseCase.getMangaDetails(selectedManga);

    state = state.copyWith(status: PageStatus.success, mangaDetails: details);
  }
}
