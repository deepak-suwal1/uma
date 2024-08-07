import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/utils/extension.dart';

class CustomStepperWidget extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final int space;

  const CustomStepperWidget({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.space = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(totalSteps, (index) {
          return _buildStep(context, index);
        }),
      ),
    );
  }

  Widget _buildStep(BuildContext context, int index) {
    bool isSelected = index == currentStep;
    // bool isCompleted = index < currentStep;

    Color color = isSelected ? primaryColor : greyColor200;

    return Container(
      width: (context.deviceWidth - space) / totalSteps,
      height: 3,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
