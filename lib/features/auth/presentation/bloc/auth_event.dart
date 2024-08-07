part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final LoginRequestBody loginRequestBody;

  LoginEvent(this.loginRequestBody);
}

class SignUpEvent extends AuthEvent {
  final SignUpRequestBody signUpRequestBody;

  SignUpEvent(this.signUpRequestBody);
}

class FetchUserEvent extends AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final SendOtpRequestBody sendOtpRequestBody;

  SendOtpEvent(this.sendOtpRequestBody);
}

class ResendOtpEvent extends AuthEvent {
  final SendOtpRequestBody sendOtpRequestBody;

  ResendOtpEvent(this.sendOtpRequestBody);
}

class VerifyOtpEvent extends AuthEvent {
  final VerifyOtpRequestBody verifyOtpRequestBody;

  VerifyOtpEvent(this.verifyOtpRequestBody);
}

class ForgotPasswordVerifyOtpEvent extends AuthEvent {
  final VerifyOtpRequestBody verifyOtpRequestBody;

  ForgotPasswordVerifyOtpEvent(this.verifyOtpRequestBody);
}

class GoogleLoginEvent extends AuthEvent {}

class ForgotPasswordEvent extends AuthEvent {
  final ForgotPasswordRequestBody forgotPasswordRequestBody;

  ForgotPasswordEvent(this.forgotPasswordRequestBody);
}

class ResetPasswordEvent extends AuthEvent {
  final ResetPasswordRequestBody resetPasswordRequestBody;

  ResetPasswordEvent(this.resetPasswordRequestBody);
}

class ResendEmailVerificationEvent extends AuthEvent {
  final String email;

  ResendEmailVerificationEvent(this.email);
}

class CheckInEvent extends AuthEvent {
  final String tableKey;

  CheckInEvent(this.tableKey);
}

class CheckOutEvent extends AuthEvent {
  final String tableKey;

  CheckOutEvent(this.tableKey);
}
