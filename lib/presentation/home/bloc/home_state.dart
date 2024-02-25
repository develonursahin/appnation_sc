import 'package:appnation_sc/data/models/dog_breed_model.dart';

// home_state.dart
class HomeState {
  final List<DogBreedModel> dogs;
  final List<DogBreedModel> filteredDogs;
  final String? randomBreedImageUrl;
  final String? selectedBreed;
  final int textFieldStatus;
  double textFieldHeight;
  double textFieldWidth;

  HomeState({
    this.dogs = const [],
    this.filteredDogs = const [],
    this.randomBreedImageUrl,
    this.selectedBreed,
    this.textFieldStatus = 0,
    this.textFieldHeight = 60.0,
    this.textFieldWidth = double.infinity,
  });

  HomeState copyWith({
    List<DogBreedModel>? dogs,
    List<DogBreedModel>? filteredDogs,
    String? randomBreedImageUrl,
    String? selectedBreed,
    int? textFieldStatus,
    double? textFieldHeight,
    double? textFieldWidth,
  }) {
    return HomeState(
      dogs: dogs ?? this.dogs,
      filteredDogs: filteredDogs ?? this.filteredDogs,
      randomBreedImageUrl: randomBreedImageUrl ?? this.randomBreedImageUrl,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      textFieldStatus: textFieldStatus ?? this.textFieldStatus,
      textFieldHeight: textFieldHeight ?? this.textFieldHeight,
      textFieldWidth: textFieldWidth ?? this.textFieldWidth,
    );
  }
}
