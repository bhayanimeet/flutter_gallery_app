class ImageModel {
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String image6;
  final String image7;
  final String image8;
  final String image9;
  final String image10;
  final String image11;
  final String image12;
  final String image13;
  final String image14;
  final String image15;
  final String image16;
  final String image17;
  final String image18;
  final String image19;
  final String image20;

  ImageModel({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.image7,
    required this.image8,
    required this.image9,
    required this.image10,
    required this.image11,
    required this.image12,
    required this.image13,
    required this.image14,
    required this.image15,
    required this.image16,
    required this.image17,
    required this.image18,
    required this.image19,
    required this.image20,
  });

  factory ImageModel.fromMap({required Map data}){
    return ImageModel(
        image1: data['hits'][0]['largeImageURL'],
        image2: data['hits'][1]['largeImageURL'],
        image3: data['hits'][2]['largeImageURL'],
        image4: data['hits'][3]['largeImageURL'],
        image5: data['hits'][4]['largeImageURL'],
        image6: data['hits'][5]['largeImageURL'],
        image7: data['hits'][6]['largeImageURL'],
        image8: data['hits'][7]['largeImageURL'],
        image9: data['hits'][8]['largeImageURL'],
        image10: data['hits'][9]['largeImageURL'],
        image11: data['hits'][10]['largeImageURL'],
        image12: data['hits'][11]['largeImageURL'],
        image13: data['hits'][12]['largeImageURL'],
        image14: data['hits'][13]['largeImageURL'],
        image15: data['hits'][14]['largeImageURL'],
        image16: data['hits'][15]['largeImageURL'],
        image17: data['hits'][16]['largeImageURL'],
        image18: data['hits'][17]['largeImageURL'],
        image19: data['hits'][18]['largeImageURL'],
        image20: data['hits'][19]['largeImageURL'],
    );
  }
}
