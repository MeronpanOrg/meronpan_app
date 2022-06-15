import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/ahttp_source.dart';
import 'package:meronpan_app/src/core/config/network/dio_provider.dart';
import 'package:tmo_source/data/data_sources/remote/tmo_data_source.dart';
import 'package:tmo_source/data/repositories/tmo_source.dart';

final tmoSourceProvider = Provider<AHttpSource>((ref) {
  return TmoSource(
    TmoDataSource(
        dio: ref.watch(dioProvider), isSFWMode: true, showAllScans: true),
  );
});
