// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:shopup/data/shared/preferences/preferences.dart';
import 'package:shopup/ui/cubits/onboarding_cubit/onboarding_cubits.dart';
import 'package:shopup/ui/pages/auth/login/shop_login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shopup/ui/style/colors.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = PageController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                CachedPreference.savePreferenceData(
                        key: "onBoarding", value: true)
                    .then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ShopLogin();
                      },
                    ),
                  ),
                );
              },
              child: const Text(
                'skip',
                style: TextStyle(color: Color.fromARGB(255, 3, 17, 15)),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: onBoardingController,
            itemCount: OnBoardingCubit.get(context).onModel.length,
            onPageChanged: (index) {
              if (index >= OnBoardingCubit.get(context).onModel.length - 1) {
                OnBoardingCubit.get(context).isLast = true;
              } else {
                OnBoardingCubit.get(context).isLast = false;
              }
            },
            itemBuilder: (context, index) {
              return Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 4,
                    child: OnBoardingCubit.get(context).onModel[index].image,
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      OnBoardingCubit.get(context).onModel[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SmoothPageIndicator(
                      controller: onBoardingController,
                      count: OnBoardingCubit.get(context).onModel.length,
                      effect: const WormEffect(
                        activeDotColor: Color.fromARGB(255, 6, 34, 29),
                        dotColor: Color.fromARGB(255, 228, 234, 233),
                        dotHeight: 12,
                        dotWidth: 12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            onBoardingController.previousPage(
                              duration: const Duration(microseconds: 600),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          child: Text(
                            'Previous',
                            style: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ))
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            onPressed: () {
              if (OnBoardingCubit.get(context).isLast) {
                CachedPreference.savePreferenceData(
                        key: "onBoarding", value: true)
                    .then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ShopLogin();
                      },
                    ),
                  ),
                );
              } else {
                onBoardingController.nextPage(
                  duration: const Duration(microseconds: 600),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              }
            },
            elevation: 0.0,
            backgroundColor: defualtColor,
            child: const Icon(Icons.navigate_next_outlined),
          ),
        ),
      ),
    );
  }
}
