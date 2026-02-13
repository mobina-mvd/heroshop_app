import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://heroshopp.ir/api_demo/api/v1',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Authorization':
            'Bearer G6JS8WL57ihIee9HYojbNyQpqXZEQTm7BHU93tT6332034ea',
        // 'Accept': 'application/json',
        // 'Content-Type': 'application/json',
      },
    ),
  );
}
