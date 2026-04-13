import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // We use 'static' so we don't have to create a new instance of this class everywhere.
  // We use 'late' because it won't have a value until the app actually starts.
  static late SharedPreferences prefs;

  // 1. Open the hard drive (Run this ONCE in main.dart)
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // 2. Save a boolean value (Like saving "hasCompletedOnboarding = true")
  static Future<bool> saveBool({
    required String key,
    required bool value,
  }) async {
    return await prefs.setBool(key, value);
  }

  // 3. Read a boolean value
  static bool? getBool({required String key}) {
    return prefs.getBool(key);
  }
}
