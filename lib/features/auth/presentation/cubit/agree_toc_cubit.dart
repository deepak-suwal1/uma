import 'package:flutter_bloc/flutter_bloc.dart';

class AgreeTocCubit extends Cubit<bool> {
  AgreeTocCubit() : super(true);

  void toggle() {
    emit(!state);
  }
}
