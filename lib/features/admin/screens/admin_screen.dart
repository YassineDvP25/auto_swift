import 'package:auto_swift/core/components/text.dart';
import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/helpers/textstyles.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
import 'package:auto_swift/core/widgets/custom_app_text_Button.dart';
import 'package:auto_swift/features/admin/cubit/admin_cubit.dart';
import 'package:auto_swift/features/admin/widgets/custom_circle_avatar_and_upload_image_car.dart';
import 'package:auto_swift/features/admin/widgets/custom_drop_down.dart';
import 'package:auto_swift/features/admin/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainGrey,

        body: BlocBuilder<AdminCubit, AdminState>(
          builder: (context, state) {
            return Column(
              children: [
                //? Admin Page Text
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20).r,
                  child: Center(
                    child: CustomText(
                      text: 'Admin Page',
                      color: AppColors.mainBlack,
                      fontSize: 25,
                    ),
                  ),
                ),

                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15).r,
                  child: Column(
                    children: [
                      //? Circle Avatar And Upload Image Car Row
                      CustomCircleAvatarAndUploadImageCar(),
                      verticalSpace(10),
                      Form(
                        key: context.read<AdminCubit>().globalKey,
                        //? Text Form Fields Car Information
                        child: CustomTextFields(),
                      ),

                      verticalSpace(20),

                      //? Custom Drop Down Widget
                      CustomDropdown(
                        valid: context.read<AdminCubit>().selectedItem,
                        hint: 'Choose Car Brand',
                        items:
                            context
                                .read<AdminCubit>()
                                .brands
                                .map(
                                  (brand) => DropdownMenuItem(
                                    value: brand,

                                    child: Text(brand),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          context.read<AdminCubit>().onChanged(value);
                        },
                      ),
                      verticalSpace(20),
                      //? Add Car Custom Button
                      CustomButton(
                        radius: 10,
                        width: double.infinity,
                        // borderRadius: BorderRadius.circular(10).r,
                        height: 50,
                        color: AppColors.mainBlack,
                        child: Center(
                          child: Text(
                            'Add Car',
                            style: TextStyles.whiteFont13TenorSans,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
