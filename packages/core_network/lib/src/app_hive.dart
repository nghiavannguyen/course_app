import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppHive {
  static const String boxAppKey = 'app';
  Future<void> init() async {
    final appPath = await getApplicationDocumentsDirectory();

    Hive.init(appPath.path);
    await Hive.openBox(boxAppKey);
  }

  static get boxApp => Hive.box(boxAppKey);

  Future<void> saveData(String key, dynamic value) async {
    await boxApp.put(key, value);
  }

  dynamic getData(String key) {
    return boxApp.get(key);
  }

  Future<void> deleteData(String key) async {
    await boxApp.delete(key);
  }
}
