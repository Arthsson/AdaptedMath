import 'package:adapted_math/src/screens/auth/home/home_page.dart';
import 'package:adapted_math/src/screens/auth/splash/splash_page.dart';
import 'package:adapted_math/src/screens/config/config_page.dart';
import 'package:adapted_math/src/shared/routes/app_routes.dart';
import 'package:adapted_math/src/shared/themes/app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Educação Inclusiva',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.defaultTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: {
        AppRoutes.initialRoute: (context) => const SplashScreen(),
        AppRoutes.homeRoute: (context) => const HomePage2(),
        AppRoutes.configRoute: (context) => const ConfigPage(),
      },
    );
  }
}
