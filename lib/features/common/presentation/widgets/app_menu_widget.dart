import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/constants.dart';

import 'app_container.dart';

class AppMenuWidget extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final bool showTrailing;
  final Function() onPressed;

  const AppMenuWidget({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.showTrailing,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: bgColor,
      borderColor: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      onPressed: onPressed,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        horizontalTitleGap: 8,
        leading: Image.asset(
          leadingIcon,
          height: 24,
          width: 24,
          fit: BoxFit.cover,
          color: greyColor900,
        ),
        trailing: Visibility(
          visible: showTrailing,
          child: const Icon(
            Icons.chevron_right,
            color: greyColor900,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: bdLifelessGroteskMedium,
            fontSize: 14,
            color: greyColor900,
          ),
        ),
      ),
    );
  }
}
