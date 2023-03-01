import 'package:flutter/material.dart';
import 'package:shopup/ui/style/colors.dart';
// import 'package:shopup/ui/pages/layout/layout_screen/products/products.dart';
// import 'package:shopup/ui/pages/onboarding_screen/onboarding.dart';
import 'package:shopup/ui/widgets/reusable_widgets.dart';

import '../../../../cubits/auth_cubit/auth_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Update Profile",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: defualtColor),
          ),
          const SizedBox(
            height: 40,
          ),
          defaultFormField(
            false,
            isEnabled: false,
            showSuffixIcon: false,
            hintText: "${AuthCubit.get(context).registerModel?.data?.email}",
            formController: emailController,
            formIcon: const Icon(Icons.email_outlined),
          ),
          const SizedBox(
            height: 30,
          ),
          defaultFormField(
            false,
            isEnabled: false,
            showSuffixIcon: false,
            hintText: "${AuthCubit.get(context).registerModel?.data?.name}",
            formController: nameController,
            formIcon: const Icon(
              Icons.lock_outline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          defaultFormField(
            true,
            isEnabled: false,
            showSuffixIcon: true,
            hintText: "******",
            formController: passwordController,
            formIcon: const Icon(
              Icons.lock_outline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          defaultFormField(
            false,
            isEnabled: false,
            showSuffixIcon: false,
            hintText: "${AuthCubit.get(context).registerModel?.data?.phone}",
            formController: phoneController,
            formIcon: const Icon(
              Icons.phone,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: defualtColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 50,
                ),
              ),
              onPressed: () {},
              child: const Text("Update Profile"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: defualtColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 70,
                ),
              ),
              onPressed: () {
                AuthCubit.get(context)
                    .clearCach(
                  token: "token",
                  context: context,
                )
                    .then((value) {
                  toastWidget(
                    "Logout Successfully",
                    msgColor: ToastMessageColor.success.toastColor,
                  ).then(
                    (value) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        "login",
                        (route) => false,
                      );
                    },
                  );
                });
              },
              child: const Text(
                "Log Out",
              ),
            ),
          )
        ],
      ),
    );
  }
}



/*

*/