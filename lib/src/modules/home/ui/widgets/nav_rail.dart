import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/ui_provider.dart';

class NavRail extends ConsumerWidget {
  final bool isExtended;

  const NavRail({Key? key, this.isExtended = false}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int page = ref.watch(uiProvider);

    return NavigationRail(
      extended: isExtended,
      selectedIndex: page,
      useIndicator: true,
      onDestinationSelected: (newIndex) {
        ref.read(uiProvider.notifier).changeView(newIndex);
      },
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.book_outlined),
          label: Text('Biblioteca'),
          selectedIcon: Icon(Icons.book),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.watch_later_outlined),
          label: Text('Recientes'),
          selectedIcon: Icon(Icons.watch_later),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.explore_outlined),
          label: Text('Explorar'),
          selectedIcon: Icon(Icons.explore),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.more_horiz),
          label: Text('Más'),
          selectedIcon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
