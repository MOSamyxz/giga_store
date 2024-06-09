import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  //? Initialize the SharedPreferences
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //? Save a string value
  static Future<void> setString(String key, String value) async {
    await _sharedPreferences?.setString(key, value);
  }

  //? Get a string value
  static String? getString(String key) {
    return _sharedPreferences?.getString(key);
  }

  //? Save an integer value
  static Future<void> setInt(String key, int value) async {
    await _sharedPreferences?.setInt(key, value);
  }

  //? Get an integer value
  static int? getInt(String key) {
    return _sharedPreferences?.getInt(key);
  }

  //? Save a boolean value
  static Future<void> setBool(String key, bool value) async {
    await _sharedPreferences?.setBool(key, value);
  }

  //? Get a boolean value
  static bool? getBool(String key) {
    return _sharedPreferences?.getBool(key);
  }

  //? Remove a specific value
  static Future<void> remove(String key) async {
    await _sharedPreferences?.remove(key);
  }

  //? Clear all values
  static Future<void> clear() async {
    await _sharedPreferences?.clear();
  }
}
