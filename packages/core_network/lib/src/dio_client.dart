import 'package:core_network/src/models/api_result.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:logger/web.dart';

/// Base class for all models that can be serialized from JSON
abstract class JsonSerializable<T> {
  T fromJson(Map<String, dynamic> json);
}

/// DioException Types that can be thrown:
///
/// - DioExceptionType.connectionTimeout: When connection times out
/// - DioExceptionType.sendTimeout: When sending data times out
/// - DioExceptionType.receiveTimeout: When receiving data times out
/// - DioExceptionType.badResponse: When the server response has an invalid status code
/// - DioExceptionType.cancel: When the request is cancelled
/// - DioExceptionType.connectionError: When there's a connection error (no internet, etc)
/// - DioExceptionType.badCertificate: When there's an SSL/TLS certificate error
/// - DioExceptionType.unknown: For any other unknown errors

class DioClient {
  late final Dio dio;
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;
  final int maxRetries;
  final List<Duration> retryDelays;
  final Map<String, String> defaultHeaders;
  final logger = Logger();

  DioClient({
    this.baseUrl = 'http://10.10.10.200:3001/api/v1',
    this.connectTimeout = const Duration(seconds: 10),
    this.receiveTimeout = const Duration(seconds: 10),
    this.sendTimeout = const Duration(seconds: 10),
    this.maxRetries = 3,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
    this.defaultHeaders = const {'Content-Type': 'application/json'},
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        headers: defaultHeaders,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    // Logging Interceptor
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        logPrint: (object) => logger.i(object.toString()),
      ),
    );

    // Retry Interceptor
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: logger.i,
        retries: maxRetries,
        retryDelays: retryDelays,
        retryEvaluator: (error, _) => _shouldRetry(error),
      ),
    );

    // Custom Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  bool _shouldRetry(DioException error) {
    return error.type != DioExceptionType.cancel &&
        error.type != DioExceptionType.badResponse &&
        error.type != DioExceptionType.badCertificate;
  }

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add auth token if available
    final token = await _getAuthToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    logger.i('➡️ Request: ${options.uri}');
    return handler.next(options);
  }

  Future<void> _onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    logger.i('✅ Response: ${response.statusCode}');
    return handler.next(response);
  }

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    logger.e('❌ Error: ${error.message}');
    return handler.next(error);
  }

  Future<String?> _getAuthToken() async {
    // Implement token retrieval logic
    return null;
  }

  /// Handle DioException and return appropriate error message
  ApiResult<T> handleError<T>(DioException error) {
    String errorMessage;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Kết nối timeout';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Gửi dữ liệu timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Nhận dữ liệu timeout';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Lỗi chứng chỉ SSL/TLS';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _getErrorMessageFromResponse(error.response);
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request bị hủy';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Không thể kết nối đến server';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Lỗi không xác định: ${error.message}';
        break;
    }

    return ApiResult.failure(errorMessage);
  }

  /// Get error message from response
  String _getErrorMessageFromResponse(Response? response) {
    if (response == null) return 'Không có response từ server';

    try {
      final data = response.data;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return data['message'];
      }
    } catch (e) {
      logger.e('Error parsing error message: $e');
    }

    return 'Server trả về lỗi: ${response.statusCode}';
  }
}
