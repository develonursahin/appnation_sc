// main_state.dart

class MainState {
  final int selectedIndex;

  MainState({this.selectedIndex = 0});

  MainState copyWith({int? selectedIndex}) {
    return MainState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
