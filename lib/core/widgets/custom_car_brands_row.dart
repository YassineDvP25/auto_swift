import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:auto_swift/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarBrandsRow extends StatelessWidget {
  const CustomCarBrandsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        int brandSelected = context.read<HomeCubit>().brandSelected;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().getCars();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5).r,
                  decoration: BoxDecoration(
                    color:
                        brandSelected == 0
                            ? Colors.amber
                            : AppColors.mainDarkGrey,

                    border: Border.all(width: 1.w, color: AppColors.mainGrey),
                    borderRadius: BorderRadius.circular(15).r,
                  ),
                  child: CustomText(
                    text: "All",
                    color:
                        brandSelected == 0
                            ? AppColors.mainBlack
                            : AppColors.mainWhite,
                  ),
                ),
              ),
              horizantalSpace(3),

              ...List.generate(context.read<HomeCubit>().brands.length, (
                index,
              ) {
                return GestureDetector(
                  onTap: () {
                    context.read<HomeCubit>().filterCars(index + 1);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4).r,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5).r,
                    decoration: BoxDecoration(
                      color:
                          brandSelected == index + 1
                              ? Colors.amber
                              : AppColors.mainDarkGrey,

                      border: Border.all(width: 1.w, color: AppColors.mainGrey),
                      borderRadius: BorderRadius.circular(15).r,
                    ),
                    child: CustomText(
                      text: context.read<HomeCubit>().brands[index],
                      color:
                          brandSelected == index + 1
                              ? AppColors.mainBlack
                              : AppColors.mainWhite,
                      fontFamily: 'Reg',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
