import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meronpan_app/src/ui/providers/ui/ui_provider.dart';
import 'package:meronpan_app/src/ui/views/explore/explore_view.dart';
import 'package:meronpan_app/src/ui/views/home/home_view.dart';
import 'package:meronpan_app/src/ui/views/home/widgets/nav_bar.dart';
import 'package:meronpan_app/src/ui/views/home/widgets/nav_rail.dart';
import 'package:meronpan_app/src/ui/views/library/library_view.dart';
import 'package:meronpan_app/src/ui/views/more/more_view.dart';
import 'package:meronpan_app/src/ui/views/recents/recents_view.dart';

class WindowsLayout extends ConsumerWidget {
  const WindowsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int page = ref.watch(uiProvider);

    return Scaffold(
      body: Row(
        children: [
          const NavRail(),
          Expanded(child: _buildPage(page)),
        ],
      ),
    );
  }

  Widget _buildPage(int page) {
    switch (page) {
      case 0:
        return const LibraryView();
      case 1:
        return const RecentsView();
      case 2:
        return const ExploreView();
      case 3:
        return const MoreView();
      default:
        return const HomeView();
    }
  }
}
