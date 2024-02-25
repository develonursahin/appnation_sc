import 'package:appnation_sc/core/constants/app_strings.dart';
import 'package:appnation_sc/core/constants/app_text_style.dart';
import 'package:appnation_sc/presentation/main/bloc/main_bloc.dart';
import 'package:appnation_sc/presentation/main/bloc/main_state.dart';
import 'package:appnation_sc/presentation/main/widgets/custom_bottom_navbar_widget.dart';
import 'package:appnation_sc/presentation/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appnation_sc/presentation/home/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppString.appName,
              style: AppTextStyle.blackSemiBold20.copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: IndexedStack(
            index: state.selectedIndex,
            children: const [
              HomeView(),
              SettingsView(),
            ],
          ),
          bottomNavigationBar: const CustomBottomNavBarWidget(),
        );
      },
    );
  }
}
