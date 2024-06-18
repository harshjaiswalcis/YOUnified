import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> initSharedPreferences() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future<void> setString(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  static String? getString(String key) => _sharedPreferences.getString(key);

  static Future<void> setBool(String key, bool value) async =>
      await _sharedPreferences.setBool(key, value);

  static bool? getBool(String key) => _sharedPreferences.getBool(key);

  static bool contains(String key) => _sharedPreferences.containsKey(key);

  static void delete(String key) => _sharedPreferences.remove(key);

  static void clearSharedPreferences() => _sharedPreferences.clear();
}