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
// GET request
// final result = await client.get<User>(
//   '/users/1',
//   fromJson: User.fromJson,  // Truyền factory constructor
// );

// if (result.isSuccess) {
//   final user = result.data;
//   print(user.name);
// }

// // GET list
// final result = await client.get<List<User>>(
//   '/users',
//   fromJson: (json) => (json as List)
//       .map((item) => User.fromJson(item as Map<String, dynamic>))
//       .toList(),
// );

// // POST request
// final result = await client.post<User>(
//   '/users',
//   fromJson: User.fromJson,
//   data: {
//     'name': 'John',
//     'email': 'john@example.com',
//   },
// );
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

  /// Generic GET request
  Future<ApiResult<T>> get<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      // Handle both single object and list responses
      if (response.data is List) {
        final List<dynamic> jsonList = response.data;
        final List<T> items =
            jsonList.map((json) => fromJson(json as Map<String, dynamic>)).toList();
        return ApiResult.success(items as T);
      } else {
        final json = response.data as Map<String, dynamic>;
        return ApiResult.success(fromJson(json));
      }
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      logger.e('Error parsing response: $e');
      return ApiResult.failure('Lỗi xử lý dữ liệu: $e');
    }
  }

  /// Generic POST request
  Future<ApiResult<T>> post<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      final json = response.data as Map<String, dynamic>;
      return ApiResult.success(fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      logger.e('Error parsing response: $e');
      return ApiResult.failure('Lỗi xử lý dữ liệu: $e');
    }
  }

  /// Generic PUT request
  Future<ApiResult<T>> put<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      final json = response.data as Map<String, dynamic>;
      return ApiResult.success(fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      logger.e('Error parsing response: $e');
      return ApiResult.failure('Lỗi xử lý dữ liệu: $e');
    }
  }

  /// Generic DELETE request
  Future<ApiResult<T>> delete<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      final json = response.data as Map<String, dynamic>;
      return ApiResult.success(fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      logger.e('Error parsing response: $e');
      return ApiResult.failure('Lỗi xử lý dữ liệu: $e');
    }
  }

  /// Handle DioException and return appropriate error message
  ApiResult<T> _handleError<T>(DioException error) {
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

  /// Upload files with progress tracking
  Future<ApiResult<T>> uploadFiles<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
    required List<MapEntry<String, MultipartFile>> files,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
  }) async {
    try {
      // Create FormData
      final form = FormData();

      // Add files
      for (final file in files) {
        form.files.add(file);
      }

      // Add other form data
      if (formData != null) {
        formData.forEach((key, value) {
          form.fields.add(MapEntry(key, value.toString()));
        });
      }

      // Set content type for multipart
      options ??= Options();
      options.contentType = 'multipart/form-data';

      final response = await dio.post(
        path,
        data: form,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );

      final json = response.data as Map<String, dynamic>;
      return ApiResult.success(fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      logger.e('Error uploading files: $e');
      return ApiResult.failure('Lỗi upload files: $e');
    }
  }

  /// Upload single file with progress tracking
  Future<ApiResult<T>> uploadFile<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
    required String filePath,
    String? fileName,
    String? fileKey,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
  }) async {
    try {
      // Create FormData
      final form = FormData();

      // Add file
      final file = await MultipartFile.fromFile(
        filePath,
        filename: fileName,
      );
      form.files.add(MapEntry(fileKey ?? 'file', file));

      // Add other form data
      if (formData != null) {
        formData.forEach((key, value) {
          form.fields.add(MapEntry(key, value.toString()));
        });
      }

      // Set content type for multipart
      options ??= Options();
      options.contentType = 'multipart/form-data';

      final response = await dio.post(
        path,
        data: form,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );

      final json = response.data as Map<String, dynamic>;
      return ApiResult.success(fromJson(json));
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      logger.e('Error uploading file: $e');
      return ApiResult.failure('Lỗi upload file: $e');
    }
  }
}
