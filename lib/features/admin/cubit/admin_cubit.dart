import 'package:auto_swift/core/api/api_consumer.dart';
import 'package:auto_swift/core/api/api_end_points.dart';
import 'package:auto_swift/core/errors/exeptions.dart';
import 'package:auto_swift/core/functions/upload_profile_picture.dart';
import 'package:auto_swift/core/theming/colors/app_colors.dart';
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
  String selectedItem = '';
  Color circleAvatarColor = AppColors.pink;
  XFile? carImage;
  String? carBrand;
  void onChanged(String value) {
    selectedItem = value;
    emit(SelectedItemChanged(value));
  }

  uploadImage(XFile image) {
    carImage = image;
    circleAvatarColor = AppColors.green;
    emit(UploadCarImage());
  }

  uploadCar() async {
    try {
      emit(UploadCarLoading());
      final image = await uploadImageToAPI(carImage!);

      api.post(ApiEndPoints.addCar, {
        ApiKeys.carEngin: carEngin.text,
        ApiKeys.carSpeed: carSpeed.text,
        ApiKeys.carSeats: carSeats.text,
        ApiKeys.carModel: carModel.text,
        ApiKeys.carBrand: selectedItem,
        ApiKeys.carPrice: carPrice.text,
        ApiKeys.carImage: image,
      }, isFormData: true);
      emit(UploadCarSuccess());
    } on ServerExeption catch (e) {
      emit(UploadCarFailure(e.errorResponse.toString()));
    }
  }
}
