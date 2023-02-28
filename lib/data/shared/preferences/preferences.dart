// ignore_for_file: depend_on_referenced_packages

import 'package:shared_preferences/shared_preferences.dart';

class CachedPreference {
  static late SharedPreferences sharedInstance;

  static Future<void> cachePreferenceInitial() async {
    sharedInstance = await SharedPreferences.getInstance();
  }

  static Future savePreferenceData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await sharedInstance.setString(key, value);
    } else if (value is bool) {
      await sharedInstance.setBool(key, value);
    } else if (value is int) {
      await sharedInstance.setInt(key, value);
    } else if (value is double) {
      await sharedInstance.setDouble(key, value);
    }
  }

  static dynamic getSharedData({
    required String key,
  }) {
    return sharedInstance.get(key);
  }

  static Future clearKey({
    required String key,
  }) async {
    return await sharedInstance.remove(key);
  }
}
