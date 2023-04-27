class Favorite {
  int? id;
  String? image;

  Favorite({
    this.id,
    required this.image,
  });

  factory Favorite.fromMap({required Map<String, dynamic> data}) {
    return Favorite(
      id: data['id'],
      image: data['image'],
    );
  }
}