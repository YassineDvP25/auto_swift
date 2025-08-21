import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});
  @override
  Widget build(BuildContext context) {
    Widget line = const Expanded(
      child: Divider(color: Color(0xFF2A2A2E), thickness: 1),
    );
    return Row(
      children: [
        line,
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 12).r,
          child: Text('Or', style: TextStyle(color: Colors.white60)),
        ),
        line,
      ],
    );
  }
}