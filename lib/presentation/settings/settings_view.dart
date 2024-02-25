// settings_view.dart
import 'package:appnation_sc/core/assets/assets.dart';
import 'package:appnation_sc/core/constants/app_text_style.dart';
import 'package:appnation_sc/core/extensions/string/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appnation_sc/presentation/settings/bloc/settings_bloc.dart';
import 'package:appnation_sc/presentation/settings/bloc/settings_event.dart';
import 'package:appnation_sc/presentation/settings/bloc/settings_state.dart';
import 'package:appnation_sc/core/enum/loading_status.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(SettingsLoadEvent()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state.loadingStatus == LoadingStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.loadingStatus == LoadingStatus.success) {
            return ListView.builder(
              itemCount: state.settingsItems.length,
              itemBuilder: (context, index) {
                final item = state.settingsItems[index];
                return ListTile(
                  leading: item.iconPath.toSvg,
                  title: Text(item.title),
                  trailing: item.trailing ?? Assets.instance.icon.arrowUpRight.toSvg,
                );
              },
            );
          } else {
            return Center(
                child: Text('Failed to load settings', style: AppTextStyle.blackMedium12));
          }
        },
      ),
    );
  }
}
