import 'package:appnation_sc/data/services/dog_service.dart';
import 'package:appnation_sc/presentation/home/bloc/home_event.dart';
import 'package:appnation_sc/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DogService _dogService;

  HomeBloc(this._dogService) : super(HomeState()) {
    on<HomeBreedsUpdatedEvent>((event, emit) {
      emit(state.copyWith(dogs: event.breeds, filteredDogs: event.breeds));
    });

    on<FetchRandomBreedImageEvent>((event, emit) async {
      final imageUrl = await _dogService.fetchRandomImageUrl(state.selectedBreed!);
      emit(state.copyWith(randomBreedImageUrl: imageUrl));
    });

    on<SelectBreedEvent>((event, emit) {
      emit(state.copyWith(selectedBreed: event.breed));
    });

    on<UpdateTextFieldStatusEvent>((event, emit) {
      emit(state.copyWith(textFieldStatus: event.status));
    });

    on<FilterBreedsEvent>((event, emit) {
      final filteredBreeds = state.dogs
          .where((dog) => dog.name!.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(state.copyWith(filteredDogs: filteredBreeds));
    });

    on<TextFieldFocusChangedEvent>((event, emit) {
      if (event.hasFocus) {
        emit(state.copyWith(textFieldStatus: 1));
      } else {
        emit(state.copyWith(textFieldStatus: 0));
      }
    });
  }
}
