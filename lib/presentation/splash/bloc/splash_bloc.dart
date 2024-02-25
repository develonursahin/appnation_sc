import 'package:appnation_sc/core/enum/loading_status.dart';
import 'package:appnation_sc/data/services/dog_service.dart';
import 'package:appnation_sc/presentation/home/bloc/home_bloc.dart';
import 'package:appnation_sc/presentation/home/bloc/home_event.dart';
import 'package:appnation_sc/presentation/splash/bloc/splash_event.dart';
import 'package:appnation_sc/presentation/splash/bloc/splash_state.dart';
import 'package:bloc/bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final DogService _dogService;
  final HomeBloc _homeBloc;

  SplashBloc(this._dogService, this._homeBloc) : super(SplashState()) {
    on<SplashFetchDataEvent>((event, emit) async {
      emit(state.copyWith(loadingStatus: LoadingStatus.loading));
      try {
        final breeds = await _dogService.fetchDogBreeds();
        emit(state.copyWith(dogBreeds: breeds, loadingStatus: LoadingStatus.success));
        _homeBloc.add(HomeBreedsUpdatedEvent(breeds: breeds));
      } catch (e) {
        emit(state.copyWith(loadingStatus: LoadingStatus.failure));
      }
    });
  }
}
