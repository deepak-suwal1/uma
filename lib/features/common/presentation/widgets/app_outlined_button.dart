import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/constants.dart';

class AppOutlinedButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final Color borderColor;
  final bool isExpanded;
  final Widget? iconWidget;
  final IconAlignment iconAlignment;

  const AppOutlinedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.borderColor = primaryColor,
    this.isExpanded = true,
    this.iconWidget,
    this.iconAlignment = IconAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: isExpanded ? double.infinity : null,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        icon: iconWidget,
        iconAlignment: iconAlignment,
        label: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            color: borderColor,
            fontFamily: bdLifelessGroteskMedium,
          ),
        ),
      ),
    );
  }
}
