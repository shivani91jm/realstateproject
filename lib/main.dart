import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/DashBoardPage.dart';
import 'package:realstateproject/Activity/IntroductionScreen.dart';
import 'package:realstateproject/Activity/SplashScreenPage.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/MutipleProvidersss/BottomNavigationBarProvider.dart';
import 'package:realstateproject/MutipleProvidersss/LoginProvider.dart';
import 'package:realstateproject/MutipleProvidersss/RegistrationProvider.dart';

void main() {
  runApp(const MyApp());
 //  DevicePreview(
 //    builder: (context) => const MyApp(),
 //  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<RegistrationProvider>(create: (_) => RegistrationProvider()),
          ChangeNotifierProvider<LoginProvider>(create:(_)=> LoginProvider()),
          ChangeNotifierProvider<BottomNavigationBarProvider>(create:(_)=> BottomNavigationBarProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
          useMaterial3: true,
        ),
        home: Dashboard(),
      ),
    );
  }
}


