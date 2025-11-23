import 'package:flutter/material.dart';
import '../services/prefs_service.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    bool isDark = await PrefsService.getTheme();
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeData get lightTheme =>
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue);

  ThemeData get darkTheme =>
      ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue);
}
