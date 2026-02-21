import 'package:heroshop_app/config/dio_client.dart';
import 'package:heroshop_app/models/product_model.dart';

class ProductApiService {
  Future<List<Product>> getProducts({required int page}) async {
    try {
      final response = await DioClient.dio.get(
        '/products',
        queryParameters: {'page': page},
      );

      final Map<String, dynamic> responseData = response.data;
      final List<dynamic> dataList = responseData['data'] as List<dynamic>;

      return dataList
          .map((e) => Product.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  
}
