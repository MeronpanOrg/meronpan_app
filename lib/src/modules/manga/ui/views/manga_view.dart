import 'package:flutter/material.dart';

class MangaView extends StatelessWidget {
  const MangaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(),
        ],
      ),
    );
  }
}
