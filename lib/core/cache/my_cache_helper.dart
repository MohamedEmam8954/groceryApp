import 'package:shared_preferences/shared_preferences.dart';

class MyCacheHelper {
  static late SharedPreferences sharedPreferences;
  sharePerferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<dynamic> sendData({required dynamic data, required String key}) {
    if (data is String) {
      return sharedPreferences.setString(key, data);
    } else if (data is int) {
      return sharedPreferences.setInt(key, data);
    } else if (data is bool) {
      return sharedPreferences.setBool(key, data);
    } else if (data is double) {
      return sharedPreferences.setDouble(key, data);
    } else {
      throw ArgumentError("Unsupported type for SharedPreferences");
    }
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key) ?? false;
  }

  dynamic clearData() {
    return sharedPreferences.clear();
  }

  dynamic removeData({required String key}) {
    return sharedPreferences.remove(key);
  }

  bool containKey({required String key}) {
    return sharedPreferences.containsKey(key);
  }
}
