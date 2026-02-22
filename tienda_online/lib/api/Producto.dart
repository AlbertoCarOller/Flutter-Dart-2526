class Producto {
  Producto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

  @override
  String toString() {
    return "$id, $title, $price, $description, $category, $image, $rating, ";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Producto && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Rating {
  Rating({required this.rate, required this.count});

  final double? rate;
  final int? count;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json["rate"], count: json["count"]);
  }

  @override
  String toString() {
    return "$rate, $count, ";
  }


}