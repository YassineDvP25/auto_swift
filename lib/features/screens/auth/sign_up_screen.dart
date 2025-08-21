// import 'package:auto_swift/features/screens/auth/sign_in_screen.dart';
// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _controller = AuthController();

//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   final _confirm = TextEditingController();
//   bool _agreed = true;

//   @override
//   void dispose() {
//     _controller.dispose();
//     _name.dispose();
//     _email.dispose();
//     _password.dispose();
//     _confirm.dispose();
//     super.dispose();
//   }

//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) return;
//     if (!_agreed) {
//       _showSnack('You must agree to the terms');
//       return;
//     }
//     try {
//       final ok = await _controller.register(
//         _name.text.trim(),
//         _email.text.trim(),
//         _password.text,
//       );
//       if (!mounted) return;
//       if (ok) {
//         _showSnack('Account created successfully ✅');
//         await Future.delayed(const Duration(milliseconds: 350));
//         Navigator.pushReplacementNamed(context, SignInPage.route);
//       }
//     } on AuthException catch (e) {
//       if (!mounted) return;
//       _showSnack(e.message);
//     }
//   }

//   void _showSnack(String msg) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _controller,
//         builder: (_, __) {
//           return SingleChildScrollView(
//             padding: const EdgeInsets.fromLTRB(20, 48, 20, 24),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const BrandHeader(
//                     title: 'Create Account',
//                     subtitle: 'Start your journey to find your dream car.',
//                   ),
//                   AppTextField(
//                     controller: _name,
//                     label: 'Full Name',
//                     textInputAction: TextInputAction.next,
//                     validator: Validators.required,
//                   ),
//                   const SizedBox(height: 14),
//                   AppTextField(
//                     controller: _email,
//                     label: 'Email Address',
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction: TextInputAction.next,
//                     validator: Validators.email,
//                   ),
//                   const SizedBox(height: 14),
//                   PasswordField(
//                     controller: _password,
//                     label: 'Password (min 8 characters)',
//                     textInputAction: TextInputAction.next,
//                     validator: Validators.password,
//                   ),
//                   const SizedBox(height: 14),
//                   PasswordField(
//                     controller: _confirm,
//                     label: 'Confirm Password',
//                     textInputAction: TextInputAction.done,
//                     validator: (v) => Validators.confirmPassword(v, _password.text),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: _agreed,
//                         onChanged: (v) => setState(() => _agreed = v ?? false),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4)),
//                         side: const BorderSide(color: Color(0xFF2A2A2E)),
//                         activeColor: const Color(0xFFFFD60A),
//                       ),
//                       const Expanded(
//                         child: Text(
//                           'I agree to the Terms & Privacy Policy',
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   ElevatedButton(
//                     onPressed: _controller.loading ? null : _submit,
//                     child: _controller.loading
//                         ? const SizedBox(
//                             height: 22,
//                             width: 22,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2.4,
//                               color: Colors.black,
//                             ),
//                           )
//                         : const Text('Sign Up'),
//                   ),
//                   const SizedBox(height: 24),
//                   AuthFooter(
//                     text: 'Already have an account?',
//                     actionText: 'Sign In',
//                     onTap: () =>
//                         Navigator.pushReplacementNamed(context, SignInPage.route),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }