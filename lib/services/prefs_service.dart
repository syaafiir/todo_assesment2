import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static Future setLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_login', value);
  }

  static Future<bool> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_login') ?? false;
  }

  static Future setTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_dark', value);
  }

  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_dark') ?? false;
  }

  static Future setLastInput(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_input', value);
  }

  static Future<String?> getLastInput() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('last_input');
  }
}
