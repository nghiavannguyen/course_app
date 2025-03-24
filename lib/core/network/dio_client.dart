import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;
  DioClient() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 20),
          headers: {'Content-Type': 'application/json'}),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
