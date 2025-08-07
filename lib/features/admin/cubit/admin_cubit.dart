import 'package:auto_swift/core/api/api_consumer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this.api) : super(AdminInitial());

  final ApiConsumer api;

  TextEditingController carModel = TextEditingController();
  TextEditingController carEngin = TextEditingController();
  TextEditingController carSpeed = TextEditingController();
  TextEditingController carSeats = TextEditingController();
  TextEditingController carPrice = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  List<String> brands = ['Audi', 'Mersedise', 'Bmw', 'Range Rover'];
  List<String> availableColor = ['Black', 'White', 'Blue', 'Brown'];
   String? selectedItem ;
  XFile? carImage;
  onChanged(value) {
    emit(selectedItem = value);
  }

  uploadCar() async{
    // final response = await api.post(path, data)
  }
}
