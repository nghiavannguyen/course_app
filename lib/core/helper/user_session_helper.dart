import '../di/service_locator.dart';
import '../storage/app_hive.dart';

class UserSessionHelper {
  static String get userId => sl<AppHive>().getData('user_id');
  static String get accessToken => sl<AppHive>().getData('access_token');
}
