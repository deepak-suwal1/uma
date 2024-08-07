import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/constants.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final String? initialValue;
  final Function(String)? onChanged;
  final int maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Color? fillColor;
  final Color? borderColor;
  final bool showRequired;
  final List<TextInputFormatter>? inputFormatters;
  final StrutStyle? strutStyle;

  const AppTextField({
    super.key,
    this.initialValue,
    required this.hint,
    this.validator,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.onChanged,
    this.maxLines = 1,
    this.maxLength,
    this.maxLengthEnforcement,
    this.fillColor,
    this.borderColor,
    this.showRequired = false,
    this.inputFormatters,
    this.strutStyle,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;
  late OutlineInputBorder border;

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: borderColor),
      borderRadius: BorderRadius.circular(12),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 16,
        fontFamily: bdLifelessGroteskRegular,
        color: blackColor,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      strutStyle: widget.strutStyle,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      controller: widget.controller,
      readOnly: widget.readOnly,
      validator: widget.validator,
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      onTapOutside: (e) {
        Future.delayed(const Duration(milliseconds: 300),
            () => FocusManager.instance.primaryFocus?.unfocus());
      },
      obscureText: widget.obscureText ? _obscureText : false,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        fillColor: widget.fillColor ?? fillColor,
        filled: true,
        isDense: false,
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontFamily: bdLifelessGroteskRegular,
          color: blackColor,
        ),
        errorStyle: const TextStyle(
          fontSize: 10,
        ),
        errorMaxLines: 3,
        prefixIcon: widget.prefixIcon,
        prefix: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: blackColor,
                  size: 16,
                ),
              )
            : widget.suffixIcon,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
      ),
    );
  }
}
