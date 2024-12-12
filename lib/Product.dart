import 'package:scoped_model/scoped_model.dart';

class Product extends Model {
  final String name;
  final String description;
  final int price;
  final String image;
  int rating;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.rating = 0,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      image: json['image'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }

  void updateRating(int myRating) {
    rating = myRating;
    notifyListeners();
  }

  static List<Product> getProducts() {
    return [
      Product(
        name: "Pixel",
        description: "Pixel is the most feature-full phone ever",
        price: 800,
        image: "pixel.png",
      ),
      Product(
        name: "Laptop",
        description: "Laptop is the most productive development tool",
        price: 2000,
        image: "laptop.png",
      ),
      Product(
        name: "Tablet",
        description: "Tablet is the most useful device ever for meeting",
        price: 1500,
        image: "tablet.png",
      ),
      Product(
        name: "Pendrive",
        description: "Pendrive is useful storage medium",
        price: 100,
        image: "pendrive.png",
      ),
      Product(
        name: "Floppy Drive",
        description: "Floppy drive is useful rescue storage medium",
        price: 20,
        image: "floppy.png",
      ),
    ];
  }
}
