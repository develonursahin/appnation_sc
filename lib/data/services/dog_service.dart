import 'dart:io';
import 'package:appnation_sc/core/base/manager/network_manager.dart';
import 'package:appnation_sc/core/constants/app_statics.dart';
import 'package:appnation_sc/core/enum/service_path.dart';
import 'package:appnation_sc/data/models/dog_breed_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class DogService {
  //The function that pulls dog breeds from API and returns the list of dog breeds.
  Future<List<DogBreedModel>> fetchDogBreeds() async {
    final Directory documentDirectory = await getApplicationDocumentsDirectory();

    var allImagesResponse = await NetworkManager.instance.dio.get(
      ServicePath.listAll.subUrl,
      options: Options(responseType: ResponseType.json),
    );

    if (allImagesResponse.statusCode == 200) {
      if (kDebugMode) {
        print("Dog List Fetched: ${allImagesResponse.data}");
      }
      var allImagesData = allImagesResponse.data;
      var breeds = allImagesData["message"] as Map<String, dynamic>;

      List<Future<DogBreedModel>> breedModelFutures = [];
      for (var breed in breeds.keys) {
        var subBreeds = breeds[breed] as List<dynamic>;
        breedModelFutures.add(_createBreedModel(breed, subBreeds, documentDirectory));
      }

      List<DogBreedModel> dogBreeds = await Future.wait(breedModelFutures);
      return dogBreeds;
    } else {
      throw Exception('Failed to load dog breeds');
    }
  }

  //The function that creates a model for a dog breed.
  Future<DogBreedModel> _createBreedModel(
      String breed, List<dynamic> subBreeds, Directory directory) async {
    String imageUrl = await fetchRandomImageUrl(breed);
    File imageFile = await _downloadAndCacheImage(imageUrl, breed, directory);
    return DogBreedModel(
      name: breed,
      image: imageFile,
      subBreeds: subBreeds.map((subBreed) => subBreed.toString()).toList(),
    );
  }

  //A random picture of a dog race attracts the url.
  Future<String> fetchRandomImageUrl(String breed) async {
    final response = await NetworkManager.instance.dio.get(
      '${AppStatics.breedBaseUrl}$breed/${ServicePath.imagesRandom.subUrl}',
      options: Options(responseType: ResponseType.json),
    );

    if (response.statusCode == 200) {
      return response.data["message"];
    } else {
      throw Exception('Failed to fetch random image URL for breed: $breed');
    }
  }

  //Downloads a picture and saves it to the file system of the device.
  Future<File> _downloadAndCacheImage(String imageUrl, String breed, Directory directory) async {
    String filePath = '${directory.path}/cached_image_$breed.jpg';
    File file = File(filePath);

    if (await file.exists()) {
      return file;
    } else {
      final response = await NetworkManager.instance.dio.get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        await file.create(recursive: true);
        await file.writeAsBytes(response.data);
        return file;
      } else {
        throw Exception('Failed to download image for breed: $breed');
      }
    }
  }
}
