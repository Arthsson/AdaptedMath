import 'package:adapted_math/src/screens/auth/base_auth_page.dart';
import 'package:adapted_math/src/screens/auth/splash/controller/splash_control.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController _splashController = SplashController();

  @override
  void initState() {
    super.initState();
    _redirectToHomePage();
  }

  void _redirectToHomePage() {
    _splashController.redirectToHomePage(context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_app.png',
              height: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              'Educação Inclusiva',
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}