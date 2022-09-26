class Product {
  final String id;
  final String title;
  final String description;
  final String price;
  final String discountPercentage;
  final String rating;
  final String stock;
  final String brand;
  final String category;
  final String thumbnail;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
  });

  static Product fromJson(json) => Product(
        id: 'id',
        title: 'title',
        description: 'description',
        price: 'price',
        discountPercentage: 'discountPercentage',
        rating: 'rating',
        stock: 'stock',
        brand: 'brand',
        category: 'category',
        thumbnail: 'thumbnail',
      );
}
