import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gallery_app/views/screens/editpage.dart';
import 'package:gallery_app/views/screens/homepage.dart';
import 'package:gallery_app/views/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(useMaterial3: true),
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/edit', page: () => const EditPage()),
      ],
    ),
  );
}
