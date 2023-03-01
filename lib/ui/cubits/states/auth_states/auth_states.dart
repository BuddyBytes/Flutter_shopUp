import 'package:shopup/data/server/model/auth_model/auth_model.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  AuthModel successModel;
  SuccessAuthState({
    required this.successModel,
  });
}

class EndAuthState extends AuthState {}

class ErrorUserAuthState extends AuthState {
  AuthModel successModel;
  ErrorUserAuthState({
    required this.successModel,
  });
}

class ErrorServerAuthState extends AuthState {}

class ObscureTextAuthState extends AuthState {}

// -----------------------------------------------------------------------------
// registrations states

class LoadingRegistrationAuthState extends AuthState {}

class SuccessRegistrationAuthState extends AuthState {
  AuthModel successModel;
  SuccessRegistrationAuthState({
    required this.successModel,
  });
}

class ErrorRegistrationAuthState extends AuthState {
  AuthModel successModel;
  ErrorRegistrationAuthState({
    required this.successModel,
  });
}

class ErrorServerRegistrationAuthState extends AuthState {}
// -----------------------------------------------------------------------------

