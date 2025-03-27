import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;
  String ipV4 = "172.29.0.1";
  DioClient() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://$ipV4:3001/api/v1',
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
