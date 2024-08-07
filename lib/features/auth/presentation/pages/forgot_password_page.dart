import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/data/model/forgot_password_request_body.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/common/presentation/pages/auth_base_view.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';
import 'package:uhuru/features/common/presentation/widgets/app_text_field.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final authBloc = getIt<AuthBloc>();

  void onSubmitPressed() {
    if (formKey.currentState!.validate()) {
      final forgotPasswordRequestBody = ForgotPasswordRequestBody(
        email: emailController.text.trim(),
      );
      authBloc.add(ForgotPasswordEvent(forgotPasswordRequestBody));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBaseView(
      title: 'Forgot Password',
      subTitle: 'Please enter your email specified during registration',
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => authBloc,
          ),
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ForgotPasswordLoadedState) {
              context.router.push(
                  OtpVerificationRoute(email: emailController.text.trim()));
              context.showSnackBar(state.message);
            } else if (state is ForgotPasswordFailedState) {
              context.showErrorSnackBar(state.error);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextField(
                      hint: 'Enter email',
                      validator: ValidationBuilder().email().build(),
                      onChanged: (v) {},
                      controller: emailController,
                    ),
                    32.verticalSpace,
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return AppButton.secondary(
                          buttonText: "Send",
                          isLoading: state is ForgotPasswordLoadingState,
                          onPressed: onSubmitPressed,
                          iconWidget: SvgPicture.asset(arrowUp),
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
    );
  }
}
