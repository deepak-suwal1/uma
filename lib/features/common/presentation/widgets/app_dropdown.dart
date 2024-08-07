import 'package:flutter/material.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/constants.dart';

class AppDropdown<T> extends StatelessWidget {
  final String? heading;
  final String hint;
  final String? Function(T?)? validator;
  final List<T> items;
  final T? selectedItem;
  final void Function(T?) onChanged;
  final String Function(T) itemToString;
  final Function()? onPressed;

  const AppDropdown({
    super.key,
    this.heading,
    required this.hint,
    this.validator,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.itemToString,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: borderColor),
      borderRadius: BorderRadius.circular(12),
    );
    List<DropdownMenuItem<T>> dropdownItems = items
        .map((item) => DropdownMenuItem<T>(
              value: item,
              child: Text(
                itemToString(item),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: bdLifelessGroteskMedium,
                  color: greyColor900,
                ),
              ),
            ))
        .toList();

    return DropdownButtonFormField<T>(
      value: selectedItem,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      items: dropdownItems,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        fillColor: fillColor,
        filled: true,
        isDense: false,
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontFamily: bdLifelessGroteskMedium,
          color: greyColor600,
        ),
        errorMaxLines: 2,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
      ),
    );
  }
}
