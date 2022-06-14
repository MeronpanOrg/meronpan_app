import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ui_provider.dart';

final controllerProvider = Provider<PageController>((ref) {
  PageController pageController = PageController();

  ref.listen<int>(uiProvider, (int? previous, int next) {
    pageController.jumpToPage(next);
  });

  return pageController;
}, name: 'Page Controller Provider');
