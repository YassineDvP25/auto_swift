import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 19.r,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            
            radius: 18.r,
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/1200x/7d/47/d1/7d47d1d2455f248981f41feb424d3867.jpg',
            ),
          ),
        ),
        CustomText(text: 'Boston , New York', color: AppColors.mainWhite),
        Icon(
          CupertinoIcons.circle_grid_3x3,
          size: 25.sp,
          color: AppColors.mainWhite,
        ),
      ],
    );
  }
}
