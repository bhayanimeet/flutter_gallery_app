import 'dart:async';
import 'package:gallery_app/views/screens/image_component.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.off(
        () => const ImageComponent(),
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 3),
        transition: Transition.fadeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Global.isDark)?const Color(0xff1e1e1e):Colors.white,
      body: Center(
        child: Stack(
          alignment: const Alignment(0, 1.05),
          children: [
            Image.asset('assets/images/logo.png').animate().fadeIn(
                curve: Curves.easeInOut, duration: const Duration(seconds: 3)),
            Text(
              "Gallery app",
              style:
                  GoogleFonts.arya(fontSize: 35, fontWeight: FontWeight.w600,color: (Global.isDark)?Colors.white:Colors.black),
            ).animate().fadeIn(
                curve: Curves.easeInOut, duration: const Duration(seconds: 3)),
          ],
        ),
      ),
    );
  }
}
