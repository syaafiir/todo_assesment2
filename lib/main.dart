import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/add_task_page.dart';
import 'services/prefs_service.dart';
import 'providers/todo_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isDark = await PrefsService.getTheme();
  final isLogin = await PrefsService.getLogin();

  runApp(MyApp(isDark: isDark, isLogin: isLogin));
}

class MyApp extends StatefulWidget {
  final bool isDark;
  final bool isLogin;

  const MyApp({super.key, required this.isDark, required this.isLogin});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _dark;

  @override
  void initState() {
    super.initState();
    _dark = widget.isDark;
  }

  void changeTheme(bool value) {
    setState(() => _dark = value);
    PrefsService.setTheme(value);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoProvider())],
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: _dark ? ThemeMode.dark : ThemeMode.light,
        routes: {
          '/': (_) => widget.isLogin ? const HomePage() : const LoginPage(),
          '/home': (_) => const HomePage(),

          '/add': (_) => const AddTaskPage(),
        },
      ),
    );
  }
}
