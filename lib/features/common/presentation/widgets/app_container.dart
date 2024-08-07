import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';

class AppContainer extends StatelessWidget {
  final double radius;
  final Color borderColor;
  final Color color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;
  final double borderWidth;
  final Function()? onPressed;

  const AppContainer({
    super.key,
    this.radius = 5,
    this.borderColor = primaryColorLight,
    this.color = primaryColorLight,
    required this.child,
    this.margin,
    this.borderWidth = 1,
    this.padding = const EdgeInsets.all(12),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: InkWell(
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
