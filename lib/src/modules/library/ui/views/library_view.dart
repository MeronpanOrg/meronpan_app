import 'package:flutter/material.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca'),
      ),
      body: const Center(
        child: Text(
          'Estoy en trabajo :(',
        ),
      ),
    );
  }
}
