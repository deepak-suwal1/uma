import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/constants.dart';

class AuthBaseView extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final EdgeInsets? padding;
  final List<Widget>? actions;
  final String title;
  final String? subTitle;

  const AuthBaseView({
    super.key,
    required this.title,
    this.subTitle,
    required this.body,
    this.bottomNavigationBar,
    this.padding,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: actions,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'UMA',
          style: TextStyle(
            fontFamily: bdLifelessGroteskBold,
            fontSize: 24,
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: Column(
        children: [
          Container(
            height: 240,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: primaryColorLight,
              image: DecorationImage(
                image: AssetImage(authBanner),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(42),
                bottomRight: Radius.circular(42),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
              child: Align(
                alignment:
                    subTitle != null ? Alignment.centerLeft : Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: bdLifelessGroteskMedium,
                        fontSize: 24,
                        color: whiteColor,
                      ),
                    ),
                    Visibility(
                      visible: subTitle != null,
                      child: Text(
                        subTitle ?? '',
                        style: const TextStyle(
                          fontFamily: bdLifelessGroteskRegular,
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
