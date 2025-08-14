import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatarAndUploadImageCar extends StatelessWidget {
  final void Function()? onPressed;
  final Color circleColor;
  const CustomCircleAvatarAndUploadImageCar({super.key, this.onPressed, required this.circleColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(backgroundColor: circleColor),

        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.file_upload_outlined, size: 30.sp),
        ),
      ],
    );
  }
}
