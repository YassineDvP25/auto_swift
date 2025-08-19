import 'package:auto_swift/core/api/api_end_points.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:auto_swift/features/car_detail/widgets/custom_car_title_and_rating.dart';
import 'package:auto_swift/features/car_detail/widgets/custom_price_card.dart';
import 'package:auto_swift/features/car_detail/widgets/custom_top_bar.dart';
import 'package:auto_swift/features/car_detail/widgets/spec_circle_speed_engin_seats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  final Map data;
  const DetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 33, 32, 32), AppColors.mainBlack],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --------- AppBar ---------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
                child: CustomTopBar(),
              ),

              // --------- Car Image ---------
              Expanded(
                child: Column(
                  children: [
                    verticalSpace(20),
                    SizedBox(
                      child: Image.network(
                        "${ApiEndPoints.baseUrl}upload/car_image/${data['carImage']}",
                        height: 170.h,
                      ),
                    ),

                    verticalSpace(20),

                    // Car Title + Rating
                    CustomCarTitleAndRating(
                      carModel: data['carModel'],
                      carBrand: data['carBrand'],
                    ),

                    verticalSpace(50),

                    // Specs
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SpecCircleSpeedEnginSeats(
                        carSpeed: data['carSpeed'],
                        carEngin: data['carEngin'],
                        carSeats: data['carSeats'],
                      ),
                    ),
                  ],
                ),
              ),

              // --------- Bottom Checkout ---------
              Container(
                padding: const EdgeInsets.all(16).r,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10).r,

                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 41, 40, 40),
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: CustomPriceCard(price: data['carPrice']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
