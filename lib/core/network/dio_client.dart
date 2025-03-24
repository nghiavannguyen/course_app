import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;
  DioClient() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://172.24.224.1:3001/api/v1',
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
