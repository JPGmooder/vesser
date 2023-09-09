import 'dart:developer';

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
    implements CheckInternetConnectionService<InternetCheckerModel> {
  CheckInternetStatusService statusService;
  CheckInternetTypeService<InternetCheckerModel> typeService;

  CheckInternetConnectionServiceImpl(
      {required this.statusService, required this.typeService});

  @override
  Stream<InternetCheckerModel> get internetConnectionChanges {
    var statusStream = statusService.internetConnectionStatusChanges;
    var typeStream = typeService.internetConnectionTypeChanges;

    var resultStream = typeStream
        .withLatestFrom<bool, InternetCheckerModel>(statusStream, (t, s) {
          t.hasInternetConnection = s;
          return t;
        })
        .onErrorReturn(InternetCheckerModel(
            connectivityStatus: InternetConnectionState.undefined,
            hasInternetConnection: false))
        .doOnError((p0, p1) {
          log("Error! Stacktrace: ${p1.toString()}, Error: ${p0.toString()}");
        });
    return resultStream;
  }

  @override
  Future<InternetCheckerModel> get currentConnectionStatus async {
    var connectionStatus =
        await statusService.internetConnectionStatusChanges.last;
    var connectionType = await typeService.internetConnectionTypeChanges.last;
    connectionType.hasInternetConnection = connectionStatus;
    return connectionType;
  }
}
