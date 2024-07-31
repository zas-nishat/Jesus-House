class ProductModel {
  final String name;
  final double price;
  final List<String> images;
  final int quantity;
  final String supplier;
  final String date;
  final String description;

  ProductModel({
    required this.name,
    required this.price,
    required this.images,
    required this.quantity,
    required this.supplier,
    required this.date,
    required this.description,
  });
}
