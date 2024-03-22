import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/LoginPage.dart';
import 'package:realstateproject/Activity/SignUpPage.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';

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
        ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: GradientHelper.getColorFromHex(ColorClass.RED_COLOR)),
          useMaterial3: true,
        ),
        home: LoginPages(),
      ),
    );
  }
}


