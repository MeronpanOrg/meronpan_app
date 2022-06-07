import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/models/mangas_page.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_latest.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_populars.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_search_use_case.dart';
import 'package:meronpan_app/src/domain/uses_cases.dart';
import 'package:meronpan_app/src/ui/providers/explore/state/explore_provider_state.dart';
import 'package:tmo_source/data/data_sources/remote/tmo_filter_provider.dart';

final exploreProvider =
    StateNotifierProvider.autoDispose<ExploreNotifier, ExplorePaginaton>((ref) {
  ref.maintainState = true;

  return ExploreNotifier(
      ref.watch(getPopularsUseCaseProvider),
      ref.watch(getLatestUseCaseProvider),
      ref.watch(getSearchUseCaseProvider),
      ref.read);
});

class ExploreNotifier extends StateNotifier<ExplorePaginaton> {
  final AGetPopularsUseCase getPopularsUseCase;
  final AGetLatestUseCase getLatestUseCase;
  final AGetSearchUseCase getSearchUseCase;
  final Reader read;

  int _currentPage = 1;

  ExploreNotifier(
    this.getPopularsUseCase,
    this.getLatestUseCase,
    this.getSearchUseCase,
    this.read,
  ) : super(const ExplorePaginaton()) {
    getPopulars();
  }

  Future<void> _getMangas(Future<MangasPage> Function(int) callback) async {
    if (state.hasLoadMoreDone || state.status == ExploreStatus.ongoing) {
      return;
    }

    try {
      if (state.status == ExploreStatus.initial) {
        state = state.copyWith(status: ExploreStatus.ongoing);

        final mangasPage = await callback(1);
        _currentPage++;

        state = state.copyWith(
            mangas: mangasPage.mangas,
            hasLoadMoreDone: !mangasPage.hasNextpage,
            status: ExploreStatus.success);
      }

      state = state.copyWith(status: ExploreStatus.ongoing);

      final mangasPage = await callback(_currentPage);
      _currentPage++;

      state = state.copyWith(
          mangas: List.of(state.mangas)..addAll(mangasPage.mangas),
          hasLoadMoreDone: !mangasPage.hasNextpage,
          status: ExploreStatus.success);
    } catch (_) {
      state = state.copyWith(status: ExploreStatus.failure);
    }
  }

  Future<void> getPopulars() async {
    print('Get Populars Call');
    await _getMangas(getPopularsUseCase.getMangas);
  }

  Future<void> getLatest() async {
    print('Get Latest Call');
    await _getMangas(getLatestUseCase.getMangas);
  }

  Future<void> getSearch([String query = '']) async {
    print('Get Search Call');
    if (state.hasLoadMoreDone || state.status == ExploreStatus.ongoing) {
      return;
    }

    try {
      state = state.copyWith(status: ExploreStatus.ongoing);

      // TODO: Make this abstract
      // Maybe GetFilters
      final request = read(tmoFilterProvider);

      final mangasPage = await getSearchUseCase.getMangas(
          _currentPage, query, request.getFilterList());
      _currentPage++;

      state = state.copyWith(
          mangas: List.of(state.mangas)..addAll(mangasPage.mangas),
          hasLoadMoreDone: !mangasPage.hasNextpage,
          status: ExploreStatus.success);
    } catch (_) {
      state = state.copyWith(status: ExploreStatus.failure);
    }
  }

  void refresh() {
    clean();
    getPopulars();
  }

  void clean() {
    _currentPage = 1;
    state = const ExplorePaginaton();
  }
}
