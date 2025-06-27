// lib/core/network/course_service.dart
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../core/di/service_locator.dart';

class CourseService {
  // final Dio _dio = sl<DioClient>().dio;

  /// Tìm khóa học theo tên
  // Future<Either<String, List<CourseSuggestion>>> searchCourses(String query,
  //     {CancelToken? cancelToken}) async {
  //   try {
  //     final res = await _dio.get(
  //       '/courses',
  //       queryParameters: {'search': query, 'limit': 10},
  //       cancelToken: cancelToken,
  //     );
  //     if (res.statusCode == 200) {
  //       final list = (res.data['data']['data'] as List)
  //           .map((j) => CourseSuggestion.fromJson(j))
  //           .toList();
  //       return Right(list);
  //     }
  //     return Left('Server lỗi ${res.statusCode}');
  //   } on DioException catch (e) {
  //     return Left('Lỗi kết nối: ${e.message}');
  //   } catch (e) {
  //     return Left('Lỗi: $e');
  //   }
  // }
}

/// Model gợi ý khóa học
class CourseSuggestion {
  final String id;
  final String name;
  CourseSuggestion({required this.id, required this.name});

  factory CourseSuggestion.fromJson(Map<String, dynamic> j) => CourseSuggestion(
        id: j['id'] as String,
        name: j['title'] as String, // hoặc key nào chứa tên
      );
}
