import 'package:blood_bank/core/constants/app_images.dart';
import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_elevated_button.dart';
import 'package:blood_bank/core/widgets/custom_rounded_button.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/auth/service/auth_service.dart';
import 'package:blood_bank/features/auth/view/forgot_password.dart';
import 'package:blood_bank/features/bottom%20nav/view/bottom_navi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Sign in to continue",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Enter your email and password to sign in",
                  style: TextStyle(color: Appthemes.mediaiuGrey),
                ),

                const Text("Email", style: Styles.requestDonorTitle),
                AutofillGroup(
                  child: CustomTextFormField(
                    controller: emailController,
                    autofillHints: [AutofillHints.email],
                    labelText: "Email",
                  ),
                ),
                const Text("Password", style: Styles.requestDonorTitle),
                AutofillGroup(
                  child: CustomTextFormField(
                    controller: passwordController,
                    labelText: "Password",
                    autofillHints: [AutofillHints.password],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      navigateTo(
                        context: context,
                        route: const ForgotPassword(),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Appthemes.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final loader = ref.watch(authSignInLoader);
                      return CustomElevatedButton(
                        onPressed: () async {
                          await signInSubmit(context, ref);
                        },
                        isLoading: loader,
                        text: "Login",
                        minSize: true,
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Appthemes.mediaiuGrey),
                    ),

                    Text(" OR ", style: TextStyle(color: Colors.grey[700])),

                    const Expanded(
                      child: Divider(color: Appthemes.mediaiuGrey),
                    ),
                  ],
                ),

                Center(
                  child: CustomRoundedButton(
                    imagePath: AppImages.onboard1,
                    onTap: () {},
                  ),
                ),

                Row(
                  mainAxisAlignment: .center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Appthemes.mediaiuGrey),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateBack(context);
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Appthemes.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInSubmit(BuildContext context, WidgetRef ref) async {
    final isValid = formKey.currentState!.validate();
    final notifier = ref.read(authSignInLoader.notifier);
    if (!isValid) return;

    try {
      notifier.state = true;
      final result = await AuthService.loginWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (!context.mounted) return;
      if (result != null) {
        notifier.state = true;
        navigateTo(context: context, route: const BottomNavi());
      }
    } catch (e) {
      notifier.state = true;
      customSnackBar(
        context: context,
        content: e.toString(),
        type: SnackType.error,
      );
    }
  }
}
