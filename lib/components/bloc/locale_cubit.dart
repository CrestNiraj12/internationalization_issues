import 'package:bloc/bloc.dart';

class LocaleCubit extends Cubit<String> {
  LocaleCubit() : super('en');

  void updateState(String value) => emit(value);
}
