import 'package:auto_swift/core/helpers/textstyles.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 awesomDialogWidget(BuildContext context,String  title  , String desc ,DialogType  dialogType){
  return   AwesomeDialog(
    width: 300.w,
                context: context,
                dialogType: dialogType,
                animType: AnimType.rightSlide,

                title: title,
                desc: desc,
                titleTextStyle: TextStyles.blackFont16RobotoSlab,
                descTextStyle: TextStyles.greyFont10RobotoSlab,
              ).show();
}