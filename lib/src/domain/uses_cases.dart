

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meronpan_app/src/domain/usecases/get_details_use_case.dart';
import 'package:meronpan_app/src/domain/usecases/get_latest.dart';
import 'package:meronpan_app/src/domain/usecases/get_populars.dart';
import 'package:meronpan_app/src/domain/usecases/get_search_use_case.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_details_use_case.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_latest.dart';
import 'package:meronpan_app/src/domain/usecases/interfaces/aget_populars.dart';
import 'package:meronpan_app/src/ui/providers/source/source_provider.dart';

final getPopularsUseCaseProvider = Provider<AGetPopularsUseCase>((ref) {
  return GetPopularsUseCase(httpRepository: ref.watch(sourceProvider));
});

final getLatestUseCaseProvider = Provider<AGetLatestUseCase>((ref) {
  return GetLatestUseCase(httpRepository: ref.watch(sourceProvider));
});

final getSearchUseCaseProvider = Provider<GetSearchUseCase>((ref) {
  return GetSearchUseCase(httpRepository: ref.watch(sourceProvider));
});

final getDetailsUseCaseProvider = Provider<AGetDetailsUseCase>((ref) {
  return GetDetailsUseCase(httpRepository: ref.watch(sourceProvider));
});
