import 'package:uhuru/features/auth/data/model/forgot_password_request_body.dart';
import 'package:uhuru/features/auth/data/model/login_request_body.dart';
import 'package:uhuru/features/auth/data/model/reset_password_request_body.dart';
import 'package:uhuru/features/auth/data/model/send_otp_request_body.dart';
import 'package:uhuru/features/auth/data/model/sign_up_request_body.dart';
import 'package:uhuru/features/auth/data/model/user_model.dart';
import 'package:uhuru/features/auth/data/model/verify_otp_request_body.dart';
import 'package:uhuru/features/common/data/models/response_entity.dart';

abstract class AuthRepository {
  Future<ResponseEntity> login(LoginRequestBody loginRequestBody);

  Future<ResponseEntity<UserModel>> fetchUser();

  Future<ResponseEntity> signUp(SignUpRequestBody signUpRequestBody);

  Future<ResponseEntity> sendOtp(SendOtpRequestBody sendOtpRequestBody);

  Future<ResponseEntity> resendOtp(SendOtpRequestBody sendOtpRequestBody);

  Future<ResponseEntity> verifyOtp(VerifyOtpRequestBody verifyOtpRequestBody);

  Future<ResponseEntity> forgotPasswordVerifyOtp(
      VerifyOtpRequestBody verifyOtpRequestBody);

  Future<ResponseEntity> forgotPassword(
      ForgotPasswordRequestBody forgotPasswordRequestBody);

  Future<ResponseEntity> resetPassword(
      ResetPasswordRequestBody resetPasswordRequestBody);

  Future<ResponseEntity> resendEmailVerification(String email);

  Future<ResponseEntity> googleLogin();
}
