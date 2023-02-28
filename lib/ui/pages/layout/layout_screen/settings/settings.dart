import 'package:flutter/material.dart';
import 'package:shopup/ui/cubits/auth_cubit/auth_cubit.dart';
// import 'package:shopup/ui/pages/layout/layout_screen/products/products.dart';
// import 'package:shopup/ui/pages/onboarding_screen/onboarding.dart';
import 'package:shopup/ui/style/colors.dart';
import 'package:shopup/ui/widgets/reusable_widgets.dart';

import '../../../auth/login/shop_login.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: defualtColor,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 50,
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
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ShopLogin();
                    },
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            );
          });
        },
        child: const Text(
          "Log Out",
        ),
      ),
    );
  }
}
