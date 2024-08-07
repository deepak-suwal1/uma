import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/reg_exp.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/data/model/reset_password_request_body.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/auth/presentation/widgets/requirement_item.dart';
import 'package:uhuru/features/common/presentation/pages/auth_base_view.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';
import 'package:uhuru/features/common/presentation/widgets/app_text_field.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    super.key,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authBloc = getIt<AuthBloc>();
  bool isValidated = false;

  @override
  Widget build(BuildContext context) {
    return AuthBaseView(
      title: 'Create New Password',
      subTitle: 'This password should be different from the previous password.',
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => authBloc,
          ),
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ResetPasswordLoadedState) {
              context.showSnackBar(state.message);
              context.router.pushAndPopUntil(
                const LoginRoute(),
                predicate: (p) => false,
              );
            } else if (state is ResetPasswordFailedState) {
              context.showErrorSnackBar(state.error);
            }
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                32.verticalSpace,
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        hint: 'Password',
                        obscureText: true,
                        controller: passwordController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'The field is required';
                          } else if (!passwordPattern.hasMatch(v)) {
                            return 'Please enter valid password';
                          }
                          return null;
                        },
                      ),
                      24.verticalSpace,
                      AppTextField(
                        hint: 'Confirm password',
                        obscureText: true,
                        controller: confirmPasswordController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'The field is required';
                          } else if (!passwordPattern.hasMatch(v)) {
                            return 'Please enter valid password';
                          } else if (passwordController.text !=
                              confirmPasswordController.text) {
                            return 'Password doesn\'t match';
                          }
                          return null;
                        },
                      ),
                      16.verticalSpace,
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RequirementItem(
                            text: 'At least 8 characters',
                            isValid: true,
                          ),
                          RequirementItem(
                            text: 'At least 1 number',
                            isValid: true,
                          ),
                          RequirementItem(
                            text: 'Both upper and lower case letters',
                            isValid: true,
                          ),
                        ],
                      ),
                      24.verticalSpace,
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return AppButton.secondary(
                            buttonText: 'Reset Password',
                            isLoading: state is ResetPasswordLoadingState,
                            iconWidget: SvgPicture.asset(arrowUp),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final resetPasswordRequestBody =
                                    ResetPasswordRequestBody(
                                  password: passwordController.text,
                                  token:
                                      'MjAyNC0wOC0wMlQwOToyMjozMC4yOTFa_4UU597VF7SBXF6F',
                                );
                                authBloc.add(ResetPasswordEvent(
                                    resetPasswordRequestBody));
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
