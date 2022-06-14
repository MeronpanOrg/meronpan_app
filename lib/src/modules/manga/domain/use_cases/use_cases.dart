
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/source/source_provider.dart';
import 'get_details_use_case.dart';
import 'interfaces/aget_details_use_case.dart';

final getDetailsUseCaseProvider = Provider<AGetDetailsUseCase>((ref) {
  return GetDetailsUseCase(httpRepository: ref.watch(sourceProvider));
});