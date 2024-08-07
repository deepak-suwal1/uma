import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/constants/error_message.dart';
import 'package:uhuru/core/constants/reg_exp.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uhuru/features/auth/presentation/cubit/agree_toc_cubit.dart';
import 'package:uhuru/features/common/presentation/cubit/date_picker_cubit.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';
import 'package:uhuru/features/common/presentation/widgets/app_text_field.dart';

class SignUpBody extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController dobController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey formKey;
  final Function()? onSignUpPressed;

  const SignUpBody({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.dobController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    this.onSignUpPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DatePickerCubit(),
        ),
        BlocProvider(
          create: (context) => AgreeTocCubit(),
        ),
      ],
      child: BlocListener<DatePickerCubit, DateTime?>(
        listener: (context, state) {
          dobController.text = state?.formatDate() ?? '';
        },
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                32.verticalSpace,
                AppTextField(
                  hint: 'First name',
                  validator:
                      ValidationBuilder().minLength(3).maxLength(30).build(),
                  onChanged: (v) {},
                  controller: firstNameController,
                ),
                24.verticalSpace,
                AppTextField(
                  hint: 'Last name',
                  validator:
                      ValidationBuilder().minLength(3).maxLength(30).build(),
                  onChanged: (v) {},
                  controller: lastNameController,
                ),
                24.verticalSpace,
                BlocBuilder<DatePickerCubit, DateTime?>(
                  builder: (context, state) {
                    return AppTextField(
                      hint: 'Birthday (mm/dd/yyyy)',
                      readOnly: true,
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        color: greyColor600,
                        size: 18,
                      ),
                      onTap: () =>
                          context.read<DatePickerCubit>().datePicker(context),
                      controller: dobController,
                    );
                  },
                ),
                24.verticalSpace,
                AppTextField(
                  hint: 'Email',
                  validator: ValidationBuilder().email().build(),
                  onChanged: (v) {},
                  controller: emailController,
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
                24.verticalSpace,
                Row(
                  children: [
                    BlocBuilder<AgreeTocCubit, bool>(
                      builder: (context, state) {
                        return Checkbox(
                          value: state,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4,
                          ),
                          activeColor: blackColor,
                          onChanged: (v) {
                            context.read<AgreeTocCubit>().toggle();
                          },
                        );
                      },
                    ),
                    8.horizontalSpace,
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree with ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: bdLifelessGroteskRegular,
                                color: blackColor,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Terms & Conditions, Payment Terms of Services & Privacy Policy.',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: bdLifelessGroteskMedium,
                                color: blueColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                BlocBuilder<AgreeTocCubit, bool>(
                  builder: (context, tocState) {
                    return BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return AppButton.secondary(
                          buttonText: 'Agree & Continue',
                          onPressed: onSignUpPressed,
                          isDisabled: !tocState,
                          iconWidget: SvgPicture.asset(arrowUp),
                          isLoading: state is SignUpLoadingState,
                        );
                      },
                    );
                  },
                ),
                32.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
