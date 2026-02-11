import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://heroshopp.ir/api_demo',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Authorization':
            'Bearer hGd8wKiCoZoloAmRJ760qsS3datEg0IKJHHTGYq6e066aa68',
      },
    ),
  );
}
