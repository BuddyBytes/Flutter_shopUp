// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:shopup/data/shared/preferences/preferences.dart';
import 'package:shopup/ui/cubits/auth_cubit/auth_cubit.dart';
import 'package:shopup/ui/widgets/reusable_widgets.dart';
import 'package:shopup/ui/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/states/auth_states/auth_states.dart';

class ShopLogin extends StatelessWidget {
  const ShopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 35),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Login to Discover Your World of Shopping!",
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            const SizedBox(
              height: 50,
            ),
            defaultFormField(
              false,
              isEnabled: true,
              showSuffixIcon: false,
              hintText: "Email Address",
              formController: emailController,
              formIcon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(
              height: 30,
            ),
            defaultFormField(
              true,
              isEnabled: true,
              showSuffixIcon: true,
              hintText: "Password",
              formController: passwordController,
              formIcon: const Icon(
                Icons.lock_outline,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is LoadingAuthState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: defualtColor,
                    ),
                  );
                } else if (state is ErrorUserAuthState) {
                  toastWidget(
                    "${state.successModel.message}",
                    msgColor: ToastMessageColor.warning.toastColor,
                  );
                } else if (state is SuccessAuthState) {
                  toastWidget(
                    "${state.successModel.message}",
                    msgColor: ToastMessageColor.success.toastColor,
                  ).then(
                    (value) => CachedPreference.storeMultiplePreferences(
                      email: state.successModel.data?.email,
                      name: state.successModel.data?.name,
                      phone: state.successModel.data?.phone,
                      token: state.successModel.data?.token,
                    ).then(
                      (value) {
                        Navigator.of(context).pushReplacementNamed("home");
                      },
                    ),
                  );
                } else if (state is ErrorServerAuthState) {
                  toastWidget(
                    "check your Internet connection status",
                    msgColor: ToastMessageColor.warning.toastColor,
                  );
                }
                return Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: defualtColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 90,
                      ),
                    ),
                    onPressed: () {
                      AuthCubit.get(context).authRequest(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                    child: const Text(
                      "Login",
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: const Text(
                    "Register Now",
                    style: TextStyle(
                      color: defualtColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "Register",
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
