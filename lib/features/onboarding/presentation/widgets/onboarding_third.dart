import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/utils/extension.dart';

class OnboardingThird extends StatelessWidget {
  const OnboardingThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  onBoarding3,
                  height: 240,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dashboard Overview',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: bdLifelessGroteskMedium,
                ),
              ),
              Text(
                'Instructions on how to use analytics and reports to track performance and sales.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: bdLifelessGroteskRegular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
