import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:uhuru/core/network/api_endpoints.dart';
import 'package:uhuru/core/network/dio_client.dart';
import 'package:uhuru/features/auth/data/model/forgot_password_request_body.dart';
import 'package:uhuru/features/auth/data/model/login_request_body.dart';
import 'package:uhuru/features/auth/data/model/login_response_model.dart';
import 'package:uhuru/features/auth/data/model/resend_email_verification_response.dart';
import 'package:uhuru/features/auth/data/model/reset_password_request_body.dart';
import 'package:uhuru/features/auth/data/model/send_otp_request_body.dart';
import 'package:uhuru/features/auth/data/model/sign_up_request_body.dart';
import 'package:uhuru/features/auth/data/model/user_model.dart';
import 'package:uhuru/features/auth/data/model/verify_otp_request_body.dart';
import 'package:uhuru/features/auth/data/model/verify_otp_response.dart';
import 'package:uhuru/features/auth/data/mutation/google_authentication.dart';
import 'package:uhuru/features/auth/data/mutation/login_mutation.dart';
import 'package:uhuru/features/auth/data/mutation/register_mutation.dart';
import 'package:uhuru/features/auth/data/mutation/request_password_reset.dart';
import 'package:uhuru/features/auth/data/mutation/reset_password_mutation.dart';
import 'package:uhuru/features/auth/domain/repository/auth_repository.dart';
import 'package:uhuru/features/common/data/models/global_response.dart';
import 'package:uhuru/features/common/data/models/response_entity.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final DioClient dioClient;
  final GraphQLClient graphQLClient;

  AuthRepositoryImpl(this.dioClient, this.graphQLClient);

  @override
  Future<ResponseEntity> signUp(SignUpRequestBody signUpRequestBody) async {
    try {
      final result = await graphQLClient.mutate(MutationOptions(
        document: gql(registerMutation),
        variables: {
          'emailAddress': signUpRequestBody.email,
          'title': '',
          'firstName': signUpRequestBody.firstName,
          'lastName': signUpRequestBody.lastName,
          'phoneNumber': '',
          'password': signUpRequestBody.password,
        },
      ));
      if (result.hasException) {
        return ResponseEntity.fromDynamic(result.exception.toString());
      } else {
        final data = result.data!['registerCustomerAccount'];
        final typename = data['__typename'];

        if (typename == 'Success') {
          return ResponseEntity.success('Successfully registered');
        } else if (typename == 'NativeAuthStrategyError' ||
            typename == 'PasswordValidationError' ||
            typename == 'MissingPasswordError') {
          final message = data['message'];
          return ResponseEntity.fromCustomError(message);
        } else {
          return ResponseEntity.fromCustomError('Something went wrong');
        }
      }
    } catch (e) {
      return ResponseEntity.fromCustomError('Something went wrong');
    }
  }

  @override
  Future<ResponseEntity> login(LoginRequestBody loginRequestBody) async {
    try {
      final result = await graphQLClient.mutate(MutationOptions(
        document: gql(loginMutation),
        variables: {
          'username': loginRequestBody.username,
          'password': loginRequestBody.password,
        },
      ));
      if (result.hasException) {
        return ResponseEntity.fromDynamic(result.exception.toString());
      } else {
        final data = result.data!['authenticate'];
        final typename = data['__typename'];

        if (typename == 'CurrentUser') {
          return ResponseEntity.success('Successfully logged in');
        } else if (typename == 'InvalidCredentialsError' ||
            typename == 'ErrorResult' ||
            typename == 'NotVerifiedError') {
          final message = data['message'];
          return ResponseEntity.fromCustomError(message);
        } else {
          return ResponseEntity.fromCustomError('Something went wrong');
        }
      }
    } catch (e) {
      return ResponseEntity.fromCustomError('Something went wrong');
    }
  }

  @override
  Future<ResponseEntity> googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final result = await graphQLClient.mutate(MutationOptions(
          document: gql(googleAuthenticationMutation),
          variables: {
            'token': googleAuth.accessToken,
          },
        ));

        if (result.hasException) {
          return ResponseEntity.fromDynamic(result.exception.toString());
        } else {
          final data = result.data!['authenticate'];
          final typename = data['__typename'];

          if (typename == 'CurrentUser') {
            return ResponseEntity.fromResponse(
              data,
              (json) => LoginResponseModel.fromJson(json),
            );
          } else if (typename == 'InvalidCredentialsError' ||
              typename == 'ErrorResult' ||
              typename == 'NotVerifiedError') {
            final message = data['message'];
            return ResponseEntity.fromCustomError(message);
          } else {
            return ResponseEntity.fromCustomError('Something went wrong');
          }
        }
      } else {
        return ResponseEntity.fromCustomError('Something went wrong');
      }
    } catch (e) {
      return ResponseEntity.fromCustomError(e.toString());
    }
  }

  @override
  Future<ResponseEntity<UserModel>> fetchUser() async {
    try {
      final response = await dioClient.get(userPath);
      return ResponseEntity.fromResponse(
        response,
        (data) => UserModel.fromJson(data),
      );
    } on DioException catch (e) {
      return ResponseEntity.fromError(e);
    }
  }

  @override
  Future<ResponseEntity> resendOtp(
      SendOtpRequestBody sendOtpRequestBody) async {
    try {
      final response = await dioClient.post(resendOtpPath,
          data: sendOtpRequestBody.toJson());
      return ResponseEntity.fromResponse(
        response,
        (data) => GlobalResponse.fromJson(data, (json) => {}),
      );
    } on DioException catch (e) {
      return ResponseEntity.fromError(e);
    }
  }

  @override
  Future<ResponseEntity> sendOtp(SendOtpRequestBody sendOtpRequestBody) async {
    try {
      final response =
          await dioClient.post(sendOtpPath, data: sendOtpRequestBody.toJson());
      return ResponseEntity.fromResponse(
        response,
        (data) => GlobalResponse.fromJson(data, (json) => {}),
      );
    } on DioException catch (e) {
      return ResponseEntity.fromError(e);
    }
  }

  @override
  Future<ResponseEntity> verifyOtp(
      VerifyOtpRequestBody verifyOtpRequestBody) async {
    try {
      final response = await dioClient.post(verifyOtpPath,
          data: verifyOtpRequestBody.toJson());
      return ResponseEntity.fromResponse(
        response,
        (data) => GlobalResponse.fromJson(data.data, (json) => {}),
      );
    } on DioException catch (e) {
      return ResponseEntity.fromError(e);
    }
  }

  @override
  Future<ResponseEntity> forgotPassword(
      ForgotPasswordRequestBody forgotPasswordRequestBody) async {
    try {
      final result = await graphQLClient.mutate(MutationOptions(
        document: gql(requestPasswordResetMutation),
        variables: {
          'email': forgotPasswordRequestBody.email,
        },
      ));
      if (result.hasException) {
        return ResponseEntity.fromDynamic(result.exception.toString());
      } else {
        final data = result.data!['requestPasswordReset'];
        final typename = data['__typename'];

        if (typename == 'Success') {
          return ResponseEntity.success(
            'Please check your email for the OTP.',
          );
        } else if (typename == 'NativeAuthStrategyError' ||
            typename == 'ErrorResult') {
          final message = data['message'];
          return ResponseEntity.fromCustomError(message);
        } else {
          return ResponseEntity.fromCustomError('Something went wrong');
        }
      }
    } catch (e) {
      return ResponseEntity.fromCustomError('Something went wrong');
    }
  }

  @override
  Future<ResponseEntity> resetPassword(
      ResetPasswordRequestBody resetPasswordRequestBody) async {
    try {
      final result = await graphQLClient.mutate(MutationOptions(
        document: gql(resetPasswordMutation),
        variables: {
          'password': resetPasswordRequestBody.password,
          'token': resetPasswordRequestBody.token,
        },
      ));
      log(result.toString());
      if (result.hasException) {
        return ResponseEntity.fromDynamic(result.exception.toString());
      } else {
        final data = result.data!['resetPassword'];
        final typename = data['__typename'];

        if (typename == 'Success') {
          return ResponseEntity.success(
            'Password reset successfully.',
          );
        } else if (typename == 'PasswordResetTokenInvalidError' ||
            typename == 'PasswordResetTokenExpiredError' ||
            typename == 'NativeAuthStrategyError' ||
            typename == 'NotVerifiedError' ||
            typename == 'ErrorResult' ||
            typename == 'PasswordValidationError') {
          final message = data['message'];
          return ResponseEntity.fromCustomError(message);
        } else {
          return ResponseEntity.fromCustomError('Something went wrong');
        }
      }
    } catch (e) {
      return ResponseEntity.fromCustomError('Something went wrong');
    }
  }

  @override
  Future<ResponseEntity> forgotPasswordVerifyOtp(
      VerifyOtpRequestBody verifyOtpRequestBody) async {
    try {
      final response = await dioClient.post(forgotPasswordVerifyOtpPath,
          data: verifyOtpRequestBody.toJson());
      return ResponseEntity.fromResponse(
        response,
        (data) => VerifyOtpResponse.fromJson(data),
      );
    } on DioException catch (e) {
      return ResponseEntity.fromError(e);
    }
  }

  @override
  Future<ResponseEntity> resendEmailVerification(String email) async {
    try {
      final response = await dioClient
          .post(resendEmailVerificationPath, data: {"email": email});
      return ResponseEntity.fromResponse(
        response,
        (data) => ResendEmailVerificationResponse.fromJson(data),
      );
    } on DioException catch (e) {
      return ResponseEntity.fromError(e);
    }
  }
}
