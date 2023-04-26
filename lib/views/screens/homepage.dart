import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/imageApi_controller.dart';
import 'package:gallery_app/models/image_model.dart';
import 'package:gallery_app/views/screens/editpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../res/global.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController image = TextEditingController();

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
                    color:
                        (Global.isDark == true) ? Colors.white : Colors.black,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              ImageModel? data = snapshot.data;
              if (data != null) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 220,
                      toolbarHeight: 80,
                      pinned: true,
                      flexibleSpace: Container(
                        color: (Global.isDark == true)
                            ? const Color(0xff1e1e1e)
                            : Colors.blue.shade50,
                        child: FlexibleSpaceBar(
                          expandedTitleScale: 1,
                          title: Row(
                            children: [
                              Expanded(
                                flex: 11,
                                child: SizedBox(
                                  height: 70,
                                  width: 200,
                                  child: TextField(
                                    onSubmitted: (val) {
                                      setState(() {
                                        Global.imageTitle = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      hintText: 'Search...',
                                      hintStyle: GoogleFonts.arya(
                                          color: Global.isDark == true
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20),
                                      prefixIcon: Icon(Icons.search,
                                          color: Global.isDark == true
                                              ? Colors.white
                                              : Colors.black),
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
                                    color: Global.isDark == true
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          titlePadding: const EdgeInsets.only(
                              left: 10, bottom: 10, top: 30),
                          background: const Center(child: Text("My Application")),
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
                                    color: Global.isDark == true
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                myContainer(image1: data.image1),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image2),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image3),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image4),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image5),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image6),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image7),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image8),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image9),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image10),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image11),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image12),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image13),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image14),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image15),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image16),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image17),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image18),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                myContainer(image1: data.image19),
                                const SizedBox(width: 8),
                                myContainer(image1: data.image20),
                              ],
                            ),
                            const SizedBox(height: 20),
                            LoadingAnimationWidget.discreteCircle(
                                color: Global.isDark == true
                                    ? Colors.white
                                    : Colors.black,
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
                color: (Global.isDark == true) ? Colors.white : Colors.black,
                size: 40,
              ),
            );
          },
        ),
        backgroundColor: (Global.isDark == true) ? const Color(0xff2a2a2a) : Colors.white,
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
        width: MediaQuery.of(context).size.width / 2.15,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Global.isDark == true ? Colors.grey.shade300 : Colors.black,
          ),
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
                shimmerColor: Colors.grey.shade200,
                curve: Curves.easeInOut,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2.15,
                  color: Colors.grey.shade200,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
