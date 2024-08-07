part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginLoadedState extends AuthState {
  final LoginResponseModel loginResponseModel;

  LoginLoadedState(this.loginResponseModel);
}

class LoginErrorState extends AuthState {
  String error;

  LoginErrorState(this.error);
}

class GoogleLoginLoadingState extends AuthState {}

class GoogleLoginLoadedState extends AuthState {
  final String message;

  GoogleLoginLoadedState(this.message);
}

class GoogleLoginFailedState extends AuthState {
  final String error;

  GoogleLoginFailedState(this.error);
}

class SignUpLoadingState extends AuthState {}

class SignUpLoadedState extends AuthState {
  String message;

  SignUpLoadedState(this.message);
}

class SignUpFailedState extends AuthState {
  String error;

  SignUpFailedState(this.error);
}

class SendOtpLoadedState extends AuthState {
  final String message;

  SendOtpLoadedState(this.message);
}

final class FetchUserLoadingState extends AuthState {}

final class FetchUserLoadedState extends AuthState {
  final UserModel userModel;

  FetchUserLoadedState(this.userModel);
}

final class FetchUserFailedState extends AuthState {
  final String error;

  FetchUserFailedState(this.error);
}

class ResendOtpLoadedState extends AuthState {
  final String message;

  ResendOtpLoadedState(this.message);
}

class VerifyOtpLoadingState extends AuthState {}

class VerifyOtpLoadedState extends AuthState {
  final String message;

  VerifyOtpLoadedState(this.message);
}

class ForgotPasswordVerifyOtpLoadingState extends AuthState {}

class ForgotPasswordVerifyOtpLoadedState extends AuthState {
  final VerifyOtpResponse verifyOtpResponse;

  ForgotPasswordVerifyOtpLoadedState(this.verifyOtpResponse);
}

class ForgotPasswordLoadingState extends AuthState {}

class ForgotPasswordLoadedState extends AuthState {
  final String message;

  ForgotPasswordLoadedState(this.message);
}

class ForgotPasswordFailedState extends AuthState {
  final String error;

  ForgotPasswordFailedState(this.error);
}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordLoadedState extends AuthState {
  final String message;

  ResetPasswordLoadedState(this.message);
}

class ResetPasswordFailedState extends AuthState {
  final String error;

  ResetPasswordFailedState(this.error);
}

class ResendEmailVerificationLoadedState extends AuthState {
  final String message;

  ResendEmailVerificationLoadedState(this.message);
}

class AuthFailedState extends AuthState {
  final String error;

  AuthFailedState(this.error);
}
