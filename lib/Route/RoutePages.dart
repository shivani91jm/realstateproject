import 'package:flutter/material.dart';
import 'package:realstateproject/Activity/DashBoardPage.dart';
import 'package:realstateproject/Activity/LoginPage.dart';
import 'package:realstateproject/Activity/SignUpPage.dart';
import 'package:realstateproject/Activity/SplashScreenPage.dart';
import 'package:realstateproject/Route/RouteNames.dart';

class RoutePages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash_screen:
        return MaterialPageRoute(builder: (_) => SplashScreenPage());
      case RouteNames.login_screen:
        return MaterialPageRoute(builder: (_) => LoginPages());
      case RouteNames.registration_screen:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case RouteNames.dashboard_screen:
        return MaterialPageRoute(builder: (_) => Dashboard());

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(child: Text("No Routes Declare"),
            ),
          );
        });
    }
  }
}