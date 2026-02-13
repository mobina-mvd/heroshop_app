import 'package:heroshop_app/config/dio_client.dart';
import 'package:heroshop_app/models/maincategory_model.dart';
import 'package:heroshop_app/models/product_model.dart';
import 'package:heroshop_app/models/slider_model.dart';

class HomePageApiServices {
  Future<Map<String, dynamic>> getAllHomePageData() async {
    try {
      final response = await DioClient.dio.get('/index');

      final Map<String, dynamic> data = await response.data;

      return data;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Slider>> getSliderData() async {
    try {
      final Map<String, dynamic> baseData = await getAllHomePageData();
      final List<dynamic> dataList = await baseData['sliders'] as List<dynamic>;
      final List<Slider> sliders = dataList
          .map((e) => Slider.fromMap(e))
          .toList();

      return sliders;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<MainCategory>> getMainCategoryData() async {
    try {
      final Map<String, dynamic> baseData = await getAllHomePageData();
      final List<dynamic> dataList =
          await baseData['main_categories'] as List<dynamic>;
      final List<MainCategory> mainCategories = dataList
          .map((e) => MainCategory.fromMap(e['category']))
          .toList();

      return mainCategories;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getOffProductData() async {
    try {
      final Map<String, dynamic> baseData = await getAllHomePageData();
      final List<dynamic> dataList =
          await baseData['off_products'] as List<dynamic>;
      final List<Product> offProducts = dataList
          .map((e) => Product.fromMap(e))
          .toList();

      return offProducts;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getNewProductData() async {
    try {
      final Map<String, dynamic> baseData = await getAllHomePageData();
      final List<dynamic> dataList =
          await baseData['new_products'] as List<dynamic>;
      final List<Product> newProducts = dataList
          .map((e) => Product.fromMap(e))
          .toList();

      return newProducts;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getVipProductData() async {
    try {
      final Map<String, dynamic> baseData = await getAllHomePageData();
      final List<dynamic> dataList =
          await baseData['vip_products'] as List<dynamic>;
      final List<Product> vipProducts = dataList
          .map((e) => Product.fromMap(e))
          .toList();

      return vipProducts;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getTopSellProductData() async {
    try {
      final Map<String, dynamic> baseData = await getAllHomePageData();
      final List<dynamic> dataList =
          await baseData['top_sell_products'] as List<dynamic>;
      final List<Product> topSellProducts = dataList
          .map((e) => Product.fromMap(e))
          .toList();

      return topSellProducts;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getBrandsData() async {
    try {
      final Map<String, dynamic> baseData = await getAllHomePageData();
      final List<dynamic> dataList = await baseData['brands'] as List<dynamic>;
      final List<Product> brands = dataList
          .map((e) => Product.fromMap(e))
          .toList();

      return brands;
    } catch (e) {
      return Future.error(e);
    }
  }
}
