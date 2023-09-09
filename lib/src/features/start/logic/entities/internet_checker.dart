enum InternetConnectionState { wifi, mobile, lan, vpn, none, undefined }

abstract class _InternetChecker<T> {
  bool hasInternetConnection;
  T connectivityStatus;
  _InternetChecker({
    required this.hasInternetConnection,
    required this.connectivityStatus,
  });
}

class InternetCheckerEntity
    implements _InternetChecker<InternetConnectionState> {
  @override
  InternetConnectionState connectivityStatus;

  @override
  bool hasInternetConnection;
  InternetCheckerEntity({
    required this.connectivityStatus,
    required this.hasInternetConnection,
  });
}
