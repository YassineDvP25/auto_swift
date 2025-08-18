import 'package:auto_swift/features/home/cubit/home_cubit.dart';
import 'package:auto_swift/features/home/models/car_model.dart';
import 'package:auto_swift/features/home/widgets/custom_car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCarsGridView extends StatelessWidget {
  const CustomCarsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 0 ,horizontal: 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 14.0,
            mainAxisSpacing: 14,
          ),
          itemCount: context.read<HomeCubit>().cars.length,
          itemBuilder: (context, index) {
            var car = CarModel.fromJson(context.read<HomeCubit>().cars[index]);
            return CarCard(
              imageUrl: car.carImage!,
              carBrand: car.carBrand!,
              seats: int.parse(car.carSeats!),
              pricePerDay: int.parse(car.carPrice!).toDouble(),
            );
          },
        );
      },
    );
  }
}
