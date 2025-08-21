import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});
  @override
  Widget build(BuildContext context) {
    Widget btn(IconData icon, String label, VoidCallback onTap) => Expanded(
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white)),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF2A2A2E)),
          minimumSize:  Size.fromHeight(48.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14).r,
          ),
        ),
      ),
    );

    return Row(
      children: [
        btn(Icons.g_mobiledata, 'Google', () {}),
        const SizedBox(width: 12),
        btn(Icons.apple, 'Apple', () {}),
      ],
    );
  }
}
