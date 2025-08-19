import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarTitleAndRating extends StatelessWidget {
  final String carModel;
  final String carBrand;
  const CustomCarTitleAndRating({
    super.key,
    required this.carModel,
    required this.carBrand,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25).r,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: carModel, fontSize: 22),

              verticalSpace(4),
              CustomText(text: carBrand, fontFamily: 'Reg'),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5).r,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 18.sp),
                SizedBox(width: 4),
                CustomText(text: '4.3', color: Colors.yellow, fontSize: 13),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
