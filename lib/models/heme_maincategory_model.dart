import 'package:heroshop_app/models/category_model.dart';
import 'package:heroshop_app/models/product_model.dart';

class HomeMainCategory {
  final Category category;
  final List<Product> products;

  HomeMainCategory({required this.category, required this.products});

  factory HomeMainCategory.fromMap(Map<String, dynamic> map) {
    return HomeMainCategory(
      category: Category.fromMap(map['category'] ?? {}),
      products: (map['products'] as List? ?? [])
          .map((e) => Product.fromMap(e))
          .toList(),
    );
  }
}
