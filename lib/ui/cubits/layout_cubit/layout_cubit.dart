// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopup/data/server/api/api.dart';
import 'package:shopup/data/server/model/product_model.dart';
import 'package:shopup/ui/cubits/states/layouts_states/layout_state.dart';
import 'package:shopup/ui/pages/layout/layout_screen/favourites/favourites.dart';
import 'package:shopup/ui/pages/layout/layout_screen/products/products.dart';
import 'package:shopup/ui/pages/layout/layout_screen/search/search.dart';
import 'package:shopup/ui/pages/layout/layout_screen/settings/settings.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit()
      : super(
          LayoutInitialState(),
        );

  static LayoutCubit getInstance(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<Widget> screensNav = [
    const Products(),
    const Search(),
    const Favourites(),
    const Settings()
  ];

  int currentScreenIndex = 0;

  void changeNavIndex(int index) {
    currentScreenIndex = index;
    emit(LayoutBottomNavState());
  }

  List? itemCount;
  ProductsJson? productsView;
  void view() {
    AuthenticationApiCall.getProducts().then((value) {
      productsView = ProductsJson.fromProductJson(value, 1);
      itemCount = productsView!.data?.count;
    });
  }
}
