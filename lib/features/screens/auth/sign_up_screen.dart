import 'package:auto_swift/core/helpers/spacing.dart';
import 'package:auto_swift/features/auth/classes/auth_controller.dart';
import 'package:auto_swift/features/auth/classes/auth_validator.dart';
import 'package:auto_swift/features/auth/cubit/user_cubit.dart';
import 'package:auto_swift/features/auth/cubit/user_state.dart';
import 'package:auto_swift/features/auth/widgets/auth_background_scafold.dart';
import 'package:auto_swift/features/auth/widgets/auth_footer.dart';
import 'package:auto_swift/features/auth/widgets/auth_text_field.dart';
import 'package:auto_swift/features/auth/widgets/brand_header.dart';
import 'package:auto_swift/features/auth/widgets/password_field.dart';
import 'package:auto_swift/features/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = AuthController();

  final _name = TextEditingController();
  // final _email = TextEditingController();
  // final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _agreed = true;

  @override
  void dispose() {
    _controller.dispose();
    _name.dispose();
    // _email.dispose();
    // _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  // Future<void> _submit() async {
  //   if (!_formKey.currentState!.validate()) return;
  //   if (!_agreed) {
  //     _showSnack('You must agree to the terms');
  //     return;
  //   }
  //   try {
  //     final ok = await _controller.register(
  //       _name.text.trim(),
  //       _email.text.trim(),
  //       _password.text,
  //     );
  //     if (!mounted) return;
  //     if (ok) {
  //       _showSnack('Account created successfully ✅');
  //       await Future.delayed(const Duration(milliseconds: 350));
  //       Navigator.pushReplacementNamed(context, SignInPage.route);
  //     }
  //   } on AuthException catch (e) {
  //     if (!mounted) return;
  //     _showSnack(e.message);
  //   }
  // }

  // void _showSnack(String msg) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 70, 20, 24).r,
            child: Form(
              key: _formKey,
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BrandHeader(
                        title: 'Create Account',
                        subtitle: 'Start your journey to find your dream car.',
                      ),
                      AuthTextField(
                        controller: _name,
                        label: 'Full Name',
                        suffxIcon: Icon(Icons.person),
                        textInputAction: TextInputAction.next,
                        validator: Validators.required,
                      ),
                      verticalSpace(14),
                      AuthTextField(
                        controller: context.read<UserCubit>().signUpEmail,
                        label: 'Email',
                        suffxIcon: Icon(Icons.email, size: 16.sp),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validators.email,
                      ),
                      verticalSpace(14),
                      PasswordField(
                        controller: context.read<UserCubit>().signUpPassword,
                        label: 'Password (min 8 characters)',
                        textInputAction: TextInputAction.next,
                        validator: Validators.password,
                      ),
                      verticalSpace(14),
                      PasswordField(
                        controller: _confirm,
                        label: 'Confirm Password',
                        textInputAction: TextInputAction.done,
                        validator:
                            (v) => Validators.confirmPassword(
                              v,
                              context.read<UserCubit>().signUpPassword.text,
                            ),
                      ),
                      verticalSpace(12),
                      Row(
                        children: [
                          Checkbox(
                            value: _agreed,
                            onChanged:
                                (v) => setState(() => _agreed = v ?? false),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4).r,
                            ),
                            side: const BorderSide(color: Color(0xFF2A2A2E)),
                            activeColor: const Color(0xFFFFD60A),
                          ),
                          const Expanded(
                            child: Text(
                              'I agree to the Terms & Privacy Policy',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      ElevatedButton(
                        onPressed: () {
                           _controller.loading
                              ? null
                              : context.read<UserCubit>().signUp();
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
                                : const Text('Sign Up'),
                      ),
                      verticalSpace(24),
                      AuthFooter(
                        text: 'Already have an account?',
                        actionText: 'Sign In',
                        onTap:
                            () => Navigator.pushReplacementNamed(
                              context,
                              SignInPage.route,
                            ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
