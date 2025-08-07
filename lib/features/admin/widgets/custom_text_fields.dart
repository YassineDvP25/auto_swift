import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/widgets/app_text_form_field.dart';
import 'package:auto_swift/features/admin/cubit/admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFields extends StatelessWidget {
const CustomTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    contoller: context.read<AdminCubit>().carEngin,
                    hintText: 'Car Engin',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 9, horizontal: 10).r,
                  ),
                ),
                horizantalSpace(10),
                Expanded(
                  child: AppTextFormField(
                    contoller: context.read<AdminCubit>().carSpeed,
                    hintText: 'Car Speed',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 9, horizontal: 10).r,
                  ),
                ),
                horizantalSpace(10),

                Expanded(
                  child: AppTextFormField(
                    contoller: context.read<AdminCubit>().carSeats,
                    hintText: 'Seats Number',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 9, horizontal: 10).r,
                  ),
                ),
              ],
            ),
            verticalSpace(15),
            AppTextFormField(
              contoller: context.read<AdminCubit>().carModel,
              hintText: 'Car Model',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 9, horizontal: 10).r,
            ),
            verticalSpace(15),

            AppTextFormField(
              contoller: context.read<AdminCubit>().carModel,
              hintText: 'Car Price',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 9, horizontal: 10).r,
            ),
          ],
        );
      },
    );
  }
}
