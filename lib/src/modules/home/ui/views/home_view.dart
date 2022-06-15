import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../explore/ui/views/explore_view.dart';
import '../../../library/ui/views/library_view.dart';
import '../../../more/ui/views/more_view.dart';
import '../../../recents/ui/views/recents_view.dart';
import '../providers/controller_provider.dart';
import '../widgets/nav_bar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: ref.watch(controllerProvider),
        children: const [
          LibraryView(),
          RecentsView(),
          ExploreView(),
          MoreView(),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
