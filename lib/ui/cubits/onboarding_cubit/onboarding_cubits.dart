// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopup/ui/cubits/states/onboarding_states/states.dart';

import '../../../data/shared/preferences/preferences.dart';
import '../../widgets/model.dart';

class OnBoardingCubit extends Cubit<OnboardingStates> {
  OnBoardingCubit() : super(OnboardingInitialState());

  static OnBoardingCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  bool isLast = false;

  List<OnboardingModel> onModel = [
    OnboardingModel(
      image: Image.asset("assets/images/onboarding_1.png"),
      title: "Get Started in Minutes",
      description: "description",
    ),
    OnboardingModel(
      image: Image.asset("assets/images/onboarding_2.png"),
      title: "Shop Smarter, Not Harder",
      description: "description",
    ),
    OnboardingModel(
      image: Image.asset("assets/images/onboarding_3.png"),
      title: "Join the Fun of Shopping Today",
      description: "description",
    ),
  ];
  

  bool getOnboardingPassedState() {
    final onBoardingStatePassed = CachedPreference.getSharedData(key: "onBoarding");
    return onBoardingStatePassed;
  }
}
