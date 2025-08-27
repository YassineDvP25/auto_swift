import 'dart:convert';

import 'package:auto_swift/core/api/api_consumer.dart';
import 'package:auto_swift/core/errors/exeptions.dart';
import 'package:auto_swift/features/auth/cubit/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  // uploadProfilePic(XFile image) {
  //   profilePic = image;
  //   emit(UploadProfilePicture());
  // }

  signIn() async {
    try {
      emit(SignInLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInEmail.text.trim(),
        password: signInPassword.text.trim(),
      );

      // var user = SignInModel.fromJson(json.decode(response));
      // CacheHelper().saveData(key: ApiKeys.id, value: user.data!.first.userId);

      emit(SignInSuccess());
    } on ServerExeption catch (e) {
      print('============ Error $e ==========');
      emit(SignInFailure(e.errorResponse.errorMessage));
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEmail.text.trim(),
        password: signUpPassword.text.trim(),
      );

      emit(SignUpSuccess());
    } on ServerExeption catch (e) {
      print('============ Error $e ==========');

      emit(SignUpFailure(e.errorResponse.errorMessage));
    }
  }
}
