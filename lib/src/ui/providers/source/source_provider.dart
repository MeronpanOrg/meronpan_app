import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/http_source.dart';
import 'package:meronpan_app/src/core/config/network/dio_provider.dart';
import 'package:tmo_source/data/data_sources/remote/tmo_source.dart';
import 'package:tmo_source/data/repositories/tmo_repository.dart';

final sourceProvider = StateProvider<AHttpSource>((ref) {
  return TmoRepository(
    TmoSource(dio: ref.read(dioProvider), isSFWMode: false, showAllScans: true),
  );
});
