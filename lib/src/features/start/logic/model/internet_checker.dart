enum InternetConnectionState { wifi, mobile, lan, none }

abstract class _InternetChecker<T> {
  bool hasInternetConnection;
  T connectivityStatus;
  _InternetChecker({
    required this.hasInternetConnection,
    required this.connectivityStatus,
  });
}

class InternetChecker implements _InternetChecker<InternetConnectionState> {
  @override
  InternetConnectionState connectivityStatus;

  @override
  bool hasInternetConnection;
  InternetChecker({
    required this.connectivityStatus,
    required this.hasInternetConnection,
  });
}
