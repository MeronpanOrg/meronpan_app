import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meronpan_app/src/ui/providers/ui/ui_provider.dart';

class NavRail extends ConsumerWidget {
  const NavRail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int page = ref.watch(uiProvider);

    return NavigationRail(
      selectedIndex: page,
      useIndicator: true,
      labelType: NavigationRailLabelType.all,
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
