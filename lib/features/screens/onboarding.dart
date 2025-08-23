import 'dart:async';
import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:auto_swift/features/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // الانتقال بعد 3 ثواني
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const SignInPage(),
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/تنزيل (21).jpeg', fit: BoxFit.cover),

          Container(color: Colors.black.withValues(alpha: 0.6)),

          FadeTransition(
            opacity: _fade,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: "Luxury Car Store",
                    color: AppColors.mainWhite,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpace: 1.2,
                  ),
                  verticalSpace(8),
                  CustomText(
                    text: "Drive your dream today",
                    color: AppColors.grayScaleHoder,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
