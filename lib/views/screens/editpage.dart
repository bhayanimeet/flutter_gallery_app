import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/global.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments as dynamic;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined,
              color: (Global.isDark == true) ? Colors.white : Colors.black),
        ),
        title: Text(
          "Image",
          style: GoogleFonts.arya(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: (Global.isDark == true) ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        backgroundColor: (Global.isDark == true)
            ? const Color(0xff1e1e1e)
            : Colors.blue.shade50,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Global.isDark = !Global.isDark;
              });
            },
            child: Center(
                child: Icon(
              Icons.light_mode_outlined,
              color: (Global.isDark == true) ? Colors.white : Colors.black,
            )),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.895,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: InteractiveViewer(
                clipBehavior: Clip.none,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    data,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.share, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.favorite_border,
                          color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.save_alt_outlined,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
