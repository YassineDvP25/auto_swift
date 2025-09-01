import 'package:auto_swift/core/api/dio_consumer.dart';
import 'package:auto_swift/core/routes/routes.dart';
import 'package:auto_swift/features/admin/cubit/admin_cubit.dart';
import 'package:auto_swift/features/auth/cubit/user_cubit.dart';
import 'package:auto_swift/features/home/cubit/home_cubit.dart';
import 'package:auto_swift/features/screens/admin_screen.dart';
import 'package:auto_swift/features/screens/auth/sign_in_screen.dart';
import 'package:auto_swift/features/screens/auth/sign_up_screen.dart';
import 'package:auto_swift/features/screens/home_screen.dart';
import 'package:auto_swift/features/screens/onboarding.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
                create: (context) => UserCubit(DioConsumer(Dio())),
                child: SignInPage(),
              ),);
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => UserCubit(DioConsumer(Dio())),
                child: SignUpPage(),
              ),
        );

      case Routes.adminPage:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AdminCubit(DioConsumer(Dio())),
                child: AdminPage(),
              ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => HomeCubit(DioConsumer(Dio()))..getCars(),
                child: HomeScreen(),
              ),
        );
      default:
        return null;
    }
  }
}
