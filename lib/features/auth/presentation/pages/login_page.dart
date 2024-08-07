import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/data/model/login_request_body.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/auth/presentation/widgets/login_body.dart';
import 'package:uhuru/features/common/presentation/pages/auth_base_view.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmailLogin = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginLoadedState) {
            context.showSnackBar('Login Successful');
            context.router.pushAndPopUntil(const DashboardRoute(),
                predicate: (p) => false);
          } else if (state is LoginErrorState) {
            context.showErrorSnackBar(state.error);
            context.router.pushAndPopUntil(const DashboardRoute(),
                predicate: (p) => false);
          }
        },
        child: AuthBaseView(
          title: 'Sign In from email',
          body: LoginBody(
            emailPhoneController: emailPhoneController,
            passwordController: passwordController,
            formKey: _formKey,
            onLoginPressed: () {
              if (_formKey.currentState!.validate()) {
                final loginRequestBody = LoginRequestBody(
                  username: emailPhoneController.text.trim(),
                  password: passwordController.text.trim(),
                );
                authBloc.add(LoginEvent(loginRequestBody));
              }
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
