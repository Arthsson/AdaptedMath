import 'package:adapted_math/src/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashController {
  void redirectToHomePage(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
    });
  }
}
