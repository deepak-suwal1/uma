import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/common/presentation/pages/auth_base_view.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';

@RoutePage()
class EmailVerificationPage extends StatefulWidget {
  final String? email;

  const EmailVerificationPage({
    super.key,
    this.email,
  });

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  int _remainingSeconds = 60;
  Timer? _timer;
  final authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _restartTimer() {
    setState(() {
      _remainingSeconds = 60;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) => switch (state) {
          ResendEmailVerificationLoadedState() => {
              _restartTimer(),
              context.showSnackBar(state.message),
            },
          _ => {}
        },
        child: AuthBaseView(
          title: 'Email Verification',
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Oops! Looks like you have not verified your email.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: bdLifelessGroteskBold,
                  fontSize: 20,
                ),
              ),
              8.verticalSpace,
              SvgPicture.asset('assets/images/error.svg'),
              8.verticalSpace,
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: const TextStyle(
                    fontFamily: bdLifelessGroteskMedium,
                    fontSize: 12,
                  ),
                  children: [
                    const TextSpan(
                        text:
                            'We’ve sent an account verification email to you at '),
                    TextSpan(
                      text: "${widget.email}.",
                      style: const TextStyle(
                        fontFamily: bdLifelessGroteskBold,
                        fontSize: 14,
                      ),
                    ),
                    const TextSpan(
                        text: ' Head over to your inbox and click on the '),
                    const TextSpan(
                      text: 'Verify Email Address',
                      style: TextStyle(
                        fontFamily: bdLifelessGroteskBold,
                        fontSize: 14,
                      ),
                    ),
                    const TextSpan(
                        text: ' button to validate your email address.'),
                  ],
                ),
              ),
              24.verticalSpace,
              Visibility(
                visible: _remainingSeconds != 0,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Resend verification email in '),
                      TextSpan(
                        text: '$_remainingSeconds',
                        style: const TextStyle(
                          fontFamily: bdLifelessGroteskBold,
                          fontSize: 14,
                        ),
                      ),
                      const TextSpan(text: ' seconds.')
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _remainingSeconds == 0,
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return AppButton(
                      buttonText: "Resend verification email",
                      isLoading: state is AuthLoadingState,
                      onPressed: () {
                        authBloc.add(
                          ResendEmailVerificationEvent(widget.email ?? ''),
                        );
                      },
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  context.router.replace(const LoginRoute());
                },
                child: const Text('Back to login'),
              ),
              const SizedBox(
                height: kToolbarHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
