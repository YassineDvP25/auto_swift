import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatarAndUploadImageCar extends StatelessWidget {
  final void Function()? onPressed;
  const CustomCircleAvatarAndUploadImageCar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(backgroundColor: AppColors.pink),

        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.file_upload_outlined, size: 30.sp),
        ),
      ],
    );
  }
}
