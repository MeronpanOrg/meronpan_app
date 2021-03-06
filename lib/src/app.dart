import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meronpan_app/src/modules/manga_source/ui/views/manga_source_view.dart';

import 'modules/home/ui/views/home_view.dart';
import 'modules/manga/ui/views/manga_view.dart';

class MeronpanApp extends StatelessWidget {
  const MeronpanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meronpan',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/source': (context) => const MangaSourceView(),
        '/manga': (context) => const MangaView()
      },
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: const Color(0xfffcfcfc),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.lightBlueAccent,
          height: 70,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        navigationRailTheme:
            Platform.isWindows ? _buildWindowsRailTheme() : _buildRailTheme(),
      ),
    );
  }

  NavigationRailThemeData _buildRailTheme() {
    return const NavigationRailThemeData(
      useIndicator: true,
      backgroundColor: Colors.white,
      indicatorColor: Colors.lightBlueAccent,
      groupAlignment: 0.5,
      selectedLabelTextStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      unselectedLabelTextStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      selectedIconTheme: IconThemeData(color: Colors.black),
    );
  }

  NavigationRailThemeData _buildWindowsRailTheme() {
    return const NavigationRailThemeData(
      useIndicator: true,
      backgroundColor: Colors.white,
      indicatorColor: Colors.lightBlueAccent,
      selectedLabelTextStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      unselectedLabelTextStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      selectedIconTheme: IconThemeData(color: Colors.black),
    );
  }
}
