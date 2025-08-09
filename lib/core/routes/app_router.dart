import 'package:auto_swift/core/api/dio_consumer.dart';
import 'package:auto_swift/core/routes/routes.dart';
import 'package:auto_swift/features/admin/cubit/admin_cubit.dart';
import 'package:auto_swift/features/admin/screens/admin_screen.dart';
import 'package:auto_swift/features/screens/auth/sign_in_screen.dart';
import 'package:auto_swift/features/screens/auth/sign_up_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.adminPage:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AdminCubit(DioConsumer(Dio())),
                child: AdminPage(),
              ),
        );
      default:
        return null;
    }
  }
}
