import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static final blackFont23RobotoSlab = TextStyle(
    letterSpacing: 2.w,
    color: Colors.black,
    fontSize: 23.0.sp,
    fontFamily: 'RobotoSlab',
  );
  static final greyFont23RobotoSlab = TextStyle(
    letterSpacing: 2.w,
    color: AppColors.mainLightGrey,
    fontSize: 23.0.sp,
    fontFamily: 'RobotoSlab',
  );
  static final blackFont16RobotoSlab = TextStyle(
    color: Colors.black,
    fontSize: 16.0.sp,
    fontFamily: 'RobotoSlab',
  );
  static final whiteFont13RobotoSlab = TextStyle(
    letterSpacing: 1.5.w,
    color: Colors.white,
    fontSize: 13.0.sp,
    fontFamily: 'RobotoSlab',
  );
  static final whiteFont10RobotoSlab = TextStyle(
    letterSpacing: 1.5.w,
    color: Colors.white,
    fontSize: 10.0.sp,
    fontFamily: 'RobotoSlab',
  );
  static final greyFont10RobotoSlab = TextStyle(
    letterSpacing: 1.5.w,
    color: AppColors.grayScaleLabel,
    fontSize: 10.0.sp,
    // fontFamily: 'RobotoSlab',
  );
}
