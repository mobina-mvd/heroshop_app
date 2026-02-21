import 'package:heroshop_app/config/dio_client.dart';
import 'package:heroshop_app/models/home_response_model.dart';

class HomePageApiServices {
  Future<HomeResponse> getHomePageData() async {
    try {
      final response = await DioClient.dio.get('/index');

      final Map<String, dynamic> data = response.data;

      return HomeResponse.fromMap(data);
    } catch (e) {
      throw Exception(':خطا در دریافت اطلاعات صفحه اصلی $e');
    }
  }
}
