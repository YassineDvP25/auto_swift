import 'package:flutter/material.dart';

class AuthBackgroundScaffold extends StatelessWidget {
  final Widget child;
  const AuthBackgroundScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية السيارة
          Positioned.fill(
            child: Image.asset(
              'assets/images/BMW M4.jpeg', // ضع صورتك هنا
              fit: BoxFit.fitHeight,
            ),
          ),
          // طبقة داكنة شفافة
          Container(
            color: Colors.black.withValues(   alpha:  0.55),
          ),
          // محتوى الصفحة
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}
