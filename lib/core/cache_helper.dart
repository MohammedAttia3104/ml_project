import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveGender(String value) async {
    return await prefs.setString("Gender", value);
  }

  static String getGender() {
    return prefs.getString("Gender") ?? "";
  }

  static Future<bool> saveCreditCardType(String value) async {
    return await prefs.setString("Card-Type", value);
  }

  static String getCreditCardType() {
    return prefs.getString("Card-Type") ?? "";
  }

  static Future<bool> saveLocation(String value) async {
    return await prefs.setString("Location", value);
  }

  static String getLocation() {
    return prefs.getString("Location") ?? "";
  }

  static Future<bool> saveStatusList(List<String> list) async {
    return await prefs.setStringList("statusList", list);
  }

  static List<String> getStatusList() {
    return prefs.getStringList("statusList") ?? [];
  }
}
