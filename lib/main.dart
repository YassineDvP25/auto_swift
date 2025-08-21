import 'package:auto_swift/auto_app.dart';
import 'package:auto_swift/cache/cache_helper.dart';
import 'package:auto_swift/core/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  CacheHelper().init();
  runApp(AutoApp(approuter: AppRouter()));
}























