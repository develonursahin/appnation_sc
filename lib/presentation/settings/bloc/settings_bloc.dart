// settings_bloc.dart
import 'package:flutter/services.dart';
import 'package:appnation_sc/core/assets/assets.dart';
import 'package:appnation_sc/core/constants/app_strings.dart';
import 'package:appnation_sc/core/enum/loading_status.dart';
import 'package:appnation_sc/data/models/settings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appnation_sc/presentation/settings/bloc/settings_event.dart';
import 'package:appnation_sc/presentation/settings/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<SettingsLoadEvent>((event, emit) async {
      emit(state.copyWith(loadingStatus: LoadingStatus.loading));
      try {
        final osVersion = await getOsVersion();

        final settingsItems = [
          SettingsItem(
            title: AppString.help,
            iconPath: Assets.instance.icon.help,
          ),
          SettingsItem(
            title: AppString.rateUs,
            iconPath: Assets.instance.icon.rateUs,
          ),
          SettingsItem(
            title: AppString.shareFriends,
            iconPath: Assets.instance.icon.shareFriends,
          ),
          SettingsItem(
            title: AppString.termsOfUse,
            iconPath: Assets.instance.icon.termsOfUse,
          ),
          SettingsItem(
            title: AppString.privacyPolicy,
            iconPath: Assets.instance.icon.privacyPolicy,
          ),
          SettingsItem(
            title: AppString.osVersion,
            iconPath: Assets.instance.icon.osVersion,
            trailing: Text(osVersion),
          ),
        ];
        emit(state.copyWith(settingsItems: settingsItems, loadingStatus: LoadingStatus.success));
      } catch (e) {
        emit(state.copyWith(loadingStatus: LoadingStatus.failure));
      }
    });
  }

  Future<String> getOsVersion() async {
    const platform = MethodChannel('com.example.app/settings');
    try {
      final String osVersion = await platform.invokeMethod('getOsVersion');
      return osVersion;
    } on PlatformException catch (e) {
      return "Failed to get OS version: '${e.message}'.";
    }
  }
}
