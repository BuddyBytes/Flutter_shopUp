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

  // static Future saveCollectionOfSharedPreferences({
  //   required String key,
  //   required List<String> values,
  // }) async {
  //   await sharedInstance.setStringList(
  //     key,
  //     values,
  //   );
  // }

  static dynamic getSharedData({
    required String key,
  }) {
    return sharedInstance.get(key);
  }

  static dynamic getSharedDataCollection({
    required String key,
  }) {
    return sharedInstance.getStringList(key);
  }

  static Future clearKey({
    required String key,
  }) async {
    return await sharedInstance.remove(key);
  }

  static Future storeMultiplePreferences({
    required dynamic email,
    required dynamic name,
    required dynamic phone,
    required dynamic token,
  }) async {
    await sharedInstance.setString("email", email);
    await sharedInstance.setString("name", name);
    await sharedInstance.setString("phone", phone);
    await sharedInstance.setString("token", token);
  }
}
