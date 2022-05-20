import 'package:flutter/material.dart';
import 'package:meronpan_app/src/ui/views/home/layouts/android_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width > 900) {
      return WindowsLayout();
    }

    return const AndroidLayout();
  }
}
