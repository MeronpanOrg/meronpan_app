import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/ui_provider.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationBar(
      
      selectedIndex: ref.watch<int>(uiProvider),
      onDestinationSelected: (newIndex) {
        ref.read(uiProvider.notifier).changeView(newIndex);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.book_outlined),
          label: 'Biblioteca',
          selectedIcon: Icon(Icons.book),
        ),
        NavigationDestination(
          icon: Icon(Icons.watch_later_outlined),
          label: 'Recientes',
          selectedIcon: Icon(Icons.watch_later),
        ),
        NavigationDestination(
          icon: Icon(Icons.explore_outlined),
          label: 'Explorar',
          selectedIcon: Icon(Icons.explore),
        ),
        NavigationDestination(
          icon: Icon(Icons.more_horiz),
          label: 'Más',
          selectedIcon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
