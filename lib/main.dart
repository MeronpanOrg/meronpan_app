import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meronpan_app/src/app.dart';
import 'package:meronpan_app/src/logger.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MeronpanApp(),
    ),
  );
}
