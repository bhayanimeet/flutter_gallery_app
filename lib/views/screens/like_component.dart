
import 'package:flutter/material.dart';
import 'package:gallery_app/views/screens/category_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../controllers/like_controller.dart';
import '../../models/favorite_model.dart';
import '../../res/global.dart';
import 'package:get/get.dart';

import 'image_component.dart';

class LikeComponent extends StatefulWidget {
  const LikeComponent({Key? key}) : super(key: key);

  @override
  State<LikeComponent> createState() => _LikeComponentState();
}

class _LikeComponentState extends State<LikeComponent> {
  late Future<List<Favorite>> favorite;

  int currentIndex = 2;
  IconData home = Icons.home_outlined;
  IconData category = Icons.category_outlined;
  IconData fav = Icons.favorite;

  @override
  void initState() {
    super.initState();
    favorite = DBHelper.dbHelper.selectData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.isDark ? Colors.black : Colors.white,
      body: FutureBuilder(
        future: favorite,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Images not found..."),
            );
          } else if (snapshot.hasData) {
            List<Favorite>? data = snapshot.data;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 160,
                  toolbarHeight: 80,
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                       borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
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
                              color:
                                  Global.isDark ? Colors.white : Colors.black),
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            flex: 11,
                            child: Text(
                              "Favorite images",
                              style: GoogleFonts.arya(
                                color: (Global.isDark)
                                    ? Colors.white
                                    : Colors.black,
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
                                color:
                                    Global.isDark ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      titlePadding: const EdgeInsets.only(left: 10,bottom: 20),
                    ),
                  ),
                ),
                (data!.isNotEmpty)
                    ? SliverAnimatedList(
                        initialItemCount: data.length,
                        itemBuilder: (context, i, animation) => Padding(
                          padding: const EdgeInsets.all(15),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: 400,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Global.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  border: Border.all(
                                      color: Global.isDark
                                          ? Colors.grey.shade300
                                          : Colors.transparent,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "${data[i].image}",
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, image) {
                                      if (image == null) return child;
                                      return SkeletonAnimation(
                                        shimmerColor: Colors.grey.shade200,
                                        curve: Curves.easeInOut,
                                        child: Container(
                                          height: 400,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.grey.shade50,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white24,
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {
                                    int res = await DBHelper.dbHelper
                                        .deleteData(index: data[i].id!);

                                    if (res == 1) {
                                      setState(() {
                                        favorite =
                                            DBHelper.dbHelper.selectData();
                                      });
                                    }
                                  },
                                  child: const Icon(Icons.delete,
                                      color: Colors.red, size: 30),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                          height: 550,
                          width: double.infinity,
                          color: Colors.transparent,
                          alignment: const Alignment(0, 0),
                          child: Text(
                            "No favorite images...",
                            style: GoogleFonts.arya(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color:
                                  Global.isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
              ],
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                  color: Colors.indigo, size: 40),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
        (Global.isDark) ? const Color(0xff1e1e1e) : Colors.blue.shade50,
        onTap: (val) {
          setState(() {
            currentIndex = val;
            if (currentIndex == 0) {
              home = Icons.home;
              category = Icons.category_outlined;
              fav = Icons.favorite_border;
              Get.to(
                    () => const ImageComponent(),
                duration: const Duration(seconds: 2),
                transition: Transition.fadeIn,
                curve: Curves.easeInOut,
              );
            } else if (currentIndex == 1) {
              home = Icons.home_outlined;
              category = Icons.category_sharp;
              fav = Icons.favorite_border;
              Get.to(
                    () => const CategoryComponent(),
                duration: const Duration(seconds: 2),
                transition: Transition.fadeIn,
                curve: Curves.easeInOut,
              );
            } else if (currentIndex == 2) {
              home = Icons.home_outlined;
              category = Icons.category_outlined;
              fav = Icons.favorite;
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
        currentIndex: 2,
      ),
    );
  }
}
