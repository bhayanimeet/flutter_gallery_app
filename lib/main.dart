import 'package:flutter/material.dart';
import 'package:gallery_app/views/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(useMaterial3: true),
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
      ],
    ),
  );
}
