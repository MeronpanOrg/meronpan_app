import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExploreView extends ConsumerWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverAppBar(
            backgroundColor: Colors.red,
            shape: const StadiumBorder(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.view_list_sharp),
              ),
              IconButton(
                onPressed: () {
                  // ref.read(exploreProvider.notifier).refresh();
                },
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card();
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              crossAxisCount: Platform.isWindows ? 6 : 3,
              mainAxisExtent: 220,
            ),
          ),
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
