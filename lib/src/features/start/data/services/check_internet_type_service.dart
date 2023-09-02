part of 'check_internet_connection_service.dart';

abstract class CheckInternetTypeService<T> {
  CheckInternetTypeService();
  Stream<T> get internetConnectionTypeChanges;
}

class CheckInternetTypeServiceImpl
    implements CheckInternetTypeService<InternetCheckerModel> {
  Connectivity connectionSource;
  CheckInternetTypeServiceImpl({
    required this.connectionSource,
  });
  
  @override
  Stream<InternetCheckerModel> get internetConnectionTypeChanges {
    return connectionSource.onConnectivityChanged.map((event) {
      late InternetConnectionState connectionState;
      switch (event) {
        case ConnectivityResult.wifi:
          connectionState = InternetConnectionState.wifi;
          break;
        case ConnectivityResult.vpn:
          connectionState = InternetConnectionState.vpn;
          break;
        case ConnectivityResult.ethernet:
          connectionState = InternetConnectionState.lan;
          break;
        case ConnectivityResult.mobile:
          connectionState = InternetConnectionState.mobile;
          break;
        case ConnectivityResult.none:
          connectionState = InternetConnectionState.none;
          break;
        default:
          connectionState = InternetConnectionState.lan;
      }
      return InternetCheckerModel(
          connectivityStatus: connectionState, hasInternetConnection: false);
    });
  }
}
