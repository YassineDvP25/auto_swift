import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const BrandHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // verticalSpace(16),
        SizedBox(width: double.infinity,),
      
        // verticalSpace(24),
      CustomText(text: title , fontSize: 28, fontWeight: FontWeight.w800),
        verticalSpace(8),
        Text(
          subtitle,
          textAlign: TextAlign.right,
          style:  TextStyle(color: Colors.white70, fontSize: 12.sp),
        ),
        verticalSpace(24),
      ],
    );
  }
}
