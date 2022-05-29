import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:meronpan_app/src/app.dart';
import 'package:meronpan_app/src/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await path_provider.getApplicationDocumentsDirectory();

  print(dir.path);

  await Hive.initFlutter(dir.path);

  // debugRepaintRainbowEnabled = true;

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MeronpanApp(),
    ),
  );
}
