import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;
  const AuthFooter({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(text, style: const TextStyle(color: Colors.white70)),
        ),
      horizantalSpace(8),
        TextButton(onPressed: onTap, child: Text(actionText)),
        const Spacer(),
      ],
    );
  }
}