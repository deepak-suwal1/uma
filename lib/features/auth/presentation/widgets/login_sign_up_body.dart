import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';
import 'package:uhuru/features/common/presentation/widgets/app_dropdown.dart';
import 'package:uhuru/features/common/presentation/widgets/app_text_field.dart';

class LoginSignUpBody extends StatelessWidget {
  final TextEditingController phoneController;
  final GlobalKey formKey;
  final Function()? onContinuePressed;
  final Function()? onGoogleLoginPressed;
  final Function()? onContinueWithEmailPressed;

  const LoginSignUpBody({
    super.key,
    required this.phoneController,
    required this.formKey,
    this.onContinuePressed,
    this.onContinueWithEmailPressed,
    this.onGoogleLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            32.verticalSpace,
            AppDropdown(
              hint: 'Select',
              items: const ['United States (+1)', 'Nepal (+977)'],
              selectedItem: 'United States (+1)',
              onChanged: (v) {},
              itemToString: (v) => v,
            ),
            24.verticalSpace,
            AppTextField(
              hint: 'Phone Number',
              validator:
                  ValidationBuilder().minLength(10).maxLength(10).build(),
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
            8.verticalSpace,
            const Text(
              'We will send verification code on your number to confirm it\'s you',
              style: TextStyle(
                fontFamily: bdLifelessGroteskRegular,
                color: blackColor,
                fontSize: 12,
              ),
            ),
            12.verticalSpace,
            AppButton.secondary(
              buttonText: 'Continue',
              onPressed: onContinuePressed,
              iconWidget: SvgPicture.asset(arrowUp),
            ),
            16.verticalSpace,
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    height: 1,
                    color: dividerColor,
                  ),
                ),
                12.horizontalSpace,
                const Text(
                  'or',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: bdLifelessGroteskRegular,
                    color: greyColor,
                  ),
                ),
                12.horizontalSpace,
                const Expanded(
                  child: Divider(
                    height: 1,
                    color: dividerColor,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            AppButton(
              buttonText: 'Continue with Email',
              onPressed: onContinueWithEmailPressed,
              backgroundColor: whiteColor,
            ),
            12.verticalSpace,
            AppButton(
              buttonText: 'Continue with Apple',
              backgroundColor: whiteColor,
              iconWidget: const Icon(
                Icons.apple,
                size: 20,
                color: blackColor,
              ),
              onPressed: () {},
            ),
            12.verticalSpace,
            AppButton(
              buttonText: 'Continue with Google',
              backgroundColor: whiteColor,
              iconWidget: const Icon(
                Icons.apple,
                size: 20,
                color: blackColor,
              ),
              onPressed: onGoogleLoginPressed,
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
