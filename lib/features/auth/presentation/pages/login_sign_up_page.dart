import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/auth/presentation/widgets/login_sign_up_body.dart';
import 'package:uhuru/features/common/presentation/pages/auth_base_view.dart';

@RoutePage()
class LoginSignUpPage extends StatelessWidget {
  LoginSignUpPage({super.key});

  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is GoogleLoginLoadedState) {
            context.showSnackBar(state.message);
          } else if (state is GoogleLoginFailedState) {
            context.showErrorSnackBar(state.error);
          }
        },
        child: AuthBaseView(
          title: 'Login or Sign Up',
          body: LoginSignUpBody(
            phoneController: phoneController,
            formKey: formKey,
            onContinuePressed: () {},
            onContinueWithEmailPressed: () {
              context.router.push(const LoginRoute());
            },
            onGoogleLoginPressed: () {
              authBloc.add(GoogleLoginEvent());
            },
          ),
        ),
      ),
    );
  }
}
