import 'package:flutter/material.dart';

import '../../../sources/ui/views/sources_view.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Explorar'),
          bottom: const TabBar(
            labelColor: Colors.black,
            isScrollable: false,
            tabs: [
              Tab(
                text: 'Internet',
              ),
              Tab(
                text: 'Locales',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const SourcesView(),
            Container(), // TODO: Add Local source
          ],
        ),
      ),
    );
  }
}
