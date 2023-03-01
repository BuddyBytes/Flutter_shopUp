// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/layout_cubit/layout_cubit.dart';
import '../../cubits/states/layouts_states/layout_state.dart';

class Layouts extends StatelessWidget {
  const Layouts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final instance = LayoutCubit.getInstance(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              "ShopUp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ),
          body: instance.screensNav[instance.currentScreenIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              instance.changeNavIndex(value);
            },
            currentIndex: instance.currentScreenIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Products'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
