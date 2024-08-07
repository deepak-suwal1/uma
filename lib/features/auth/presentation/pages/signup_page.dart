import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/data/model/sign_up_request_body.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/auth/presentation/widgets/sign_up_body.dart';
import 'package:uhuru/features/common/presentation/pages/auth_base_view.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignUpLoadedState) {
            context.showSnackBar(state.message);
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (p) => false,
            );
          } else if (state is SignUpFailedState) {
            context.showErrorSnackBar(state.error);
          }
        },
        child: AuthBaseView(
          title: 'Finish Signing Up',
          body: SignUpBody(
            firstNameController: firstNameController,
            lastNameController: lastNameController,
            dobController: dobController,
            emailController: emailController,
            passwordController: passwordController,
            formKey: _formKey,
            onSignUpPressed: () {
              if (_formKey.currentState!.validate()) {
                final signUpRequestBody = SignUpRequestBody(
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  dob: dobController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                authBloc.add(SignUpEvent(signUpRequestBody));
              }
            },
          ),
        ),
      ),
    );
  }
}
