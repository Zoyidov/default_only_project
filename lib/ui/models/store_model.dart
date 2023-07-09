class StoreModel {
  final int id;
  final String title;
  late final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int count;

  StoreModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.count,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating']['rate'].toDouble(),
      count: json['rating']['count'],
    );
  }
}