import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://heroshopp.ir/api_demo/api/v1',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Authorization':
            'Bearer MPGFPPH9dHTwjYO1GRJrSfC5Q5mjeVjC0mKMUl8Fb9c03632',
        // 'Accept': 'application/json',
        // 'Content-Type': 'application/json',
      },
    ),
  );
}
