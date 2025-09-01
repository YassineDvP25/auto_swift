import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/core/routes/routes.dart';
import 'package:auto_swift/features/auth/classes/auth_controller.dart';
import 'package:auto_swift/features/auth/classes/auth_service.dart';
import 'package:auto_swift/features/auth/cubit/user_cubit.dart';
import 'package:auto_swift/features/auth/cubit/user_state.dart';
import 'package:auto_swift/features/auth/functions/show_snack.dart';
import 'package:auto_swift/features/auth/widgets/auth_background_scafold.dart';
import 'package:auto_swift/features/auth/widgets/auth_footer.dart';
import 'package:auto_swift/features/auth/widgets/auth_or_divider.dart';
import 'package:auto_swift/features/auth/widgets/auth_text_field.dart';
import 'package:auto_swift/features/auth/widgets/brand_header.dart';
import 'package:auto_swift/features/auth/classes/auth_validator.dart';
import 'package:auto_swift/features/auth/widgets/password_field.dart';
import 'package:auto_swift/features/auth/widgets/social_buttons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatefulWidget {
  static const route = '/signInScreen';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = AuthController();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      final ok = await _controller.login(_email.text.trim(), _password.text);
      if (!mounted) return;
      if (ok) {
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      }
    } on AuthException catch (e) {
      if (!mounted) return;
      showSnack(e.message, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 24).r,
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {

                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BrandHeader(
                        title: 'Welcome back 👋',
                        subtitle: 'Sign in to continue shopping for your car.',
                      ),
                      verticalSpace(12),
                      AuthTextField(
                        controller: _email,
                        label: 'Email',
                        suffxIcon: Icon(Icons.email, size: 16.sp),

                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.none,
                        validator: Validators.email,
                      ),
                      verticalSpace(14),
                      PasswordField(
                        controller: _password,
                        label: 'Password',
                        textInputAction: TextInputAction.done,
                        validator: Validators.password,
                      ),
                      verticalSpace(8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed:
                              () => showSnack(
                                'Forgot password coming soon',
                                context,
                              ),
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      verticalSpace(8),
                      ElevatedButton(
                        onPressed: () {
                         context.read<UserCubit>().signIn();
                        },
                        child:
                            _controller.loading
                                ? SizedBox(
                                  height: 22.h,
                                  width: 22.w,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.4.w,
                                    color: Colors.black,
                                  ),
                                )
                                : const Text('Sign In'),
                      ),
                      verticalSpace(16),
                      const OrDivider(),
                      verticalSpace(16),
                      const SocialButtons(),
                      verticalSpace(24),
                      AuthFooter(
                        text: 'Don’t have an account?',
                        actionText: 'Sign Up',
                        onTap:
                            () => Navigator.pushReplacementNamed(
                              context,
                              Routes.signUpScreen,
                            ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
