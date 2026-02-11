import 'package:heroshop_app/config/dio_client.dart';
import 'package:heroshop_app/models/product_model.dart';

class ProductApiService {
  Future<List<Product>> getProducts() async {
    final response = await DioClient.dio.get('/api/v1/products');

    final List data = response.data;

    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getVipProducts() async {
    final products = await getProducts();

    return products.where((p) => p.vip == true).toList();
  }
}
