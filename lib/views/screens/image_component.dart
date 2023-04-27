import 'package:flutter/material.dart';
import 'package:gallery_app/res/global.dart';
import 'package:gallery_app/views/screens/category_component.dart';
import 'package:gallery_app/views/screens/editpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:get/get.dart';
import '../../controllers/imageApi_controller.dart';
import '../../models/image_model.dart';
import 'like_component.dart';

class ImageComponent extends StatefulWidget {
  const ImageComponent({Key? key}) : super(key: key);

  @override
  State<ImageComponent> createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent> {
  int currentIndex = 0;
  IconData home = Icons.home;
  IconData category = Icons.category_outlined;
  IconData fav = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: FutureBuilder(
          future: ImageApiHelper.apiHelper.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Image not found",
                  style: GoogleFonts.arya(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: (Global.isDark) ? Colors.white : Colors.black,
                  ),
                ),
              );
            }
            else if (snapshot.hasData) {
              ImageModel? data = snapshot.data;
              if (data != null) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 160,
                      toolbarHeight: 80,
                      automaticallyImplyLeading: false,
                      pinned: true,
                      backgroundColor: Colors.transparent,
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
                            alignment: const Alignment(0, -0.4),
                            child: Text(
                              "Albums",
                              style: GoogleFonts.arya(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Global.isDark
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                flex: 11,
                                child: SizedBox(
                                  height: 50,
                                  width: 200,
                                  child: TextField(
                                    onSubmitted: (val) {
                                      setState(() {
                                        Global.imageTitle = val;
                                      });
                                    },
                                    style: GoogleFonts.arya(
                                      color: Global.isDark
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16,
                                    ),
                                    cursorColor: Global.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          borderSide: BorderSide(
                                              color: (Global.isDark)
                                                  ? Colors.grey.shade300
                                                  : Colors.black54)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                          color: (Global.isDark)
                                              ? Colors.grey.shade300
                                              : Colors.black54,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          borderSide: BorderSide(
                                              color: (Global.isDark)
                                                  ? Colors.grey.shade300
                                                  : Colors.black54)),
                                      hintText: 'Search...',
                                      hintStyle: GoogleFonts.arya(
                                        color: Global.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 20,
                                        color: Global.isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
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
                                    color: Global.isDark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          titlePadding: const EdgeInsets.only(
                              left: 10, bottom: 20),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${Global.imageTitle} Images",
                                  style: GoogleFonts.arya(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Global.isDark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image1),
                                myContainer(image1: data.image2),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image3),
                                myContainer(image1: data.image4),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image5),
                                myContainer(image1: data.image6),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image7),
                                myContainer(image1: data.image8),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image9),
                                myContainer(image1: data.image10),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image11),
                                myContainer(image1: data.image12),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image13),
                                myContainer(image1: data.image14),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image15),
                                myContainer(image1: data.image16),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image17),
                                myContainer(image1: data.image18),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                myContainer(image1: data.image19),
                                myContainer(image1: data.image20),
                              ],
                            ),
                            const SizedBox(height: 20),
                            LoadingAnimationWidget.discreteCircle(
                                color:
                                    Global.isDark ? Colors.white : Colors.black,
                                size: 30),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            }
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: (Global.isDark) ? Colors.white : Colors.black,
                size: 40,
              ),
            );
          },
        ),
        backgroundColor: (Global.isDark == true) ? const Color(0xff2a2a2a) : Colors.white,
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
              } else if (currentIndex == 1) {
                home = Icons.home_outlined;
                fav = Icons.favorite_border;
                category = Icons.category_sharp;
                Get.to(
                      () => const CategoryComponent(),
                  duration: const Duration(seconds: 2),
                  transition: Transition.fadeIn,
                  curve: Curves.easeInOut,
                );
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
          currentIndex: 0,
        ),
      ),
    );
  }

  Widget myContainer({required String image1}) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const EditPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          arguments: image1,
        );
      },
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Global.isDark ? Colors.white54 : Colors.grey.shade400,
            ),
          ],
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            image1,
            filterQuality: FilterQuality.high,
            fit: BoxFit.fitHeight,
            loadingBuilder: (context, child, image) {
              if (image == null) return child;
              return SkeletonAnimation(
                shimmerColor: Global.isDark?Colors.black12:Colors.grey.shade200,
                curve: Curves.easeInOut,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2.15,
                  color: Global.isDark?Colors.black45:Colors.grey.shade50,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
