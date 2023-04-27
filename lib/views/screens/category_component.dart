import 'package:flutter/material.dart';
import 'package:gallery_app/views/screens/image_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../res/global.dart';
import 'detail.dart';
import 'like_component.dart';

class CategoryComponent extends StatefulWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent> {
  int currentIndex = 1;
  IconData home = Icons.home_outlined;
  IconData category = Icons.category_sharp;
  IconData fav = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.isDark ? Colors.black : Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            pinned: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(25)),
                color: (Global.isDark)
                    ? const Color(0xff1e1e1e)
                    : Colors.blue.shade50,
              ),
              child: FlexibleSpaceBar(
                expandedTitleScale: 1,
                background: Align(
                    alignment: const Alignment(-0.9, -0.4),
                    child: Text(
                      "Albums",
                      style: GoogleFonts.arya(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Global.isDark ? Colors.white : Colors.black),
                    )),
                title: Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: Text(
                        "Category",
                        style: GoogleFonts.arya(
                          color: (Global.isDark) ? Colors.white : Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.isDark = !Global.isDark;
                          });
                        },
                        child: Icon(
                          Icons.light_mode_outlined,
                          color: Global.isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                titlePadding: const EdgeInsets.only(left: 10, bottom: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Popular Searches",
                        style: GoogleFonts.play(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Global.isDark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                          color: Global.isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      myContainer(
                          title: 'Lion\nImages',
                          myColor: Colors.indigo.shade300,
                          nav: 'lion'),
                      const SizedBox(width: 10),
                      myContainer(
                          title: 'Quotes\nImages',
                          myColor: Colors.blue.shade300,
                          nav: 'quotes'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      myContainer(
                          title: 'Sunset\nImages',
                          myColor: Colors.purple.shade200,
                          nav: 'sunset'),
                      const SizedBox(width: 10),
                      myContainer(
                          title: 'Hill\nImages',
                          myColor: Colors.teal.shade300,
                          nav: 'hill'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      myContainer(
                          title: 'River\nImages',
                          myColor: Colors.orange.shade400,
                          nav: 'river'),
                      const SizedBox(width: 10),
                      myContainer(
                          title: 'Animal\nImages',
                          myColor: Colors.pink.shade300,
                          nav: 'animal'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      myContainer(
                          title: 'FLower\nImages',
                          myColor: Colors.red.shade300,
                          nav: 'flower'),
                      const SizedBox(width: 10),
                      myContainer(
                          title: 'Fruit\nImages',
                          myColor: Colors.green.shade400,
                          nav: 'fruit'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      myContainer(
                          title: 'Book\nImages',
                          myColor: Colors.amber.shade400,
                          nav: 'book'),
                      const SizedBox(width: 10),
                      myContainer(
                          title: 'Pizza\nImages',
                          myColor: Colors.deepPurple.shade300,
                          nav: 'pizza'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  LoadingAnimationWidget.discreteCircle(
                      color: Global.isDark ? Colors.white : Colors.black,
                      size: 30),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            (Global.isDark) ? const Color(0xff1e1e1e) : Colors.blue.shade50,
        onTap: (val) {
          setState(() {
            currentIndex = val;
            if (currentIndex == 0) {
              home = Icons.home;
              fav = Icons.favorite_border;
              category = Icons.category_outlined;
              Get.to(
                () => const ImageComponent(),
                duration: const Duration(seconds: 2),
                transition: Transition.fadeIn,
                curve: Curves.easeInOut,
              );
            } else if (currentIndex == 1) {
              home = Icons.home_outlined;
              fav = Icons.favorite_border;
              category = Icons.category_sharp;
            } else if (currentIndex == 2) {
              home = Icons.home_outlined;
              fav = Icons.favorite;
              category = Icons.category_outlined;
              Get.to(
                () => const LikeComponent(),
                duration: const Duration(seconds: 2),
                transition: Transition.fadeIn,
                curve: Curves.easeInOut,
              );
            }
          });
        },
        selectedItemColor: Global.isDark ? Colors.white : Colors.black,
        unselectedItemColor: Global.isDark ? Colors.white30 : Colors.black45,
        items: [
          BottomNavigationBarItem(icon: Icon(home, size: 30), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(category, size: 30), label: "Category"),
          BottomNavigationBarItem(icon: Icon(fav, size: 30), label: "Favorite"),
        ],
        currentIndex: 1,
      ),
    );
  }

  Widget myContainer(
      {required String title, required Color myColor, required String nav}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Global.imageTitle = nav;
        });
        Get.to(
          () => const DetailPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width / 2.16,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: myColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: Global.isDark ? Colors.white38 : Colors.grey.shade400,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.arya(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
