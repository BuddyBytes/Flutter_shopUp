// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shopup/data/server/api/api.dart';
import 'package:shopup/data/shared/preferences/preferences.dart';
import 'package:shopup/ui/cubits/auth_cubit/auth_cubit.dart';
import 'package:shopup/ui/cubits/layout_cubit/layout_cubit.dart';
import 'package:shopup/ui/cubits/observer/observer.dart';
import 'package:shopup/ui/cubits/onboarding_cubit/onboarding_cubits.dart';
import 'package:shopup/ui/pages/auth/login/shop_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopup/ui/pages/auth/register/shop_register.dart';
import 'package:shopup/ui/pages/layout/layout_screen/Cart/cart.dart';
import 'package:shopup/ui/pages/layout/layout_screen/favourites/favourites.dart';
import 'package:shopup/ui/pages/layout/layout_screen/search/search.dart';
import 'package:shopup/ui/pages/layout/layout_screen/settings/settings.dart';
import 'package:shopup/ui/pages/layout/layouts.dart';
import 'package:shopup/ui/pages/onboarding_screen/onboarding.dart';
import 'package:shopup/ui/style/them.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CachedPreference.cachePreferenceInitial();
  AuthenticationApiCall.authenticationInit();
  final onBoardinPassedState =
      CachedPreference.getSharedData(key: "onBoarding");
  final loginState = CachedPreference.getSharedData(key: "token");

  Widget widget;

  if (onBoardinPassedState != null) {
    if (loginState != null) {
      widget = const Layouts();
    } else {
      widget = const ShopLogin();
    }
  } else {
    widget = const Onboarding();
  }

  runApp(ShopUp(
    loginPassedState: widget,
  ));
}

class ShopUp extends StatelessWidget {
  final loginPassedState;
  const ShopUp({
    super.key,
    required this.loginPassedState,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardingCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
      ],
      child: MaterialApp(
        theme: lighTheme,
        debugShowCheckedModeBanner: false,
        home: loginPassedState,
        routes: {
          "onBoarding": (context) {
            return const Onboarding();
          },
          "login": (context) {
            return const ShopLogin();
          },
          "Register": (context) {
            return const Register();
          },
          "/": (context) {
            return const Layouts();
          },
          "Search": (context) {
            return const Search();
          },
          "Favourites": (context) {
            return const Favourites();
          },
          "Carts": (context) {
            return const Carts();
          },
          "Settings": (context) {
            return const Settings();
          },
        },
      ),
    );
  }
}
