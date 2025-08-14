import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:auto_swift/features/home/cubit/home_cubit.dart';
import 'package:auto_swift/features/home/models/car_model.dart';
import 'package:auto_swift/features/home/widgets/custom_car_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayScaleHoder,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/1200x/7d/47/d1/7d47d1d2455f248981f41feb424d3867.jpg',
                      ),
                    ),
                    CustomText(
                      text: 'Boston , New York',
                      color: AppColors.mainDarkGrey,
                    ),
                    Icon(CupertinoIcons.circle_grid_3x3, size: 25.sp),
                  ],
                ),
                verticalSpace(20),
                Row(
                  children: [
                    CustomText(
                      text: 'Hello,',
                      fontSize: 25,
                      color: AppColors.mainLightGrey,
                    ),
                    horizantalSpace(5),
                    CustomText(
                      text: 'Yassine',
                      fontSize: 30,
                      color: AppColors.mainBlack,
                    ),
                  ],
                ),

                verticalSpace(2),

                CustomText(
                  text: 'Choose your Ideal Car',
                  fontFamily: 'Regular',
                  color: AppColors.mainDarkGrey,
                  fontSize: 15,
                ),
                verticalSpace(30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(context.read<HomeCubit>().brands.length, (
                      index,
                    ) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10).r,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.w),
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: CustomText(
                          text: context.read<HomeCubit>().brands[index],
                          color: AppColors.mainDarkGrey,
                        ),
                      );
                    }),
                  ],
                ),

                verticalSpace(30),
                state is GetCarLoading
                    ? Center(child: CircularProgressIndicator())
                    : state is GetCarSuccess
                    ? Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 0.0,
                        ),
                        itemCount: context.read<HomeCubit>().cars.length,
                        itemBuilder: (context, index) {
                          var car = CarModel.fromJson(
                            context.read<HomeCubit>().cars[index],
                          );
                          return CarCard(
                            imageUrl: car.carImage!,
                            carBrand: car.carBrand!,
                            seats: int.parse(car.carSeats!),
                            pricePerDay: int.parse(car.carPrice!).toDouble(),
                          );
                        },
                      ),
                    )
                    : Center(
                      child: CustomText(
                        text: 'No Data',
                        color: AppColors.mainBlack,
                      ),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
