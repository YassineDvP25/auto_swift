import 'package:auto_swift/core/routes/app_router.dart';
import 'package:auto_swift/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AutoApp extends StatelessWidget {
  final AppRouter approuter;
  const AutoApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),

      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        initialRoute: Routes.homeScreen,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: approuter.generateRoute,
      ),
    );
  }
}
