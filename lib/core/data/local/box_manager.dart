import 'package:hive/hive.dart';

class BoxManager {
  static BoxManager? _instance;
  static BoxManager get instance {
    _instance ??= BoxManager._init();
    return _instance!;
  }

  BoxManager._init();

  Future<Box<T>> openBox<T>(String name) async {
    return await Hive.openBox<T>(name);
  }

  Future<void> closeBox(Box box) async {
    await box.close();
  }

  Future<void> deleteBox(String name) async {
    await Hive.deleteBoxFromDisk(name);
  }
}
