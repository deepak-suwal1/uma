import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/utils/extension.dart';

class RequirementItem extends StatelessWidget {
  final String text;
  final bool isValid;

  const RequirementItem({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.error,
          color: isValid ? greenColor : redColor,
          size: 16,
        ),
        6.horizontalSpace,
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontFamily: bdLifelessGroteskMedium,
            color: isValid ? greenColor : redColor,
          ),
        ),
      ],
    );
  }
}
