// main_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appnation_sc/presentation/main/bloc/main_event.dart';
import 'package:appnation_sc/presentation/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<MainChangePageEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.selectedIndex));
    });
  }
}
