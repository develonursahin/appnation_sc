import 'package:appnation_sc/core/extensions/string/string_extension.dart';
import 'package:appnation_sc/presentation/home/bloc/home_bloc.dart';
import 'package:appnation_sc/presentation/splash/bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appnation_sc/core/assets/assets.dart';
import 'package:appnation_sc/core/enum/loading_status.dart';
import 'package:appnation_sc/data/services/dog_service.dart';
import 'package:appnation_sc/presentation/splash/bloc/splash_bloc.dart';
import 'package:appnation_sc/presentation/splash/bloc/splash_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dogService = DogService();
    final homeBloc = context.read<HomeBloc>();

    return BlocProvider(
      create: (context) => SplashBloc(dogService, homeBloc)..add(const SplashFetchDataEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.loadingStatus == LoadingStatus.success) {
            Navigator.pushReplacementNamed(context, '/main');
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  switch (state.loadingStatus) {
                    case LoadingStatus.loading:
                      return Assets.instance.icon.logoPNG.toImage;
                    case LoadingStatus.failure:
                      return const Text("Error");
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
