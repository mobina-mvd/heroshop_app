import 'package:heroshop_app/models/heme_maincategory_model.dart';
import 'package:heroshop_app/models/home_slider_model.dart';
import 'package:heroshop_app/models/product_model.dart';

class HomeResponse {
  final List<HomeSlider> sliders;
  final List<HomeMainCategory> mainCategories;
  final List<Product> offProducts;
  final List<Product> newProducts;
  final List<Product> vipProducts;
  final List<Product> topSellProducts;
  final List<Product> brands;

  HomeResponse({
    required this.sliders,
    required this.mainCategories,
    required this.offProducts,
    required this.newProducts,
    required this.vipProducts,
    required this.topSellProducts,
    required this.brands,
  });

  factory HomeResponse.fromMap(Map<String, dynamic> map) {
    return HomeResponse(
      sliders: (map['sliders'] as List? ?? [])
          .map((e) => HomeSlider.fromMap(e))
          .toList(),

      mainCategories: (map['main_categories'] as List? ?? [])
          .map((e) => HomeMainCategory.fromMap(e))
          .toList(),

      offProducts: (map['off_products'] as List? ?? [])
          .map((e) => Product.fromMap(e))
          .toList(),

      newProducts: (map['new_products'] as List? ?? [])
          .map((e) => Product.fromMap(e))
          .toList(),

      vipProducts: (map['vip_products'] as List? ?? [])
          .map((e) => Product.fromMap(e))
          .toList(),

      topSellProducts: (map['top_sell_products'] as List? ?? [])
          .map((e) => Product.fromMap(e))
          .toList(),

      brands: (map['brands'] as List? ?? [])
          .map((e) => Product.fromMap(e))
          .toList(),
    );
  }
}
