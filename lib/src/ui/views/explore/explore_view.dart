import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
