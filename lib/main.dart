// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jadeapp/common/routes/routest.dart';
import 'package:jadeapp/common/theme/dark_theme.dart';
import 'package:jadeapp/common/theme/light_theme.dart';
import 'package:jadeapp/feature/auth/pages/login_page.dart';
import 'package:jadeapp/feature/contact/pages/contact_page.dart';
import 'package:jadeapp/feature/home/pages/home_pages.dart';
import 'package:jadeapp/feature/welcome/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/auth/pages/user_info_page.dart';
import 'feature/auth/pages/verifcation_page.dart';
import 'feature/home/pages/home_pages.dart';

// import 'package:firebase_core/firebase_core.dart';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

_incrementCounter1() {
  var s = get();
  s.then((value) {
    if (value == null) {
      return const welcomePage();
    } else {
      return const HomePage();
    }
  });
}

//读取数据
Future<String?> get() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userName = await prefs.getString("counter"); //读取counter的值
  return userName; //返回
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JadeApp',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: welcomePage(),
      onGenerateRoute: Routes.onGrenerateRoute,
    );
  }
}
