import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/image_model.dart';
import '../res/global.dart';

class ImageApiHelper extends GetxController {
  ImageApiHelper._();

  static final ImageApiHelper apiHelper = ImageApiHelper._();

  Future<ImageModel?> fetchData() async {
    http.Response result = await http.get(
      Uri.parse(
          'https://pixabay.com/api/?key=35722369-0ff268194d7105d16de321576&q=${Global.imageTitle}&image_type=photo&pretty=true'),
    );

    if (result.statusCode == 200) {
      Map decodeData = jsonDecode(result.body);

      ImageModel image = ImageModel.fromMap(data: decodeData);

      return image;
    }
    update();

    return null;
  }
}
