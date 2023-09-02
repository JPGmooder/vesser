import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rxdart/rxdart.dart';

import 'package:vesser/src/features/start/data/model/internet_checker_model.dart';
import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';
part 'check_internet_connection_status.dart';
part 'check_internet_type_service.dart';



abstract class CheckInternetConnectionService<T> {
  Future<T> get currentConnectionStatus;

  Stream<T> get internetConnectionChanges;
}

class CheckInternetConnectionServiceImpl
    implements CheckInternetConnectionService<InternetCheckerEntity> {
  CheckInternetStatusService statusService;
  CheckInternetTypeService<InternetCheckerEntity> typeService;

  CheckInternetConnectionServiceImpl(
      {required this.statusService, required this.typeService});

  @override
  Stream<InternetCheckerEntity> get internetConnectionChanges =>
      throw UnimplementedError();

  @override
  Future<InternetCheckerEntity> get currentConnectionStatus async {
    var connectionStatus =
        await statusService.internetConnectionStatusChanges.last;
    var connectionType = await typeService.internetConnectionTypeChanges.last;
    connectionType.hasInternetConnection = connectionStatus;
    return connectionType;
  }
}



