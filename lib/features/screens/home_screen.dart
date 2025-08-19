import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:auto_swift/core/widgets/custom_car_brands_row.dart';
import 'package:auto_swift/features/home/cubit/home_cubit.dart';
import 'package:auto_swift/features/home/widgets/custom_cars_grid_view.dart';
import 'package:auto_swift/features/home/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [
              Color.fromARGB(255, 28, 28, 28), 
              AppColors.mainBlack, 
            ],
          ),
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 60,left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTopBar(),
                  verticalSpace(20),
                  Row(
                    children: [
                      CustomText(
                        text: 'Hello,',
                        fontSize: 20,
                        color:  Color.fromRGBO(198, 192, 192, 1),
                      ),
                      horizantalSpace(5),
                      CustomText(
                        text: 'Yassine',
                        fontSize: 25,
                        color: AppColors.mainWhite,
                      ),
                    ],
                  ),

                  verticalSpace(2),

                  CustomText(
                    text: 'Choose your Ideal Car',
                    fontFamily: 'Regular',
                    color: AppColors.mainWhite,
                    fontSize: 15,
                  ),
                  verticalSpace(40),

                  CustomCarBrandsRow(),

                  verticalSpace(30),
                  state is GetCarLoading
                      ? Center(child: CircularProgressIndicator())
                      : state is GetCarSuccess
                      ? Expanded(child: CustomCarsGridView())
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
      ),
    );
  }
}
