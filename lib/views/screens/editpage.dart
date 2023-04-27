import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../controllers/like_controller.dart';
import '../../models/favorite_model.dart';
import '../../res/global.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> with TickerProviderStateMixin {
  bool isLiked = false;
  double min = 1;
  double max = 10;

  late TransformationController transformationController;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: transformationController.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animationController.forward(from: 0);
  }

  @override
  void initState() {
    super.initState();
    transformationController = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() => transformationController.value = animation!.value);
  }

  @override
  void dispose() {
    super.dispose();
    transformationController.dispose();
    animationController.dispose();
  }

  File? image;

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Icon(Icons.arrow_back_outlined,
              color: (Global.isDark) ? Colors.white : Colors.black),
        ),
        title: Text(
          "Image",
          style: GoogleFonts.arya(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: (Global.isDark) ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        backgroundColor:
            (Global.isDark) ? const Color(0xff1e1e1e) : Colors.blue.shade50,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.895,
              width: MediaQuery.of(context).size.width,
              color: (Global.isDark)?Colors.black:Colors.white,
              child: InteractiveViewer(
                transformationController: transformationController,
                clipBehavior: Clip.none,
                panEnabled: false,
                minScale: min,
                maxScale: max,
                onInteractionEnd: (detail) {
                  resetAnimation();
                },
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
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async{
                          final url = Uri.parse(data);
                          final response = await http.get(url);
                          final bytes = response.bodyBytes;

                          final temp = await getTemporaryDirectory();
                          final path = '${temp.path}/image.jpg';
                          File(path).writeAsBytesSync(bytes);

                          await Share.shareFiles([path]);

                        },
                        child: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Favorite f1 = Favorite(
                            image: data,
                          );
                          await DBHelper.dbHelper.insertData(data: f1);
                          setState(() {
                            if (isLiked == false) {
                              isLiked = true;
                              Get.showSnackbar(
                                GetSnackBar(
                                  title: 'Favorite',
                                  backgroundColor: Colors.indigo.shade100,
                                  snackPosition: SnackPosition.BOTTOM,
                                  borderRadius: 20,
                                  duration: const Duration(seconds: 2),
                                  margin: const EdgeInsets.all(15),
                                  message: 'Added to favorite...',
                                  snackStyle: SnackStyle.FLOATING,
                                ),
                              );
                            } else if (isLiked == true) {
                              isLiked = false;
                            }
                          });
                        },
                        child: (isLiked == false)
                            ? const Icon(
                                Icons.star_border_outlined,
                                color: Colors.white,
                                size: 30,
                              )
                            : const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 30,
                              ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          await GallerySaver.saveImage(data);
                          Get.showSnackbar(
                            GetSnackBar(
                              title: 'Download',
                              backgroundColor: Colors.indigo.shade100,
                              snackPosition: SnackPosition.BOTTOM,
                              borderRadius: 20,
                              duration: const Duration(seconds: 2),
                              margin: const EdgeInsets.all(15),
                              message: 'Image downloaded...',
                              snackStyle: SnackStyle.FLOATING,
                            ),
                          );

                        },
                        child: const Icon(
                          Icons.save_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
