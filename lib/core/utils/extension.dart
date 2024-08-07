import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uhuru/core/constants/app_colors.dart';

extension Space on int {
  Widget get verticalSpace => SizedBox(height: toDouble());

  Widget get horizontalSpace => SizedBox(width: toDouble());
}

extension SizeExt on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;
}

extension SnackBarExt on BuildContext {
  showSnackBar(String? title) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(title ?? ''),
          showCloseIcon: true,
          duration: const Duration(seconds: 3),
          backgroundColor: primaryColor,
        ),
      );

  showErrorSnackBar(String title) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(title),
          showCloseIcon: true,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
}

extension DialogExt on BuildContext {
  showLoader() {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

extension DialogDismissExt on BuildContext {
  hideLoading() => Navigator.pop(this);
}

extension DateFormatExt on DateTime {
  String formatDate({showTime = false}) {
    const dateFormat = 'MM/dd/yyyy';
    const dateTimeFormat = 'yyyy-MM-dd hh:mm';
    return DateFormat(showTime ? dateTimeFormat : dateFormat).format(this);
  }
}

extension DateFormatAbbr on String {
  String formatDateAbbr() {
    var date = DateFormat('dd MMM yyyy').parse(this);
    var formattedDate = DateFormat('MM-dd').format(date);
    return formattedDate;
  }
}

extension DateExt on String {
  String formatDate({showTime = false}) {
    final DateTime date = DateTime.parse(this);
    const dateFormat = 'dd MMM, yyyy';
    const dateTimeFormat = 'dd MMM, yyyy hh:mm';
    final formattedDate =
        DateFormat(showTime ? dateTimeFormat : dateFormat).format(date);
    return formattedDate;
  }
}

extension FileSizeExtension on int {
  String fileSize() {
    if (this < 1024) {
      return '$this B';
    } else if (this < 1024 * 1024) {
      double kb = this / 1024;
      return '${kb.toStringAsFixed(2)} KB';
    } else {
      double mb = this / (1024 * 1024);
      return '${mb.toStringAsFixed(2)} MB';
    }
  }
}

extension StringCapitalization on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension StringValidation on String {
  bool validateEmail() =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(this);

  bool validatePhone() => RegExp(r"^9\d{9}$").hasMatch(this);
}
