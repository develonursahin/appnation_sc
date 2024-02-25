// main_event.dart
abstract class MainEvent {}

class MainChangePageEvent extends MainEvent {
  final int selectedIndex;

  MainChangePageEvent(this.selectedIndex);
}
