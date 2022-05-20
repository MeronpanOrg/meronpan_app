import 'package:flutter/material.dart';
import 'package:meronpan_app/src/ui/views/home/layouts/android_layout.dart';
import 'package:meronpan_app/src/ui/views/home/layouts/windows_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const AndroidLayout();
        } else {
         return const WindowsLayout();
        }
      },
    );
  }
}
