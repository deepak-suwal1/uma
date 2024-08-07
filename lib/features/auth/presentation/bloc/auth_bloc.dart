import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uhuru/core/session/session_manager.dart';
import 'package:uhuru/features/auth/data/model/forgot_password_request_body.dart';
import 'package:uhuru/features/auth/data/model/login_request_body.dart';
import 'package:uhuru/features/auth/data/model/login_response_model.dart';
import 'package:uhuru/features/auth/data/model/reset_password_request_body.dart';
import 'package:uhuru/features/auth/data/model/send_otp_request_body.dart';
import 'package:uhuru/features/auth/data/model/sign_up_request_body.dart';
import 'package:uhuru/features/auth/data/model/user_model.dart';
import 'package:uhuru/features/auth/data/model/verify_otp_request_body.dart';
import 'package:uhuru/features/auth/data/model/verify_otp_response.dart';
import 'package:uhuru/features/auth/domain/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final SessionManager sessionManager;

  AuthBloc(this.authRepository, this.sessionManager) : super(AuthInitial()) {
    on<LoginEvent>(_loginEvent);
    on<SignUpEvent>(_signupEvent);
    on<FetchUserEvent>(_fetchUserEvent);
    on<SendOtpEvent>(_sendOtpEvent);
    on<ResendOtpEvent>(_resendOtpEvent);
    on<VerifyOtpEvent>(_verifyOtpEvent);
    on<ForgotPasswordVerifyOtpEvent>(_forgotPasswordVerifyOtpEvent);
    on<GoogleLoginEvent>(_googleLoginEvent);
    on<ForgotPasswordEvent>(_forgotPasswordEvent);
    on<ResetPasswordEvent>(_resetPasswordEvent);
    on<ResendEmailVerificationEvent>(_resendEmailVerificationEvent);
  }

  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    final response = await authRepository.login(event.loginRequestBody);
    response.result.fold(
      (l) => emit(LoginErrorState(l)),
      (r) {
        // sessionManager.saveUser(r);
        emit(LoginLoadedState(r));
      },
    );
  }

  Future<void> _signupEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoadingState());
    final response = await authRepository.signUp(event.signUpRequestBody);
    response.result.fold(
      (l) => emit(SignUpFailedState(l)),
      (r) => emit(SignUpLoadedState(r)),
    );
  }

  Future<void> _fetchUserEvent(FetchUserEvent event, emit) async {
    emit(FetchUserLoadingState());
    final response = await authRepository.fetchUser();
    response.result.fold(
      (l) => emit(FetchUserFailedState(l)),
      (r) => emit(FetchUserLoadedState(r)),
    );
  }

  Future<void> _sendOtpEvent(
      SendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await authRepository.sendOtp(event.sendOtpRequestBody);
    response.result.fold(
      (l) => emit(AuthFailedState(l)),
      (r) => emit(SignUpLoadedState(r)),
    );
  }

  Future<void> _resendOtpEvent(
      ResendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await authRepository.resendOtp(event.sendOtpRequestBody);
    response.result.fold(
      (l) => emit(AuthFailedState(l)),
      (r) => emit(ResendOtpLoadedState(r.message)),
    );
  }

  Future<void> _verifyOtpEvent(
      VerifyOtpEvent event, Emitter<AuthState> emit) async {
    emit(VerifyOtpLoadingState());

    final response = await authRepository.verifyOtp(event.verifyOtpRequestBody);
    response.result.fold(
      (l) => emit(AuthFailedState(l)),
      (r) {
        emit(VerifyOtpLoadedState(r.message));
      },
    );
  }

  Future<void> _forgotPasswordVerifyOtpEvent(
      ForgotPasswordVerifyOtpEvent event, Emitter<AuthState> emit) async {
    emit(ForgotPasswordVerifyOtpLoadingState());
    final response = await authRepository
        .forgotPasswordVerifyOtp(event.verifyOtpRequestBody);
    response.result.fold(
      (l) => emit(AuthFailedState(l)),
      (r) => emit(ForgotPasswordVerifyOtpLoadedState(r)),
    );
  }

  Future<void> _googleLoginEvent(
      GoogleLoginEvent event, Emitter<AuthState> emit) async {
    emit(GoogleLoginLoadingState());
    final response = await authRepository.googleLogin();
    response.result.fold(
      (l) => emit(GoogleLoginFailedState(l)),
      (r) {
        // sessionManager.saveUser(r);
        emit(GoogleLoginLoadedState(r));
      },
    );
  }

  Future<void> _forgotPasswordEvent(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(ForgotPasswordLoadingState());
    final response =
        await authRepository.forgotPassword(event.forgotPasswordRequestBody);
    response.result.fold(
      (l) => emit(ForgotPasswordFailedState(l)),
      (r) => emit(ForgotPasswordLoadedState(r)),
    );
  }

  Future<void> _resetPasswordEvent(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(ResetPasswordLoadingState());
    final response =
        await authRepository.resetPassword(event.resetPasswordRequestBody);
    response.result.fold(
      (l) => emit(ResetPasswordFailedState(l)),
      (r) => emit(ResetPasswordLoadedState(r)),
    );
  }

  Future<void> _resendEmailVerificationEvent(
      ResendEmailVerificationEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await authRepository.resendEmailVerification(event.email);
    response.result.fold(
      (l) => emit(AuthFailedState(l)),
      (r) => emit(ResendEmailVerificationLoadedState(r.data)),
    );
  }
}
