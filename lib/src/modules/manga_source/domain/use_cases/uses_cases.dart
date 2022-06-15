import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../providers/source/source_provider.dart';
import 'get_latest_use_case.dart';
import 'get_populars_use_case.dart';
import 'get_search_use_case.dart';

import 'interfaces/aget_latest_use_case.dart';
import 'interfaces/aget_populars_use_case.dart';
import 'interfaces/aget_search_use_case.dart';

final getPopularsUseCaseProvider = Provider<AGetPopularsUseCase>((ref) {
  return GetPopularsUseCase(httpRepository: ref.watch(sourceProvider));
});

final getLatestUseCaseProvider = Provider<AGetLatestUseCase>((ref) {
  return GetLatestUseCase(httpRepository: ref.watch(sourceProvider));
});

final getSearchUseCaseProvider = Provider<AGetSearchUseCase>((ref) {
  return GetSearchUseCase(httpRepository: ref.watch(sourceProvider));
});
