import 'package:appnation_sc/data/models/dog_breed_model.dart';

abstract class HomeEvent {}

class HomeBreedsUpdatedEvent extends HomeEvent {
  final List<DogBreedModel> breeds;

  HomeBreedsUpdatedEvent({required this.breeds});
}

class FetchRandomBreedImageEvent extends HomeEvent {
  final String breed;

  FetchRandomBreedImageEvent({required this.breed});
}

class SelectBreedEvent extends HomeEvent {
  final String breed;

  SelectBreedEvent({required this.breed});
}

class UpdateTextFieldStatusEvent extends HomeEvent {
  final int status;

  UpdateTextFieldStatusEvent({required this.status});
}

class FilterBreedsEvent extends HomeEvent {
  final String query;

  FilterBreedsEvent({required this.query});
}

class TextFieldFocusChangedEvent extends HomeEvent {
  final bool hasFocus;

  TextFieldFocusChangedEvent({required this.hasFocus});
}
