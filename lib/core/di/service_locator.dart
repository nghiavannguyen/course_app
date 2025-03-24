import 'package:course_app/core/storage/app_hive.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // Khởi tạo và đăng ký dịch vụ
  final hiveService = AppHive();
  await hiveService.init();
  sl.registerSingleton<AppHive>(hiveService);

  sl.registerLazySingleton<DioClient>(() => DioClient());
}
