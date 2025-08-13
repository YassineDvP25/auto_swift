import 'package:auto_swift/core/api/api_consumer.dart';
import 'package:auto_swift/core/api/api_end_points.dart';
import 'package:auto_swift/core/errors/exeptions.dart';
import 'package:auto_swift/features/home/models/car_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  final ApiConsumer api;

  List<String> brands = ['BMW', 'MERCEDESE', 'RANGE ROBER', 'AUDI'];
  List cars = [];

  getCars() async {
    try {
      emit(GetCarLoading());
      final response = await api.get(ApiEndPoints.getCar, {});
      cars.add(response['data']);

      emit(GetCarSuccess());
    } on ServerExeption catch (e) {
      emit(GetCarFailure(e.errorResponse.toString()));
    }
  }
}
