import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/constants/error_message.dart';
import 'package:uhuru/core/constants/reg_exp.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/auth/presentation/cubit/remember_me_cubit.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';
import 'package:uhuru/features/common/presentation/widgets/app_text_field.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailPhoneController;
  final TextEditingController passwordController;
  final GlobalKey formKey;
  final Function()? onLoginPressed;
  final Function()? onGoogleLoginPressed;

  const LoginBody({
    super.key,
    required this.emailPhoneController,
    required this.passwordController,
    required this.formKey,
    this.onLoginPressed,
    this.onGoogleLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RememberMeCubit(),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              32.verticalSpace,
              AppTextField(
                hint: 'Email',
                validator: ValidationBuilder().email().build(),
                onChanged: (v) {},
                controller: emailPhoneController,
              ),
              24.verticalSpace,
              AppTextField(
                hint: 'Password',
                obscureText: true,
                onChanged: (v) {},
                maxLines: 1,
                validator: ValidationBuilder()
                    .regExp(passwordPattern, passwordValidationError)
                    .minLength(8)
                    .build(),
                controller: passwordController,
              ),
              8.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<RememberMeCubit, bool>(
                      builder: (context, state) {
                        return CheckboxListTile(
                          title: const Text(
                            'Remember Me',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: bdLifelessGroteskRegular,
                            ),
                          ),
                          activeColor: blackColor,
                          controlAffinity: ListTileControlAffinity.leading,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          contentPadding: EdgeInsets.zero,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          value: state,
                          onChanged: (v) {
                            context.read<RememberMeCubit>().toggle();
                          },
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.router.push(const ForgotPasswordRoute());
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: bdLifelessGroteskMedium,
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
              24.verticalSpace,
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return AppButton.secondary(
                    buttonText: 'Log In',
                    onPressed: onLoginPressed,
                    iconWidget: SvgPicture.asset(arrowUp),
                    isLoading: state is LoginLoadingState,
                  );
                },
              ),
              32.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: bdLifelessGroteskRegular,
                      color: blackColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.router.push(const SignUpRoute());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: bdLifelessGroteskMedium,
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
