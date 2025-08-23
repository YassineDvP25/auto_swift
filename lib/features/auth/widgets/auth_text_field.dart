import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final TextDirection textDirection;
  final TextInputAction? textInputAction;
  final Widget? suffxIcon;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.textDirection = TextDirection.rtl,
    this.textInputAction, this.suffxIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          label: CustomText(
            text: label,
            fontSize: 14,
            fontFamily: 'reg',
            color: AppColors.grayScaleHoder,
          ),
          suffixIcon: suffxIcon,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayScaleHoder),
            borderRadius: BorderRadius.circular(15).r,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
