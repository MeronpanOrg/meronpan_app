import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/ahttp_source.dart';
import 'package:tmo_source/data/data_sources/remote/tmo_data_source.dart';
import 'package:tmo_source/data/repositories/tmo_source.dart';

import '../../core/config/network/dio_provider.dart';

final sourceProvider = StateProvider<AHttpSource>((ref) {
  return TmoSource(TmoDataSource(
      dio: ref.read(dioProvider), isSFWMode: true, showAllScans: true));
});
