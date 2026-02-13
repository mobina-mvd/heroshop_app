import 'package:heroshop_app/config/dio_client.dart';
import 'package:heroshop_app/models/product_model.dart';

class ProductApiService {
  Future<List<Product>> getProducts() async {
    try {
      final response = await DioClient.dio.get('/products');

      final Map<String, dynamic> responseData = response.data;
      final List<dynamic> dataList = responseData['data'] as List<dynamic>;

      return dataList
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getVipProducts() async {
    final products = await getProducts();

    return products.where((p) => p.vip == true).toList();
  }
}
