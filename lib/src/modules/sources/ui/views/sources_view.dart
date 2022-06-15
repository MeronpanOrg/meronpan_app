import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../providers/source/source_provider.dart';
import '../../../../providers/sources/sources_provider.dart';

class SourcesView extends ConsumerWidget {
  const SourcesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sources = ref.watch(sourcesProvider);

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              ref.read(sourceProvider.notifier).state = sources[index];

              Navigator.pushNamed(context, '/source');
            },
            title: Text(sources[index].name),
          );
        },
        itemCount: sources.length,
      ),
    );
  }
}
