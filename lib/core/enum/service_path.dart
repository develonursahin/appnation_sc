enum ServicePath {
  listAll,
  imagesRandom,
}

extension ServicePathExtension on ServicePath {
  String get subUrl {
    switch (this) {
      case ServicePath.listAll:
        return 'list/all';
      case ServicePath.imagesRandom:
        return 'images/random';
    }
  }
}
