import 'package:auto_swift/core/api/api_end_points.dart';
import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarCard extends StatelessWidget {
  final String imageUrl;
  final String carBrand;
  final int seats;
  final double pricePerDay;
  final void Function()? onTap;

  const CarCard({
    super.key,
    required this.imageUrl,
    required this.carBrand,
    required this.seats,
    required this.pricePerDay, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180.w,
        // height: 200.h,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,

          gradient: LinearGradient(
            begin: Alignment.topCenter, // يبدأ من الأعلى
            end: Alignment.bottomCenter, // ينتهي بالأسفل
            colors: [
              Color.fromARGB(255, 70, 69, 69), // لون رمادي فاتح (أعلى)
              Color(0xFF0D0D0D), // لون داكن (أسفل)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12).r,
                child: Image.network(
                  "${ApiEndPoints.baseUrl}upload/car_image/$imageUrl",
                  height: 90.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpace(3),
            CustomText(
              text: carBrand,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.mainWhite,
              fontFamily: 'Oswald',
              letterSpace: 1,
            ),
            verticalSpace(4),
            Row(
              children: [
                const Icon(Icons.event_seat, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "$seats Seat",
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
            verticalSpace(4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "\$$pricePerDay/D", fontSize: 13),

                Container(
                  padding: const EdgeInsets.all(4).r,
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.amber,
                    size: 18.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
