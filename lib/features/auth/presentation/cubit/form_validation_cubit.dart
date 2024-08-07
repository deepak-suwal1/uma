import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormValidationCubit extends Cubit<bool> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FormValidationCubit() : super(false);

  void validateForm(bool isValid) {
    emit(isValid);
  }
}
