import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uni_bike/app/utils/app_constants.dart';

import '../../../core/app_router.dart';
import '../../../core/string_const.dart';
import '../../../utils/extensions.dart';
import '../../bottom_nav/view/bottom_nav_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final userId = await StringConst.getUserID();

    log("userId :: $userId");

    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        if (userId.isNotEmpty) {
          Routes.pushRemoveUntil(screen: UniBikeBottomNav());
        } else {
          // Routes.pushRemoveUntil(screen: const OnboardingScreen());
          Routes.pushRemoveUntil(screen: const LoginScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      body: Center(
        child: SizedBox(
          height: Responsive.height * 10,
          width: Responsive.width * 60,
          child: Image.asset(
            "assets/images/logoGif.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
