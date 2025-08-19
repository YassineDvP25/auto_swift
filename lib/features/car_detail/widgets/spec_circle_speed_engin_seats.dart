import 'package:auto_swift/core/components/text.dart' show CustomText;
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecCircleSpeedEnginSeats extends StatelessWidget {
  final String carSpeed;
  final String carEngin;
  final String carSeats;
  const SpecCircleSpeedEnginSeats({super.key, required this.carSpeed, required this.carEngin, required this.carSeats});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SpecItem(
          value: "$carSpeed KM/H",
          label: "Max speed",
          icon: Icons.speed,
        ),
        SpecItem(
          value: carEngin,
          label: "Max speed",
          icon: Icons.speed,
        ),
        SpecItem(
          value: "$carSeats Seats",
          label: "Max speed",
          icon: Icons.speed,
        ),
      ],
    );
  }
}

class SpecItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  const SpecItem({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.grayScaleHoder,
          radius: 21.r,
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.mainDarkGrey,
            child: Icon(icon, color: Colors.white, size: 30.sp),
          ),
        ),
        verticalSpace(10),
        CustomText(text: label, fontSize: 12, color: AppColors.grayScaleHoder),
        CustomText(text: value, fontFamily: 'Reg', fontSize: 14),
      ],
    );
  }
}
