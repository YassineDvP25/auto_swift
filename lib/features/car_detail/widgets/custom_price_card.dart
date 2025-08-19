import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/functions/format_prices_number.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomPriceCard extends StatelessWidget {
  final String price;
  const CustomPriceCard({super.key, required this.price});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Price Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Price',
              color: Colors.white70,
              fontFamily: 'Reg',
              fontSize: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: CustomText(text: '\$${formatPrice(int.parse(price).toDouble())}', fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Checkout Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Ckeckout',
              color: Colors.white70,
              fontFamily: 'Reg',
              fontSize: 16,
            ),
    
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8).r,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30).r,
                ),
              ),
              child: CustomText(text: 'Buy Now', color: AppColors.mainBlack),
            ),
          ],
        ),
      ],
    );
  }
}
