import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final EdgeInsets? padding;
  final List<Widget>? actions;
  final String? title;
  final bool? resizeToAvoidBottomInset;
  final Widget? titleWidget;

  const BaseView({
    super.key,
    this.title,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.padding,
    this.actions,
    this.resizeToAvoidBottomInset,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: actions,
        centerTitle: true,
        title: titleWidget ??
            Text(
              title ?? 'UMA',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        child: body,
      ),
    );
  }
}
