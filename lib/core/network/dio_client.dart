import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:logger/web.dart';

class DioClient {
  late final Dio dio;
  String ipV4 = "192.168.10.77";
  final logger = Logger();
  DioClient() {
    dio = Dio(
      BaseOptions(
          // validateStatus: (status) => status != null && status < 500,
          baseUrl: 'http://$ipV4:3001/api/v1',
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'}),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
      ),
    );
    // Retry Interceptor
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: logger.i,
      retries: 1,
      retryDelays: [
        const Duration(seconds: 1),
      ],
      retryEvaluator: (error, _) => error.type != DioExceptionType.cancel,
    ));
    // Custom Interceptor (e.g. token, error handling)
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Thêm header token nếu cần
        // options.headers['Authorization'] = 'Bearer your_token_here';
        // logger.i('➡️ Sending request: ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.i('✅ Response: ${response.statusCode}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // logger.e('❌ Error: ${e.message}');
        return handler.next(e);
      },
    ));
  }
}
