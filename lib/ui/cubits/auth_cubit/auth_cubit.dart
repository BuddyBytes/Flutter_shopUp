// ignore_for_file: depend_on_referenced_packages,avoid_print, empty_catches

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopup/data/server/api/api.dart';
import 'package:shopup/data/server/model/auth_model/auth_model.dart';
import 'package:shopup/data/shared/preferences/preferences.dart';
import 'package:shopup/ui/cubits/layout_cubit/layout_cubit.dart';
import 'package:shopup/ui/cubits/states/auth_states/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  static AuthCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void authRequest({
    required String email,
    required String password,
  }) {
    try {
      emit(LoadingAuthState());
      AuthenticationApiCall.postLoginData(
        email: email,
        password: password,
      ).then((value) {
        if (AuthModel.fromAuthResponse(value).message == null) {
          emit(ErrorServerAuthState());
        } else {
          if (AuthModel.fromAuthResponse(value).status == false) {
            emit(
              ErrorUserAuthState(
                successModel: AuthModel.fromAuthResponse(
                  value,
                ),
              ),
            );
          } else {
            emit(
              SuccessAuthState(
                successModel: AuthModel.fromAuthResponse(value),
              ),
            );
          }
        }
      });
    } catch (e) {}
  }

  Future clearCach({
    required String token,
    required BuildContext context,
  }) async {
    await CachedPreference.clearKey(key: token).then((value){
      LayoutCubit.getInstance(context).currentScreenIndex = 0;
    });
    emit(EndAuthState());
  }

  void changeTextState(bool textState) {
    textState = !textState;
    emit(ObscureTextAuthState());
  }
}
