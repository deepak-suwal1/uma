import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/constants.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final bool isLoading;
  final Function()? onPressed;
  final Widget loadingWidget;
  final double borderRadius;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color textColor;
  final bool isExpanded;
  final Widget? iconWidget;
  final IconAlignment iconAlignment;
  final double? elevation;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
    this.borderRadius = 24,
    this.backgroundColor = primaryColor,
    this.disabledBackgroundColor = primaryColorLight,
    this.textColor = blackColor,
    this.isExpanded = true,
    this.iconWidget,
    this.elevation,
    this.isDisabled = false,
    this.iconAlignment = IconAlignment.end,
    this.loadingWidget = const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: whiteColor,
        strokeWidth: 2,
      ),
    ),
  });

  AppButton.secondary({
    Key? key,
    required String buttonText,
    required Function()? onPressed,
    bool isLoading = false,
    double borderRadius = 24,
    bool isExpanded = true,
    Widget? iconWidget,
    double? elevation,
    bool isDisabled = false,
    IconAlignment iconAlignment = IconAlignment.end,
    Widget loadingWidget = const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: whiteColor,
        strokeWidth: 2,
      ),
    ),
  }) : this(
          key: key,
          buttonText: buttonText,
          onPressed: onPressed,
          isLoading: isLoading,
          borderRadius: borderRadius,
          backgroundColor: blackColor,
          disabledBackgroundColor: blackColor.withOpacity(0.5),
          textColor: whiteColor,
          isExpanded: isExpanded,
          isDisabled: isDisabled,
          elevation: elevation,
          iconWidget: iconWidget,
          iconAlignment: iconAlignment,
          loadingWidget: loadingWidget,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: (isLoading || isDisabled) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: disabledBackgroundColor,
          disabledForegroundColor: bgColor,
          backgroundColor: backgroundColor,
          surfaceTintColor: Colors.grey,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        icon: isLoading ? const SizedBox() : iconWidget,
        iconAlignment: iconAlignment,
        label: isLoading
            ? loadingWidget
            : FittedBox(
                child: Text(
                  buttonText,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: bdLifelessGroteskMedium,
                    color: textColor,
                  ),
                ),
              ),
      ),
    );
  }
}
