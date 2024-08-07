import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickerCubit extends Cubit<DateTime?> {
  DatePickerCubit() : super(null);

  Future<void> datePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: state,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1924),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != state) {
      emit(pickedDate);
    }
  }
}
