import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_source/ahttp_source.dart';

import 'es/tmo_source_provider.dart';

final sourcesProvider = Provider<List<AHttpSource>>((ref) {
  return [ref.watch(tmoSourceProvider)];
});
