part of 'check_internet_connection_service.dart';

abstract class CheckInternetStatusService {
  Stream<bool> get internetConnectionStatusChanges;
}

class CheckInternetStatusServiceImpl implements CheckInternetStatusService {
  InternetConnection connectionSource;
  CheckInternetStatusServiceImpl({
    required this.connectionSource,
  });

  @override
  Stream<bool> get internetConnectionStatusChanges =>
      connectionSource.onStatusChange.map((event) {
        switch (event) {
          case InternetStatus.connected:
            return true;
          case InternetStatus.disconnected:
            return false;
          default:
            throw UnimplementedError();
        }
      });
}
