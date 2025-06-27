import 'package:core_network/core_network.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // Khởi tạo và đăng ký dịch vụ
  final hiveService = AppHive();
  await hiveService.init();
  sl.registerSingleton<AppHive>(hiveService);

  sl.registerSingleton<DioClient>(DioClient());
}
