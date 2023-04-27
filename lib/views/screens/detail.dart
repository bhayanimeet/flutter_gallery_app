import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:get/get.dart';
import '../../controllers/imageApi_controller.dart';
import '../../models/image_model.dart';
import '../../res/global.dart';
import 'editpage.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          } else if (snapshot.hasData) {
            ImageModel? data = snapshot.data;
            if (data != null) {
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
                                color: Global.isDark
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        title: Expanded(
                          flex: 11,
                          child: Text(
                            "${Global.imageTitle} Image",
                            style: GoogleFonts.arya(
                              color: (Global.isDark)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
                          const SizedBox(height: 20),
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
      backgroundColor:
          (Global.isDark == true) ? const Color(0xff2a2a2a) : Colors.white,
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
                shimmerColor:
                    Global.isDark ? Colors.black12 : Colors.grey.shade200,
                curve: Curves.easeInOut,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2.15,
                  color: Global.isDark ? Colors.black45 : Colors.grey.shade50,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
