import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;
  final TextInputAction? textInputAction;

  const PasswordField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.textInputAction,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscure,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayScaleHoder),
            borderRadius: BorderRadius.circular(15).r

          ),
          label: CustomText(
            text: widget.label,
            fontSize: 14,
            fontFamily: 'reg',
            color: AppColors.grayScaleHoder,
          ),
          suffixIcon: IconButton(
            onPressed: () => setState(() => _obscure = !_obscure),
            icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off ,size: 16.sp,),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}