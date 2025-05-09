import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musium/core/common/colors/app_colors.dart';
import 'package:musium/core/responsiveness/app_responsive.dart';
import 'package:musium/core/route/rout_generator.dart';

import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      AppRoute.go(OnboardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              width: appW(400),
              height: appH(400),
            ),
            SizedBox(height: appH(20)),
            const Text(
              'Musium',
              style: TextStyle(
                color: AppColors.neonGreen,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: appH(20)),
          ],
        ),
      ),
    );
  }
}
