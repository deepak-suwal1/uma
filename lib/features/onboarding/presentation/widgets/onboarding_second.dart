import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/utils/extension.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Image.asset(
                onBoarding2,
                height: 240,
              )
            ],
          ),
        ),
        const Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Product Listings',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: bdLifelessGroteskMedium,
                ),
              ),
              Text(
                'Guide on entering product details, including titles, descriptions, and categories.',
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
