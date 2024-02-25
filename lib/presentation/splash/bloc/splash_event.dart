class SplashEvent {
  const SplashEvent();
  factory SplashEvent.fetchData() => const SplashFetchDataEvent();
}

class SplashFetchDataEvent extends SplashEvent {
  const SplashFetchDataEvent() : super();
}
