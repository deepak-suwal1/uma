import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/constants.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    fontFamily: bdLifelessGroteskMedium,
    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      modalBackgroundColor: primaryColor,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerHeight: 0,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 2, color: primaryColor),
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: bdLifelessGroteskSemiBold,
        fontSize: 14,
        color: primaryColor,
      ),
      labelStyle: TextStyle(
        fontFamily: bdLifelessGroteskSemiBold,
        fontSize: 14,
        color: primaryColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: whiteColor,
      selectedItemColor: primaryColor,
      elevation: 50,
      unselectedItemColor: greyColor,
      selectedLabelStyle: TextStyle(
        fontSize: 10,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
      ),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: whiteColor),
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 16,
        fontFamily: bdLifelessGroteskSemiBold,
      ),
    ),
    scaffoldBackgroundColor: whiteColor,
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: blackColor,
      ),
      bodyMedium: TextStyle(
        color: blackColor,
      ),
      bodySmall: TextStyle(
        color: blackColor,
      ),
    ),
  );
}
