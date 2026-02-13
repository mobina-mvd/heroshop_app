import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://heroshopp.ir/api_demo/api/v1',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Authorization':
            'Bearer NqzfCbN4SurzHgeOvbx6q3xEZlAAqlvUIFwMHZeL03bffbbe',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
}
