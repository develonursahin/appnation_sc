// settings_state.dart
import 'package:appnation_sc/core/enum/loading_status.dart';
import 'package:appnation_sc/data/models/settings_item_model.dart';

class SettingsState {
  final List<SettingsItem> settingsItems;
  final LoadingStatus loadingStatus;

  SettingsState({this.settingsItems = const [], this.loadingStatus = LoadingStatus.initial});

  SettingsState copyWith({List<SettingsItem>? settingsItems, LoadingStatus? loadingStatus}) {
    return SettingsState(
      settingsItems: settingsItems ?? this.settingsItems,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
