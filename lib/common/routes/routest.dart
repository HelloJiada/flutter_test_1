// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jadeapp/feature/auth/pages/login_page.dart';
import 'package:jadeapp/feature/auth/pages/user_info_page.dart';
import 'package:jadeapp/feature/auth/pages/verifcation_page.dart';
import 'package:jadeapp/feature/contact/pages/contact_page.dart';
import 'package:jadeapp/feature/welcome/pages/welcome_page.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'user-info';
  static const String contact = 'contact';

  static Route<dynamic> onGrenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (context) => const welcomePage());
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => VerifcationPage(
                  phoneNumber: args['phoneNumber'],
                  verifcationId: args['verifcationId'],
                ));
      case userInfo:
        return MaterialPageRoute(builder: (context) => const UserInfoPage());
      case contact:
        return MaterialPageRoute(builder: (context) => const ContactPage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(
                'NO Page Route Provided',
              ),
            ),
          ),
        );
    }
  }
}
