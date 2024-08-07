import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/auth/presentation/cubit/form_validation_cubit.dart';
import 'package:uhuru/features/common/presentation/pages/auth_base_view.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';

@RoutePage()
class OtpVerificationPage extends StatefulWidget {
  final String email;

  const OtpVerificationPage({super.key, required this.email});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _formKey = GlobalKey<FormState>();

  final authBloc = getIt<AuthBloc>();

  final otpController = TextEditingController();
  late Timer _timer;
  bool showResendOtp = true;
  int _remainingSeconds = 60;

  @override
  void initState() {
    _startTimer();

    super.initState();
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
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FormValidationCubit(),
        ),
        BlocProvider(
          create: (context) => authBloc,
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: AuthBaseView(
          title: 'Check your email',
          subTitle: 'We have sent the code to ${widget.email}',
          body: SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace,
                BlocBuilder<FormValidationCubit, bool>(
                  builder: (context, validated) {
                    return Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: () {
                        context.read<FormValidationCubit>().validateForm(
                            _formKey.currentState?.validate() ?? false);
                      },
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Code ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: bdLifelessGroteskSemiBold,
                                color: blackColor,
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          Center(
                            child: PinCodeTextField(
                              controller: otpController,
                              appContext: context,
                              length: 6,
                              enableActiveFill: true,
                              errorTextSpace: 26,
                              keyboardType: TextInputType.number,
                              validator: ValidationBuilder().build(),
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontFamily: bdLifelessGroteskSemiBold,
                              ),
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(12),
                                inactiveColor: borderColor,
                                activeColor: borderColor,
                                selectedColor: borderColor,
                                activeFillColor: fillColor,
                                inactiveFillColor: fillColor,
                                selectedFillColor: fillColor,
                                inactiveBorderWidth: 1,
                                activeBorderWidth: 1,
                                selectedBorderWidth: 1,
                              ),
                              onCompleted: (v) {
                                // authBloc.add(VerifyOtpEvent(verifyOtpRequestBody1));
                              },
                              onChanged: (value) {},
                            ),
                          ),
                          20.verticalSpace,
                          Visibility(
                            visible: _remainingSeconds == 0,
                            child: InkWell(
                              onTap: () {
                                _restartTimer();
                                // authBloc.add(ResendOtpEvent(sendOtpRequestBody));
                              },
                              child: const Text(
                                'Re-send code',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: bdLifelessGroteskSemiBold,
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _remainingSeconds != 0,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Send code again ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: bdLifelessGroteskSemiBold,
                                      color: blackColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '00:$_remainingSeconds',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: bdLifelessGroteskRegular,
                                      color: blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return AppButton.secondary(
                                isLoading: state is VerifyOtpLoadingState,
                                buttonText: 'Verification',
                                iconWidget: SvgPicture.asset(arrowUp),
                                onPressed: () {
                                  context.router
                                      .push(const ResetPasswordRoute());
                                  // authBloc.add(VerifyOtpEvent(verifyOtpRequestBody1));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
