import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeCubit extends Cubit<bool> {
  RememberMeCubit() : super(true);

  void toggle() {
    emit(!state);
  }
}
