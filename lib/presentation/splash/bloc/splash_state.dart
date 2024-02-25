import 'package:appnation_sc/core/enum/loading_status.dart';
import 'package:appnation_sc/data/models/dog_breed_model.dart';

class SplashState {
  final List<DogBreedModel> dogBreeds;
  final LoadingStatus loadingStatus;

  SplashState({this.dogBreeds = const [], this.loadingStatus = LoadingStatus.initial});

  SplashState copyWith({
    List<DogBreedModel>? dogBreeds,
    LoadingStatus? loadingStatus,
  }) {
    return SplashState(
      dogBreeds: dogBreeds ?? this.dogBreeds,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
